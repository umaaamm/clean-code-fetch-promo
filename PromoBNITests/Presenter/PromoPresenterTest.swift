//
//  PromoPresenterTest.swift
//  PromoBNITests
//
//  Created by Kurniawan Gigih Lutfi Umam on 11/05/23.
//

import XCTest
@testable import PromoBNI

final class PromoPresenterTest: XCTestCase {
    private var sut: PromoPresenterIpl!
    private var usecase: PromoUseCaseMock!
    private var view: PromoViewMock!
    
    override func setUpWithError() throws {
        usecase = PromoUseCaseMock()
        view = PromoViewMock()
        sut = PromoPresenterIpl(usecase: usecase)
        sut.view = view
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetPromoSuccess() throws {
        let dummyResult: PromoEntity = PromoEntity(id: 0, title: "", nama: "", desc: "", lokasi: "", images: PromoImageEntity(name: "", url: ""))
        
        usecase.getPromoStub = .success([dummyResult])
        
        // When
        sut.getPromo()
        
        // Then
        XCTAssertTrue(view.showPromoWasCalled)
        XCTAssertEqual(view.showPromoSpy[0].id, dummyResult.id)
        XCTAssertTrue(view.startFetchingWasCalled)
    }
    
    func testGetPokemonCatalogFailed() throws {
        usecase.getPromoStub = .failure(NetworkError.badRequest)
        
        // When
        sut.getPromo()
        
        // Then
        XCTAssertTrue(view.showErrorMessageWasCalled)
    }
    
}


class PromoUseCaseMock: PromoUseCase {
    var getPromoStub: Result<[PromoEntity], NetworkError>!
    func getPromoList(completion: @escaping (Result<[PromoEntity], NetworkError>) -> ()) {
        completion(getPromoStub)
    }
}


class PromoViewMock: PromoView {
    var startFetchingWasCalled: Bool!
    func startFetching() {
        startFetchingWasCalled = true
    }
    
    var showPromoSpy: [PromoEntity]!
    var showPromoWasCalled: Bool!
    func showPromo(promos: [PromoEntity]) {
        showPromoSpy = promos
        showPromoWasCalled = true
    }
    
    var showErrorMessageWasCalled: Bool!
    func showErrorMessage(message: String) {
        showErrorMessageWasCalled = true
    }
    
    
}
