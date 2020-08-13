//
//  Constants.swift
//  Marvel_APP
//
//  Created by mac on 8/11/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import Foundation
import CryptoSwift

struct Keys
{
     static let publicKey = "c9a8bf68c736d5a9710c0d0a26c2fb65"
     static let privateKey = "07b998b5f266b31e6b77640dc3e9fe5cf84e920b"
    static let tsValue = timestamp()
    static let hashString = String(tsValue)+privateKey+publicKey
    static let hashValue = hashString.md5()
    static let limitValue = "10"
        
}

func timestamp() -> String {
    return String(format: "%.0f", NSDate().timeIntervalSince1970)
}



struct ParametersNames {
    static let limit:String = "&limit="
    static let timeStamp:String = "ts="
    static let apiKey:String = "&apikey="
    static let hash:String = "&hash="
    static let offset:String = "offset"
}

struct Urls
{
   // static let baseURL = "https://gateway.marvel.com/v1/public/characters?"
   static let baseURL = "https://gateway.marvel.com:443/v1/public/characters?"
    
    static let ListOfCharactersURL = baseURL + ParametersNames.timeStamp + Keys.tsValue + ParametersNames.apiKey + Keys.publicKey + ParametersNames.hash + Keys.hashValue + ParametersNames.limit + Keys.limitValue
}



struct CellIdentifiers {
    static var ListTableViewCell = "HomeTableViewCell"
    static var SearchTableViewCell = "SearchTableViewCell"
    
}

struct NibNames
{
    static var ListViewController = "ListViewController"
    static var ListCell = "HomeTableViewCell"
    static var SearchCell = "SearchTableViewCell"
    
    
}
