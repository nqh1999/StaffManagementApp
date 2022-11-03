//
//  ResetPasswordPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Foundation

class ResetPasswordPresenter: ViewToPresenterResetPasswordProtocol {
    // MARK: - Properties
    private weak var view: PresenterToViewResetPasswordProtocol?
    private var interactor: PresenterToInteractorResetPasswordProtocol?
    private var router: PresenterToRouterResetPasswordProtocol?
    // MARK: - Init
    init(view: PresenterToViewResetPasswordProtocol) {
        self.view = view
    }
    func setInteractor(interactor: PresenterToInteractorResetPasswordProtocol) {
        self.interactor = interactor
    }
    func setRouter(router: PresenterToRouterResetPasswordProtocol) {
        self.router = router
    }
    // MARK: - Inputs from view
    func comparePassword(password: String, reEnterPassword: String) {
        self.interactor?.comparePassword(password: password, reEnterPassword: reEnterPassword)
    }
    func backToLoginVC() {
        guard let view = self.view else {return}
        self.router?.backToLoginVC(view: view)
    }
}
// MARK: - Outputs to view
extension ResetPasswordPresenter: InteractorToPresenterResetPasswordProtocol {
    func didGetComparePasswordResult(result: String?) {
        self.view?.didGetComparePasswordResult(result: result)
    }
}
