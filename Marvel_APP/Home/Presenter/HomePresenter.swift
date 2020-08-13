//
//  HomePresenter.swift
//  Marvel_APP
//
//  Created by mac on 8/11/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import AFNetworking

class HomePresenter {
    
    private var characters = [Result]()
    private var searchList = [Result]()
    
    var Homedelegate : UpdateListViewDelegate
    
    var homeProvider = MoyaProvider<HomeEndPoint>()
    
    init(controllerDelegate :UpdateListViewDelegate) {
        self.Homedelegate = controllerDelegate
        
    }
    
    func GetCharacterPoster(at index:Int) ->UIImageView
    {
        let ImageView = UIImageView()
        
        if let ImagePath =  characters[index].thumbnail?.path {
            if let exten = characters[index].thumbnail?.thumbnailExtension{
                let path = ImagePath + "." + exten.rawValue
            if let ImagePathUrl = URL(string: path){
               // print(ImagePathUrl)
                ImageView.setImageWith(ImagePathUrl, placeholderImage: UIImage(named: "image-not-found"))
                
                }
            }
          
        }
        // print (ImageView.image)
        return ImageView
    }
    
    func GetCharacterName(at index:Int) -> String {
        let name = characters[index].name ?? ""
        return name
    }
    
    func GetCharactersCount() -> Int{
        return characters.count 
    }

    
    func GetCharactersList()
    {
        homeProvider.request(.Characters){ [weak self] result in
            guard let self = self else { return }
           // debugPrint("Response: \(response)")
            switch result{
            case .failure(let error):
                print(error)
            case .success(let response):
                do {
                    let charctersList = try! JSONDecoder().decode(CharactersResponse.self, from: response.data)
                    
                        self.characters = charctersList.data.results
                   // print(self.characters.count)
                    self.Homedelegate.updateList()
                    
                }//closing of do
                catch{
                   print(error)
                }//closing of catch
            }
        }
    }
    
   
    
}
