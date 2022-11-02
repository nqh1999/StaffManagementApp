//
//  OtpPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Foundation

class OtpPresenter: ViewToPresenterOtpProtocol {

    // MARK: - Properties
    private weak var view: PresenterToViewOtpProtocol?
    private var interactor: PresenterToInteractorOtpProtocol?
    private var router: PresenterToRouterOtpProtocol?
    
    // MARK: - Init

    init(view: PresenterToViewOtpProtocol) {
        self.view = view
    }
    
    func setInteractor(interactor: PresenterToInteractorOtpProtocol) {
        self.interactor = interactor
    }

    func setRouter(router: PresenterToRouterOtpProtocol) {
        self.router = router
    }
    
    // MARK: - Inputs from view
    func viewDidLoad() {
        self.interactor?.initData()
    }
    
    func checkOtp(otp: String) {
        self.interactor?.checkOtp(otp: otp)
    }
    
    func goToResetPasswordVC() {
        guard let view = view else { return }
        self.router?.goToResetPassword(view: view, email: self.interactor!.getEmail())
    }
}

// MARK: - Outputs to view
extension OtpPresenter: InteractorToPresenterOtpProtocol {
    func didGetEmail(email: String) {
        self.view?.didGetEmail(email: email)
    }
    
    func didGetCheckOtpResult(result: Bool) {
        self.view?.didGetCheckOtpResult(result: result)
    }
}
