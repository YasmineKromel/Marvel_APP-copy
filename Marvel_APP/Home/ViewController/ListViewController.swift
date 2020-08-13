//
//  ListViewController.swift
//  Marvel_APP
//
//  Created by mac on 8/11/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import UIKit



class ListViewController: UIViewController,UpdateListViewDelegate ,CellRegister {
   
    lazy var presenter = HomePresenter(controllerDelegate: self)
    
    @IBOutlet weak var tableView: UITableView!
    
    func registerCell() {
           tableView.register(UINib(nibName: NibNames.ListCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.ListTableViewCell)
       }

    
   func updateList() {
    print("ListView updated ")
    self.tableView.reloadData()
   }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.GetCharactersList()
        registerCell()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
    }
    
    func SetNavigationBar()
    {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom) as! UIButton
            button.setImage(UIImage(named: "icn-nav-search.pdf")?.withRenderingMode(.alwaysOriginal), for: .normal)
                   //add function for button
        button.addTarget(self, action: "SearchButtonPressed", for: .touchUpInside)
                   //set frame
            button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
            let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func SearchButtonPressed()
    {
    self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
   func SetTitleImage()
   {
    let logo = UIImage(named:"marvel.pdf")?.withRenderingMode(.alwaysOriginal)
    let imageView = UIImageView(image:logo)
    let view = UIView()
    self.navigationItem.titleView = view
    self.navigationItem.titleView?.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
    
   }
    override func viewWillAppear(_ animated: Bool) {
        SetNavigationBar()
        SetTitleImage()
    }

 
   

}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.GetCharactersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.ListTableViewCell, for: indexPath) as! HomeTableViewCell
        cell.Poster.image = presenter.GetCharacterPoster(at: indexPath.row).image
        cell.title.text = presenter.GetCharacterName(at: indexPath.row)
      
        return cell
    }
    
    
}

