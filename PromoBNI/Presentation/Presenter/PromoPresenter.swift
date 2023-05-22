//
//  PromoPresenter.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation

protocol PromoPresenter: AnyObject {
    var view: PromoView? { get set }
    func getPromo()
}

class PromoPresenterIpl: PromoPresenter {    
    private let usecase: PromoUseCase
    weak var view: PromoView?

    init(usecase: PromoUseCase) {
        self.usecase = usecase
    }

    func getPromo() {
        view?.startFetching()
        usecase.getPromoList() { [weak self] result in
            switch result {
            case .success(let promo):
               
                self?.view?.showPromo(promos: promo)
            case .failure(_):
                self?.view?.showErrorMessage(message: "Failed to load data, please check your internet connection & try again")
            }
        }
    }
}
