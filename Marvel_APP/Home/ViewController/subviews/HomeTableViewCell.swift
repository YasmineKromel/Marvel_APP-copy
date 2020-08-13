//
//  HomeTableViewCell.swift
//  Marvel_APP
//
//  Created by mac on 8/11/20.
//  Copyright © 2020 Yasmine. All rights reserved.
//

import UIKit

class HomeTableViewCell:
UITableViewCell {

    
    @IBOutlet weak var Poster: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
