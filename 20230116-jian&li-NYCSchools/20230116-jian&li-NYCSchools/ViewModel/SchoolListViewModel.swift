//
//  SchoolListViewModel.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

class SchoolListViewModel: ObservableObject {
    // schools cach, cach the schools list information
    var schollsPublisher:Published<[SchoolModel]>.Publisher{$schools}
    var networkManager: NetworkManagerProtocol = NetworkManager()
    
    @Published var schools = [SchoolModel]()
    // sats cach, catch the shcoool's SAT information for later used
    @Published var sats = [SchoolSATModel]()
    
    @MainActor
    init(){
        // load data frome network
        Task{
            do {
                let data = try await networkManager.downloadListSchoolData()
                self.schools = try JSONDecoder().decode([SchoolModel].self, from: data)
            }catch(let e){
                print(e.localizedDescription)
            }
        }
        // load SAT score
        do {
            try networkManager.downloadSATSchoolData{ data in
                self.loadSATData(data: data)
            }
            print("load data success!")
        }catch(let e){
            print(e)
        }
    }
    
    init(data:Data){
        do{
            self.schools = try JSONDecoder().decode([SchoolModel].self, from: data)
        }catch(let e){
            print(e)
        }
    }
    
    func loadSATData(data:Data?){
        guard let data = data
        else{return}
        do{
            //let sstr = String(data: data, encoding: .utf8)!;print(sstr)
            self.sats = try JSONDecoder().decode([SchoolSATModel].self, from: data)
        }catch(let e){
            print(e)
        }
    }
    func getSchoolSAT(id:String)->SchoolSATModel?{
        return self.sats.filter{$0.id == id}.first
    }
    
    // load more infomation
    func loadMore(){
        print("load more!")
        //sleep(3)
    }
}
