//
//  ForgotPasswordContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation
import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewForgotPasswordProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterForgotPasswordProtocol)
    func didGetCheckEmailResult(result: String?)
}


// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterForgotPasswordProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorForgotPasswordProtocol)
    func setRouter(router: PresenterToRouterForgotPasswordProtocol)
    func checkEmail(email: String)
    func goToOtpVC(email: String)
    func backToLoginVC()
}


// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorForgotPasswordProtocol: AnyObject {
    func checkEmail(email: String)
}


// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterForgotPasswordProtocol: AnyObject {
    func didGetCheckEmailResult(result: String?)
}


// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterForgotPasswordProtocol: AnyObject {
    func goToOtpVC(view: PresenterToViewForgotPasswordProtocol, email: String)
    func backToLoginVC(view: PresenterToViewForgotPasswordProtocol)
}
