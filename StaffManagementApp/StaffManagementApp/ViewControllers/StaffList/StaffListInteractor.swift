//
//  StaffListInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 1/11/2022.
//  
//

import Foundation

class StaffListInteractor: PresenterToInteractorStaffListProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterStaffListProtocol?
    private var staffData = StaffData()
    
    // MARK: - Init
    init(presenter: InteractorToPresenterStaffListProtocol) {
        self.presenter = presenter
    }
    
    func getNumberOfStaffData() -> Int {
        return self.staffData.getStaffData().count
    }
    
    func getDetailDataForIndex(index: Int) -> [String : String] {
        self.staffData.mapping(index: index)
        return self.staffData.getDetailData()
    }
    
    func getStaffDataForIndex(index: Int) -> StaffModel {
        return self.staffData.getStaffData()[index]
    }
    
    func filterData(text: String) {
        self.staffData.filterData(text: text)
    }
}
