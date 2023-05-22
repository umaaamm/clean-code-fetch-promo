//
//  PromoUseCase.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation

protocol PromoUseCase {
    func getPromoList(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ())
}

class PromoUseCaseImpl: PromoUseCase {
    
    private let fetcher: PromoFetcher
    
    init(fetcher: PromoFetcher) {
        self.fetcher = fetcher
    }
    
    func getPromoList(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ()) {
        fetcher.fetchPromo(completion: completion)
    }
    
}
