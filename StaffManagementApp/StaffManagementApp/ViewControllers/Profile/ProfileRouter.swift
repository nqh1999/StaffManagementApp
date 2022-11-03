//
//  ProfileRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import UIKit
import Swinject

class ProfileRouter: PresenterToRouterProfileProtocol {
    func goToProfileDetailVC(view: PresenterToViewProfileProtocol, data: [String: String]) {
        guard let view = view as? ProfileVC else {return}
        let vc = Container.shared.resolve(ProfileDetailVC.self, argument: data)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func goToHelpVC(view: PresenterToViewProfileProtocol) {
        print("Help VC")
    }
}
