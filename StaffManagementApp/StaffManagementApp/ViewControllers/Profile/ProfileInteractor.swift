//
//  ProfileInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import Foundation

class ProfileInteractor: PresenterToInteractorProfileProtocol {

    private weak var presenter: InteractorToPresenterProfileProtocol?
    private var staffData = StaffData()
    private var userData = UserData()
    // MARK: - Init
    init(presenter: InteractorToPresenterProfileProtocol, data: [String:String], acc: UserModel) {
        self.presenter = presenter
        self.staffData.setDetailData(data: data)
        self.staffData.setCurrentAccount(email: acc.email, password: acc.password)
    }
    
    func getDetailData() -> [String:String] {
        return self.staffData.getDetailData()
    }
    
    func getCurrentAccount() -> UserModel {
        return self.staffData.getCurrentAccount()
    }
    
    func saveCurrentAccount(acc: UserModel) {
        self.staffData.setCurrentAccount(email: acc.email, password: acc.password)
    }
    
    func getDataForKey(key: String) -> String {
        return self.staffData.getDetailData()[key] ?? ""
    }
}
