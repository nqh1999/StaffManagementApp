//
//  LoginRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//  
//

import UIKit
import Swinject
import SideMenu

class LoginRouter: PresenterToRouterLoginProtocol {
    func goToHomeVC(email: String, password: String) {
        let homeVC = Container.shared.resolve(HomeVC.self)!
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController = UINavigationController(rootViewController: homeVC)
        let menu = UISideMenuNavigationController(rootViewController: Container.shared.resolve(SideMenuVC.self, arguments: email, password)!)
        SideMenuManager.default.menuLeftNavigationController = menu
        menu.menuWidth = UIScreen.main.bounds.width * 0.7
    }
    
    func goToRegisterVC(view: PresenterToViewLoginProtocol) {
        print("Register VC")
    }
    
    func goToForgotPasswordVC(view: PresenterToViewLoginProtocol) {
        guard let view = view as? LoginVC else {return}
        let forgotPasswordVC = Container.shared.resolve(ForgotPasswordVC.self)!
        view.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
}

