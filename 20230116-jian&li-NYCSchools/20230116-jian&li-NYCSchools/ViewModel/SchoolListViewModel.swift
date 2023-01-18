//
//  SchoolListViewModel.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

class SchoolListViewModel: ObservableObject {
    // schools catch
    var schollsPublisher:Published<[SchoolModel]>.Publisher{$schools}
    
    @Published var schools = [SchoolModel]()
    // sats catch
    @Published var sats = [SchoolSATModel]()
    
    @MainActor
    init(){
        /*
        schools = [SchoolModel(id: "0123", name: "new yourk state", overview: "it is overview", location: "1340 street NR", phone: "233-460-7887", website: "www.empty.com"),
                   SchoolModel(id: "1123", name: "2new yourk state", overview: "2it is overview", location: "21340 street NR", phone: "233-460-7887", website: "www.empty.com"),
        ]*/
        Task{
            do {
                let data = try await NetworkManager.downloadListSchoolData()
                self.schools = try JSONDecoder().decode([SchoolModel].self, from: data)
            }catch(let e){
                print(e.localizedDescription)
            }
        }
        do {
            let data = try NetworkManager.downloadSATSchoolData{ data in
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
    func loadMore(){
        print("load more!")
        //sleep(3)
    }
}
