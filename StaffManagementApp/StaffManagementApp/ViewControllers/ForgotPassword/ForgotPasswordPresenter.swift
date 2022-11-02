//
//  ForgotPasswordPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class ForgotPasswordPresenter: ViewToPresenterForgotPasswordProtocol {

    // MARK: - Properties
    private weak var view: PresenterToViewForgotPasswordProtocol?
    private var interactor: PresenterToInteractorForgotPasswordProtocol?
    private var router: PresenterToRouterForgotPasswordProtocol?
    
    // MARK: - Init

    init(view: PresenterToViewForgotPasswordProtocol) {
        self.view = view
    }
    
    func setInteractor(interactor: PresenterToInteractorForgotPasswordProtocol) {
        self.interactor = interactor
    }

    func setRouter(router: PresenterToRouterForgotPasswordProtocol) {
        self.router = router
    }
    
    // MARK: - Inputs from view
    func goToOtpVC(email: String) {
        guard let view = view else {
            return
        }
        self.router?.goToOtpVC(view: view, email: email)
    }
    
    func backToLoginVC() {
        guard let view = view else {
            return
        }
        self.router?.backToLoginVC(view: view)
    }
    
    func checkEmail(email: String) {
        self.interactor?.checkEmail(email: email)
    }
}

// MARK: - Outputs to view
extension ForgotPasswordPresenter: InteractorToPresenterForgotPasswordProtocol {
    func didGetCheckEmailResult(result: String?) {
        self.view?.didGetCheckEmailResult(result: result)
    }
}
