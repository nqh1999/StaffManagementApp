//
//  ResetPasswordContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewResetPasswordProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterResetPasswordProtocol)
    func didGetComparePasswordResult(result: String?)
}
// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterResetPasswordProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorResetPasswordProtocol)
    func setRouter(router: PresenterToRouterResetPasswordProtocol)
    func comparePassword(password: String, reEnterPassword: String)
    func backToLoginVC()
}
// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorResetPasswordProtocol: AnyObject {
    func comparePassword(password: String, reEnterPassword: String)
}
// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterResetPasswordProtocol: AnyObject {
    func didGetComparePasswordResult(result: String?)
}
// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterResetPasswordProtocol: AnyObject {
    func backToLoginVC(view: PresenterToViewResetPasswordProtocol)
}
