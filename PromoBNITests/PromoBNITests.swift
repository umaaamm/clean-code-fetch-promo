//
//  PromoBNITests.swift
//  PromoBNITests
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import XCTest
@testable import PromoBNI

final class PromoBNITests: XCTestCase {
    
    var navigationController: UINavigationController!
    private var sut: PromoViewController!
    private var detail: DetailPromoViewController!
    private var presenter: PromoPresenterMock!

    override func setUpWithError() throws {
        presenter = PromoPresenterMock()
        let viewController: PromoViewController = PromoViewController(nibName: "PromoView", bundle: nil)
        let navigation = UINavigationController(rootViewController: viewController)

        let window = UIWindow(frame: UIScreen.main.bounds)
        
        viewController.presenter = presenter
        
        sut = viewController
        window.makeKeyAndVisible()
        window.rootViewController = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDidload() throws {
        sut.viewDidLoad()
        sut.presenter?.getPromo()
        sut.startFetching()
    }
    
    func goToDetail() throws {
        let data = PromoEntity(id: 1, title: "Promo BNI", nama: "Promo BNI Kredit", desc: "Ini Adalah Promo", lokasi: "malang", images: PromoImageEntity(name: "images promo", url: "https://strapi-jkt-digi46.s3.ap-southeast-3.amazonaws.com/bni_credit_card_apply_kk_via_mobile_small_e1e8aaf172.jpg"))
        detail.showData(promo: data)
    }

}

class PromoPresenterMock: PromoPresenter {
    var view: PromoBNI.PromoView?
    var getPromoWasCalled: Bool!
    func getPromo() {
        getPromoWasCalled = true
    }
}
