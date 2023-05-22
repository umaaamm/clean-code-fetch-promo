//
//  PromoFetcher.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation
import Alamofire

protocol PromoFetcher {
    func fetchPromo(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ())
}

class PromoFetcherImpl: PromoFetcher {
    func fetchPromo(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ()) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8",
            "Accept": "application/json",
            "Content-Type": "application/json" ]
        
        AF.request("\(NetworkConfig.baseUrl)", method: .get)
            .responseDecodable(of: [PromoResponse].self) { response in
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print(utf8Text)
                }
                
                switch response.result {
                case .success(let promoResponse):
                    var promoEntities: [PromoEntity] = []
                    promoEntities = promoResponse.compactMap { promoResponse in
                        return PromoEntity(id: promoResponse.id ?? 0, title: promoResponse.title ?? "", nama: promoResponse.nama ?? "", desc: promoResponse.desc ?? "", lokasi: promoResponse.lokasi ?? "", images: PromoImageEntity(name: promoResponse.img?.name ?? "", url: promoResponse.img?.url ?? ""))
                    }
                    
                    completion(.success(promoEntities))
                case .failure(let error):
                    print(error)
                    completion(.failure(NetworkError.map(response.response?.statusCode ?? 0)))
                    return
                }
            }
    }
}
