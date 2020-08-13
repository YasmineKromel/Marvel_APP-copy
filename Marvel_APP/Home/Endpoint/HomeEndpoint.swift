//
//  HomeEndpoint.swift
//  Marvel_APP
//
//  Created by mac on 8/11/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum HomeEndPoint {
    case Characters
}

extension HomeEndPoint: TargetType{
    
    var baseURL: URL {
        switch self {
        case .Characters:
            return URL(string: Urls.ListOfCharactersURL)!
        }
    }
    
    var path: String {
        switch self {
        case .Characters:
            return ""
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Characters:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
//    var parameters: [String : Any]? {
//        switch self {
//        case .Characters:
//            return [ParametersNames.apiKey:Keys.public_Key]
//        }
//    }
    var task: Task {
        switch self {
        case .Characters:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .Characters:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
