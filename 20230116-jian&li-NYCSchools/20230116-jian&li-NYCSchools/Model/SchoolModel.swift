//
//  SchoolModel.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

struct SchoolModel: Identifiable, Codable, Equatable {
    var id:String
    var name:String
    var overview:String
    var location:String
    var phone:String
    var email:String?
    var website:String
    
    enum CodingKeys: String,CodingKey {
        case id = "dbn"
        case name = "school_name"
        case overview = "overview_paragraph"
        case location
        case phone = "phone_number"
        case email = "school_email"
        case website
    }
}
