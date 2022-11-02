//
//  SideMenuContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import Foundation
import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewSideMenuProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterSideMenuProtocol)
}


// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterSideMenuProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorSideMenuProtocol)
    func setRouter(router: PresenterToRouterSideMenuProtocol)
    func getNumberOfSideMenuData() -> Int
    func getDataForIndex(index: Int) -> SideMenuModel
    func goToHomeVC()
    func goToStaffListVC()
    func goToProfileVC()
    func goToLoginVC()
}


// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSideMenuProtocol: AnyObject {
    func getCurrentAccount() -> UserModel
    func getDetailData() -> [String:String]
    func getNumberOfSideMenuData() -> Int
    func getSideMenuDataForIndex(index: Int) -> SideMenuModel
}


// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSideMenuProtocol: AnyObject {
    
}


// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterSideMenuProtocol: AnyObject {
    func goToHomeVC(view: PresenterToViewSideMenuProtocol)
    func goToStaffListVC(view: PresenterToViewSideMenuProtocol)
    func goToProfileVC(view: PresenterToViewSideMenuProtocol, data: [String:String], acc: UserModel)
    func goToLoginVC()
}
