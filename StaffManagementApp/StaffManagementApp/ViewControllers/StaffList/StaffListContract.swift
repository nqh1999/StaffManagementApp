//
//  StaffListContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewStaffListProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterStaffListProtocol)
}


// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterStaffListProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorStaffListProtocol)
    func setRouter(router: PresenterToRouterStaffListProtocol)
    func getStaffDataForIndex(index: Int) -> StaffModel
    func getNumberOfStaffData() -> Int
    func goToProfileDetail(index: Int)
    func filterData(text: String)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorStaffListProtocol: AnyObject {
    func getNumberOfStaffData() -> Int
    func getDetailDataForIndex(index: Int) -> [String:String]
    func getStaffDataForIndex(index: Int) -> StaffModel
    func filterData(text: String)
}


// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterStaffListProtocol: AnyObject {
    
}


// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterStaffListProtocol: AnyObject {
    func goToProfileDetailVC(view: PresenterToViewStaffListProtocol, data: [String:String])
}
