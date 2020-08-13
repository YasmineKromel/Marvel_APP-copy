//
//  SearchPresenter.swift
//  Marvel_APP
//
//  Created by mac on 8/13/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//
import Foundation
import Moya
import Alamofire
import AFNetworking

class SearchPresenter {
    
    private var Searchcharacters = [Result]()
    private var searchList = [Result]()
    
    var Searchdelegate : SearchViewDelegate
    var searchProvider = MoyaProvider<HomeEndPoint>()
    
    init(controllerDelegate :SearchViewDelegate) {
         self.Searchdelegate = controllerDelegate
     }
    
   
    
func GetCharactersList()
{
    Searchdelegate.showLoader()
  searchProvider.request(.Characters){ [weak self] result in
    guard let self = self else { return }
              // debugPrint("Response: \(response)")
    self.Searchdelegate.hideLoader()
    switch result{
               case .failure(let error):
                   print(error)
               case .success(let response):
                   do {
                       let charctersList = try! JSONDecoder().decode(CharactersResponse.self, from: response.data)
                       
                           self.Searchcharacters = charctersList.data.results
                      // print(self.characters.count)
                       //self.Searchdelegate.updateList()
                       
                   }//closing of do
                   catch{
                      print(error)
                   }//closing of catch
               }
           }
}
    
    
    func search(input text:String){
           for item in Searchcharacters{
               if let element = item.name{
                if element.contains(text){
                   searchList.append(item)
               }
           }
           print(searchList.count)
           self.Searchdelegate.updateList()
       }
    }

       func GetSearchCount()->Int{
           print ("search Count \(searchList.count)")
           return searchList.count
       }
       
       func GetNames(at index:Int) -> String {
           let name = searchList[index].name ?? ""
           return name
       }
       
       func GetImages(at index:Int) ->UIImageView
          {
              let ImageView = UIImageView()
              
              if let ImagePath =  searchList[index].thumbnail?.path {
                  if let exten = searchList[index].thumbnail?.thumbnailExtension{
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
    
    func ClearList()
    {
        self.searchList.removeAll()
        print (searchList.count)
        self.Searchdelegate.updateList()
        
    }
       
}//closing of searchPresenter class 
