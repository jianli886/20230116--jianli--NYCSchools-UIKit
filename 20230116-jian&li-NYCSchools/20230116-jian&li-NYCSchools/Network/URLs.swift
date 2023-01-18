//
//  URLs.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import Foundation

enum URLs {
    case strListSchool
    case strSATTotal
    case strSATAPI(String)
    
    var string: String {
        switch self {
        case .strListSchool:
            return "https://data.cityofnewyork.us/api/id/s3k6-pzi2.json?$query=select%20*%2C%20%3Aid%20limit%20100"
        case .strSATTotal:
            return "https://data.cityofnewyork.us/api/id/f9bf-2cp4.json?$select=`dbn`,`school_name`,`num_of_sat_test_takers`,`sat_critical_reading_avg_score`,`sat_math_avg_score`,`sat_writing_avg_score`&$order=`:id`+ASC&$limit=478&$offset=0".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        case .strSATAPI(let key):
            return "https://data.cityofnewyork.us/api/id/f9bf-2cp4.json?$select=" + "'\(key)'"
        }
        
    }
}
