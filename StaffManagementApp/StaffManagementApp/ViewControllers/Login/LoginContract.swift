//
//  LoginContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//  
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewLoginProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterLoginProtocol)
    func didGetLoginResult(result: String?)
}
// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorLoginProtocol)
    func setRouter(router: PresenterToRouterLoginProtocol)
    func checkLogin(email: String, password: String)
    func goToHomeVC()
    func goToForgotPasswordVC()
    func goToRegisterVC()
}
// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol: AnyObject {
    func checkLogin(email: String, password: String)
    func resetPassword(email: String, password: String)
    func getCurrentAccount() -> UserModel
}
// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol: AnyObject {
    func didGetLoginResult(result: String?)
}
// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol: AnyObject {
    func goToHomeVC(email: String, password: String)
    func goToForgotPasswordVC(view: PresenterToViewLoginProtocol)
    func goToRegisterVC(view: PresenterToViewLoginProtocol)
}
