//
//  OtpInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Foundation

class OtpInteractor: PresenterToInteractorOtpProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterOtpProtocol?
    private var userData = UserData()
    private var email: String = ""
    // MARK: - Init
    init(presenter: InteractorToPresenterOtpProtocol, email: String) {
        self.presenter = presenter
        self.email = email
    }
    
    func initData() {
        self.presenter?.didGetEmail(email: self.email)
    }
    
    func checkOtp(otp: String) {
        self.presenter?.didGetCheckOtpResult(result: self.userData.getOtp() == otp)
    }
    
    func getEmail() -> String {
        return email
    }
}
