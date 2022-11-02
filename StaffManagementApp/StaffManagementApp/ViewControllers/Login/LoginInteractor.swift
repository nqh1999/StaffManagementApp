//
//  LoginInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//  
//

import Foundation

class LoginInteractor: PresenterToInteractorLoginProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterLoginProtocol?
    private var userData = UserData()
    
    // MARK: - Init
    init(presenter: InteractorToPresenterLoginProtocol) {
        self.presenter = presenter
    }
    
    func checkLogin(email: String, password: String) {
        let result = self.userData.validateResult(email: email, password: password)
        if result == nil {
            userData.setCurrentAccount(email: email, password: password)
        }
        self.presenter?.didGetLoginResult(result: result)
    }
    
    func resetPassword(email: String, password: String) {
        userData.resetPassword(email: email, pass: password)
    }
    
    func getCurrentAccount() -> UserModel {
        return self.userData.getCurrentAccount()
    }
}
