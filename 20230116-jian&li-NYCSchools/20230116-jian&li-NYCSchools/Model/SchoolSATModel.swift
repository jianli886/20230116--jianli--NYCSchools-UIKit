//
//  SchoolSATModel.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

struct SchoolSATModel: Decodable {
    var id:String
    var name:String
    var numOfSAT:String
    var readingAvgScore:String
    var mathAvgScore:String
    var writingAvgScore:String
    
    enum CodingKeys:String,CodingKey{
        case id = "dbn"
        case name = "school_name"
        case numOfSAT = "num_of_sat_test_takers"
        case readingAvgScore = "sat_critical_reading_avg_score"
        case mathAvgScore = "sat_math_avg_score"
        case writingAvgScore = "sat_writing_avg_score"
    }
}
