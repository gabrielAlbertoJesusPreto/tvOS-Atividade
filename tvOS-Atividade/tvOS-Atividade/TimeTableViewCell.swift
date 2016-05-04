//
//  TimeTableViewCell.swift
//  tvOS-Atividade
//
//  Created by Gabriel Alberto de Jesus Preto on 02/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var posicaoLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var jogosLabel: UILabel!
    @IBOutlet weak var vitoriasLabel: UILabel!
    @IBOutlet weak var derrotasLabel: UILabel!
    @IBOutlet weak var empatesLabel: UILabel!
    @IBOutlet weak var pontosLabel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
