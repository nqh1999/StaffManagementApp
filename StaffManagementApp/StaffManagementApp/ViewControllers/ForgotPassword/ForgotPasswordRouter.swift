//
//  ForgotPasswordRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit
import Swinject

class ForgotPasswordRouter: PresenterToRouterForgotPasswordProtocol {
    func goToOtpVC(view: PresenterToViewForgotPasswordProtocol, email: String) {
        guard let view = view as? ForgotPasswordVC else {return}
        let vc = Container.shared.resolve(OtpVC.self, argument: email)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func backToLoginVC(view: PresenterToViewForgotPasswordProtocol) {
        guard let view = view as? ForgotPasswordVC else {return}
        view.navigationController?.popToRootViewController(animated: true)
    }
}
