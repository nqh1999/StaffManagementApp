//
//  ProfileDetailInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class ProfileDetailInteractor: PresenterToInteractorProfileDetailProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterProfileDetailProtocol?
    private var staffData = StaffData()
    // MARK: - Init
    init(presenter: InteractorToPresenterProfileDetailProtocol, data: [String:String]) {
        self.presenter = presenter
        self.staffData.setDetailData(data: data)
    }
    func getDetailData() -> [String:String] {
        return self.staffData.getDetailData()
    }
    func getDetailDataForKey(key: String) -> String {
        return self.staffData.getDetailData()[key] ?? ""
    }

}
