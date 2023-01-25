//
//  NetworkManager.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation
import Alamofire

public protocol NetworkManagerProtocol {
    func downloadListSchoolData() async throws -> Data
    func downloadSATSchoolData(completionHandler:@escaping  (Data?)->Void) throws
}

class NetworkManager: NetworkManagerProtocol {
    
    // used native method to download
   public func downloadListSchoolDataNative() async throws -> Data{
        guard let url = URL(string:URLs.strListSchool.string)
        else{throw NSError(domain: "bad url:\(URLs.strListSchool.string)", code: -1)}
        let (data,_) = try await URLSession.shared.data(from:url)
        return data
    }
    
    // used alamofire method to download
    public func downloadListSchoolData() async throws -> Data{
        guard let url = URL(string:URLs.strListSchool.string)
        else{throw NSError(domain: "bad url:\(URLs.strListSchool.string)", code: -1)}
        let data: Data = try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate().responseData { response in
                if let data = response.data {
                    continuation.resume(returning: data)
                }
                if let error = response.error {
                    continuation.resume(throwing: error)
                }
            }
        }
        return data
    }
    
    // download SAT from server
    public func downloadSATSchoolData(completionHandler:@escaping  (Data?)->Void) throws {
        guard let url = URL(string: URLs.strSATTotal.string)
        else{throw NSError(domain: "bad url:\(URLs.strSATTotal.string)", code: -1)}
        URLSession.shared.dataTask(with:url){data,res,e in
            completionHandler(data)
        }.resume()
    }
}
// MARK: mock data for TDD
class MockNetworkManager: NetworkManagerProtocol {
    func downloadListSchoolData() async throws -> Data {
        let schools = [SchoolModel(id: "0123", name: "new yourk state", overview: "it is overview", location: "1340 street NR", phone: "233-460-7887", website: "www.empty.com"),
                   SchoolModel(id: "1123", name: "2new yourk state", overview: "2it is overview", location: "21340 street NR", phone: "233-460-7887", website: "www.empty.com"),
        ]
        return (try? JSONEncoder().encode(schools)) ?? Data()
    }
    
    func downloadSATSchoolData(completionHandler: @escaping (Data?) -> Void) throws {
        
    }
    

}
