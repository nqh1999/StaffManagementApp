//
//  OtpContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewOtpProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterOtpProtocol)
    func didGetEmail(email: String)
    func didGetCheckOtpResult(result: Bool)
}
// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterOtpProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorOtpProtocol)
    func setRouter(router: PresenterToRouterOtpProtocol)
    func viewDidLoad()
    func checkOtp(otp: String)
    func goToResetPasswordVC()
}
// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOtpProtocol: AnyObject {
    func initData()
    func checkOtp(otp: String)
    func getEmail() -> String
}
// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOtpProtocol: AnyObject {
    func didGetEmail(email: String)
    func didGetCheckOtpResult(result: Bool)
}
// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterOtpProtocol: AnyObject {
    func goToResetPassword(view: PresenterToViewOtpProtocol, email: String)
}
