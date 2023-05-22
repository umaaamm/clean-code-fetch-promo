//
//  PromoViewCell.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 11/05/23.
//

import UIKit

class PromoViewCell: UITableViewCell {
    
    @IBOutlet weak var ImgCell: UIImageView!
    @IBOutlet weak var lblNama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
