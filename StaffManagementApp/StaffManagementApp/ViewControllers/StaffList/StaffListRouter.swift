//
//  StaffListRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit
import Swinject

class StaffListRouter: PresenterToRouterStaffListProtocol {
    func goToProfileDetailVC(view: PresenterToViewStaffListProtocol, data: [String:String]) {
        print("debug")
        guard let view = view as? StaffListVC else { return }
        let profileDetailVC = Container.shared.resolve(ProfileDetailVC.self, argument: data)!
        view.navigationController?.pushViewController(profileDetailVC, animated: true)
    }
}
