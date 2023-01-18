//
//  NetworkManager.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

class NetworkManager {
    
    static public func downloadListSchoolData() async throws -> Data{
        guard let url = URL(string:URLs.strListSchool.string)
        else{throw NSError(domain: "bad url:\(URLs.strListSchool.string)", code: -1)}
        let (data,_) = try await URLSession.shared.data(from:url)
        return data
    }
    
    static public func downloadSATSchoolData(completionHandler:@escaping  (Data?)->Void) throws{
        guard let url = URL(string: URLs.strSATTotal.string)
        else{throw NSError(domain: "bad url:\(URLs.strSATTotal.string)", code: -1)}
        URLSession.shared.dataTask(with:url){data,res,e in
            completionHandler(data)
        }.resume()
    }
}
