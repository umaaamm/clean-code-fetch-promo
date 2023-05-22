//
//  PromoUseCaseTest.swift
//  PromoBNITests
//
//  Created by Kurniawan Gigih Lutfi Umam on 11/05/23.
//

import XCTest
@testable import PromoBNI

final class PromoUseCaseTest: XCTestCase {
    var sut: PromoUseCaseImpl!
    var fetcherMock: PromoFetcherMock!
    
    override func setUpWithError() throws {
        fetcherMock = PromoFetcherMock()
        sut = PromoUseCaseImpl(fetcher: fetcherMock)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetPromo() throws {
        // Given
        let promoFetch: PromoEntity =
            PromoEntity(id: 1, title: "Promo BNI", nama: "Promo BNI Kredit", desc: "Ini Adalah Promo", lokasi: "malang", images: PromoImageEntity(name: "images promo", url: "https://strapi-jkt-digi46.s3.ap-southeast-3.amazonaws.com/bni_credit_card_apply_kk_via_mobile_small_e1e8aaf172.jpg"
            )
        )
        
        fetcherMock.fetchPromoStub = .success([promoFetch])
        
        // When
        var actualResult: Result<[PromoEntity], NetworkError>!
        sut.getPromoList() { result in
            actualResult = result
        }
        
        // Then
        switch actualResult {
        case .success(let success):
            XCTAssertEqual(success[0].id, promoFetch.id)
            XCTAssertEqual(success[0].title, promoFetch.title)
            XCTAssertEqual(success[0].nama, promoFetch.nama)
            XCTAssertEqual(success[0].desc, promoFetch.desc)
            XCTAssertEqual(success[0].images.name, promoFetch.images.name)
            XCTAssertEqual(success[0].images.url, promoFetch.images.url)
        case .failure(_):
            assertionFailure("get promo return failure")
        case .none:
            assertionFailure("get promo return .none")
        }
    }
    
}


class PromoFetcherMock: PromoFetcher {
    var fetchPromoStub: Result<[PromoEntity], NetworkError>!
    var fetchPromoWasCalled: Bool!
    func fetchPromo(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ()) {
        fetchPromoWasCalled = true
        completion(fetchPromoStub)
    }
}
