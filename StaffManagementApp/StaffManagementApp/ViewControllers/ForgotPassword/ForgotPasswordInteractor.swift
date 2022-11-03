//
//  ForgotPasswordInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class ForgotPasswordInteractor: PresenterToInteractorForgotPasswordProtocol {
    // MARK: - Properties
    private weak var presenter: InteractorToPresenterForgotPasswordProtocol?
    private var userData = UserData()
    // MARK: - Init
    init(presenter: InteractorToPresenterForgotPasswordProtocol) {
        self.presenter = presenter
    }
    func checkEmail(email: String) {
        self.presenter?.didGetCheckEmailResult(result: self.userData.validateEmail(email: email))
    }
}
