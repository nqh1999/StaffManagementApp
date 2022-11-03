//
//  StaffListPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class StaffListPresenter: ViewToPresenterStaffListProtocol {
    // MARK: - Properties
    private weak var view: PresenterToViewStaffListProtocol?
    private var interactor: PresenterToInteractorStaffListProtocol?
    private var router: PresenterToRouterStaffListProtocol?
    // MARK: - Init
    init(view: PresenterToViewStaffListProtocol) {
        self.view = view
    }
    func setInteractor(interactor: PresenterToInteractorStaffListProtocol) {
        self.interactor = interactor
    }
    func setRouter(router: PresenterToRouterStaffListProtocol) {
        self.router = router
    }
    func getNumberOfStaffData() -> Int {
        return self.interactor!.getNumberOfStaffData()
    }
    func goToProfileDetail(index: Int) {
        guard let view = self.view, let interactor = self.interactor else {return}
        self.router?.goToProfileDetailVC(view: view, data: interactor.getDetailDataForIndex(index: index))
    }
    func getStaffDataForIndex(index: Int) -> StaffModel {
        return self.interactor!.getStaffDataForIndex(index: index)
    }
    func filterData(text: String) {
        self.interactor?.filterData(text: text)
    }
}
// MARK: - Outputs to view
extension StaffListPresenter: InteractorToPresenterStaffListProtocol {
    
}
