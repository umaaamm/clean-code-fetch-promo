//
//  DetailPromoViewController.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 11/05/23.
//

import Foundation
import UIKit

class DetailPromoViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var lblLokasi: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    var promoData: PromoEntity?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitle.text = promoData?.nama
        lblDesc.text = promoData?.desc
        lblLokasi.text = "Lokasi : "+(promoData?.lokasi ?? "")
        imageDetail.loadFrom(URLAddress: promoData?.images.url ?? "")
    }
    
    func showData(promo: PromoEntity) {
        self.promoData =  promo
    }
}
