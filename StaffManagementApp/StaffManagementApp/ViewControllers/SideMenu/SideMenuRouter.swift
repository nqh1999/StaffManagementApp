//
//  SideMenuRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import UIKit
import Swinject

class SideMenuRouter: PresenterToRouterSideMenuProtocol {
    func goToHomeVC(view: PresenterToViewSideMenuProtocol) {
        guard let view = view as? SideMenuVC else { return }
        let vc = Container.shared.resolve(HomeVC.self)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func goToProfileVC(view: PresenterToViewSideMenuProtocol, data: [String:String], acc: UserModel) {
        guard let view = view as? SideMenuVC else { return }
        let vc = Container.shared.resolve(ProfileVC.self, arguments: data, acc)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func goToStaffListVC(view: PresenterToViewSideMenuProtocol) {
        guard let view = view as? SideMenuVC else { return }
        let vc = Container.shared.resolve(StaffListVC.self)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func goToLoginVC() {
        let loginVC = Container.shared.resolve(LoginVC.self)!
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController = UINavigationController(rootViewController: loginVC)
    }
}
