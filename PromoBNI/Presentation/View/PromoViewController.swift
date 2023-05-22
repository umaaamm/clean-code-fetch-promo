//
//  PromoViewController.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation
import UIKit


protocol PromoView: AnyObject {
    func startFetching()
    func showPromo(promos: [PromoEntity])
    func showErrorMessage(message: String)
}

public class PromoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: PromoPresenter?
    
    var promos: [PromoEntity] = []
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPromo()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PromoViewCell", bundle: nil), forCellReuseIdentifier: "PromoViewCell")
    }
    
}

extension PromoViewController: PromoView {
    func startFetching() {
        self.LoadingStart()
    }
    
    func showPromo(promos: [PromoEntity]) {
        self.LoadingStop()
        self.promos = promos
        self.tableView.reloadData()
    }
    
    func showErrorMessage(message: String) {
        self.showToast(message: message, font: .systemFont(ofSize: 12.0))
    }
}


extension PromoViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promos.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PromoViewCell", for: indexPath) as? PromoViewCell
        else {
            return UITableViewCell()
        }
        cell.lblNama.text = promos[indexPath.row].nama
        cell.ImgCell.loadFrom(URLAddress: promos[indexPath.row].images.url)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPromoViewController(nibName: "DetailPromoView", bundle: nil)
        vc.showData(promo: promos[indexPath.row])
        guard let navigationController = navigationController else {
            print("This means you current view controller doesn't have a navigation controller")
            return
        }
//
//        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true)
    }
}

