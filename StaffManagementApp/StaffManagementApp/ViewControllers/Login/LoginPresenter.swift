//
//  LoginPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//  
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {
    // MARK: - Properties
    private weak var view: PresenterToViewLoginProtocol?
    private var interactor: PresenterToInteractorLoginProtocol?
    private var router: PresenterToRouterLoginProtocol?
    // MARK: - Init
    init(view: PresenterToViewLoginProtocol) {
        self.view = view
        NotificationCenter.default.addObserver(self, selector: #selector(updatePassword(notification:)), name: .NewData, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: .NewData, object: nil)
    }
    func setInteractor(interactor: PresenterToInteractorLoginProtocol) {
        self.interactor = interactor
    }
    func setRouter(router: PresenterToRouterLoginProtocol) {
        self.router = router
    }
    // MARK: - Inputs from view
    func goToHomeVC() {
        guard let interactor = self.interactor else {return}
        self.router?.goToHomeVC(email: interactor.getCurrentAccount().email, password: interactor.getCurrentAccount().password)
    }
    func goToForgotPasswordVC() {
        guard let view = self.view else {return}
        self.router?.goToForgotPasswordVC(view: view)
    }
    func goToRegisterVC() {
        guard let view = self.view else {return}
        self.router?.goToRegisterVC(view: view)
    }
    func checkLogin(email: String, password: String) {
        self.interactor?.checkLogin(email: email, password: password)
    }
    @objc private func updatePassword(notification: Notification) {
        let newPass = notification.object as? [String:String] ?? [:]
        guard let email = newPass["email"], let password = newPass["pass"] else {return}
        interactor?.resetPassword(email: email, password: password)
    }
}
// MARK: - Outputs to view
extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func didGetLoginResult(result: String?) {
        self.view?.didGetLoginResult(result: result)
    }
}
extension Notification.Name {
    static var NewData: Notification.Name {
        .init(rawValue: "NewData")
    }
}
