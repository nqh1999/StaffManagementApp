//
//  ProfileContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewProfileProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterProfileProtocol)
}
// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterProfileProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorProfileProtocol)
    func setRouter(router: PresenterToRouterProfileProtocol)
    func getDataForKey(key: String) -> String
    func goToProfileDetailVC()
    func goToHelpVC()
}
// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProfileProtocol: AnyObject {
    func saveCurrentAccount(acc: UserModel)
    func getCurrentAccount() -> UserModel
    func getDetailData() -> [String:String]
    func getDataForKey(key: String) -> String
}
// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProfileProtocol: AnyObject {

}
// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterProfileProtocol: AnyObject {
    func goToProfileDetailVC(view: PresenterToViewProfileProtocol, data: [String:String])
    func goToHelpVC(view: PresenterToViewProfileProtocol)
}
