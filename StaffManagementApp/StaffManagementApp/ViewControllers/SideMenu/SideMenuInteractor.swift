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
        self.staffData.setCurrentAccount(email: email, password: password)
    }
    func getCurrentAccount() -> UserModel {
        return self.staffData.getCurrentAccount()
    }
    func getDetailData() -> [String:String] {
        self.staffData.mappingByEmail(email: self.staffData.getCurrentAccount().email)
        return self.staffData.getDetailData()
    }
    func getNumberOfSideMenuData() -> Int {
        return self.sideMenuData.getSideMenuData().count
    }
    func getSideMenuDataForIndex(index: Int) -> SideMenuModel {
        return self.sideMenuData.getSideMenuData()[index]
    }
}
