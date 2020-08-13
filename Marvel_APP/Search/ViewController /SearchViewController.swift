//
//  SearchViewController.swift
//  Marvel_APP
//
//  Created by mac on 8/12/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,CellRegister,SearchViewDelegate,UISearchBarDelegate{
    
    
    
    func showLoader() {
        //show loader
        loader.isHidden = false
        loader.startAnimating()
    }
    
    func hideLoader() {
        //hide loader
        loader.startAnimating()
        loader.isHidden = true
    }
    
   
    
    @IBOutlet weak var SearchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    func updateList() {
       // print("SearchList updated ")
        self.SearchTableView.reloadData()
    }
    
  
     lazy var MySearchPresenter = SearchPresenter(controllerDelegate: self)
    
   
    
    func registerCell() {
        SearchTableView.register(UINib(nibName: NibNames.SearchCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.SearchTableViewCell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchTableView.dataSource = self
        SearchTableView.delegate = self
        
        searchBar.delegate = self
        
         registerCell()
        // Do any additional setup after loading the view.
        
        MySearchPresenter.GetCharactersList()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
  
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
    
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty || searchText == "" || searchBar.text == " " {
            self.MySearchPresenter.ClearList()
        }
        else{
              let text = searchBar.text!
            print(text)
            MySearchPresenter.search(input: text)
        }
     }

    
}

extension SearchViewController:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MySearchPresenter.GetSearchCount() 

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.SearchTableViewCell,for: indexPath)as! SearchTableViewCell
        cell.characterImage.image = MySearchPresenter.GetImages(at: indexPath.row).image
        cell.characterLabel.text = MySearchPresenter.GetNames(at: indexPath.row)
        return cell
    }


}

extension SearchViewController:UISearchControllerDelegate{
    func presentSearchController(_ searchController: UISearchController) {
        searchController.isActive = true
        searchController.searchBar.becomeFirstResponder()
    }
    
}
