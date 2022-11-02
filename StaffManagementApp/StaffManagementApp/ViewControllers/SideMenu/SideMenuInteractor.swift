//
//  SideMenuInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import Foundation

class SideMenuInteractor: PresenterToInteractorSideMenuProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterSideMenuProtocol?
    private var sideMenuData = SideMenuData()
    private var staffData = StaffData()
    
    // MARK: - Init
    init(presenter: InteractorToPresenterSideMenuProtocol, email: String, password: String) {
        self.presenter = presenter
        staffData.setCurrentAccount(email: email, password: password)
    }
    
    func getCurrentAccount() -> UserModel {
        return staffData.getCurrentAccount()
    }
    
    func getDetailData() -> [String:String] {
        staffData.mappingByEmail(email: staffData.getCurrentAccount().email)
        return staffData.getDetailData()
    }
    
    func getNumberOfSideMenuData() -> Int {
        return sideMenuData.getSideMenuData().count
    }
    
    func getSideMenuDataForIndex(index: Int) -> SideMenuModel {
        return sideMenuData.getSideMenuData()[index]
    }
}
