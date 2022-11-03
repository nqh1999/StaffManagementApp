//
//  DataSideMenu.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import Foundation

struct SideMenuModel {
    var imgItem: String?
    var title: String?
}

class SideMenuData {
    private var sideMenuData: [SideMenuModel] = [
        SideMenuModel(imgItem: "home", title: "Home"),
        SideMenuModel(imgItem: "profile", title: "Profile"),
        SideMenuModel(imgItem: "group", title: "Staff List"),
        SideMenuModel(imgItem: "logout", title: "Log Out")
    ]
    func getSideMenuData() -> [SideMenuModel] {
        return sideMenuData
    }
}
