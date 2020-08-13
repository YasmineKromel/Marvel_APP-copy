//
//  protocols.swift
//  Marvel_APP
//
//  Created by mac on 8/12/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import Foundation

protocol CellRegister {
    func registerCell()
}

protocol UpdateListViewDelegate {
    func updateList()
}

protocol SearchViewDelegate{
    func updateList()
    func showLoader()
    func hideLoader()
    }




