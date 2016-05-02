//
//  MasterTableViewCell.swift
//  tvOS-Atividade
//
//  Created by Humberto  Julião on 02/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    @IBOutlet weak var Campeonatos: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
