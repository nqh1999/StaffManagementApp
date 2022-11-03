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
        guard let view = view as? StaffListVC else { return }
        let vc = Container.shared.resolve(ProfileDetailVC.self, argument: data)!
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
