//
//  PlaceTableViewCell.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 22/10/2022.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var adressePlace: UILabel!
    @IBOutlet weak var categoriePlace: UILabel!
    @IBOutlet weak var titlePlace: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
