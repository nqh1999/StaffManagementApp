//
//  OtpRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit
import Swinject

class OtpRouter: PresenterToRouterOtpProtocol {
    func goToResetPassword(view: PresenterToViewOtpProtocol, email: String) {
        guard let view = view as? OtpVC else { return }
        let vc = Container.shared.resolve(ResetPasswordVC.self, argument: email)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
