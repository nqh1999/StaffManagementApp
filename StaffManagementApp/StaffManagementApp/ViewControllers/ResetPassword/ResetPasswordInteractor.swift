//
//  ResetPasswordInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Foundation

class ResetPasswordInteractor: PresenterToInteractorResetPasswordProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterResetPasswordProtocol?
    private var userData = UserData()
    private var email: String = ""
    // MARK: - Init
    init(presenter: InteractorToPresenterResetPasswordProtocol, email: String) {
        self.presenter = presenter
        self.email = email
    }
    
    func comparePassword(password: String, reEnterPassword: String) {
        let newData = ["email" : self.email, "pass" : password]
        let result = self.userData.checkNewPassword(pass: password, reEnterPassword: reEnterPassword)
        if result == nil {
            NotificationCenter.default.post(name: .NewData, object: newData)
        }
        self.presenter?.didGetComparePasswordResult(result: result)
    }
}
