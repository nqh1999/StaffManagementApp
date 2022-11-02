//
//  DataSideMenu.swift
//  SES-IOS
//
//  Created by Admin on 18/08/2022.
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
