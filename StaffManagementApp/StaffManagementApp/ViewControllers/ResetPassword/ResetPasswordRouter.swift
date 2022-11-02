//
//  ResetPasswordRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit
import Swinject

class ResetPasswordRouter: PresenterToRouterResetPasswordProtocol {
    func backToLoginVC(view: PresenterToViewResetPasswordProtocol) {
        guard let view = view as? ResetPasswordVC else {return}
        view.navigationController?.popToRootViewController(animated: true)
    }
}
