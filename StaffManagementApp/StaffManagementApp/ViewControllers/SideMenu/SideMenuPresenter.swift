//
//  SideMenuPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import Foundation

class SideMenuPresenter: ViewToPresenterSideMenuProtocol {

    // MARK: - Properties
    private weak var view: PresenterToViewSideMenuProtocol?
    private var interactor: PresenterToInteractorSideMenuProtocol?
    private var router: PresenterToRouterSideMenuProtocol?
    
    // MARK: - Init

    init(view: PresenterToViewSideMenuProtocol) {
        self.view = view
    }
    
    func setInteractor(interactor: PresenterToInteractorSideMenuProtocol) {
        self.interactor = interactor
    }

    func setRouter(router: PresenterToRouterSideMenuProtocol) {
        self.router = router
    }
    
    func getNumberOfSideMenuData() -> Int {
        return interactor!.getNumberOfSideMenuData()
    }
    
    func getDataForIndex(index: Int) -> SideMenuModel {
        return interactor!.getSideMenuDataForIndex(index: index)
    }
    
    func goToProfileVC() {
        guard let interactor = interactor, let view = view else { return }
        self.router?.goToProfileVC(view: view, data: interactor.getDetailData(), acc: interactor.getCurrentAccount())
    }
    
    func goToHomeVC() {
        guard let view = view else { return }
        self.router?.goToHomeVC(view: view)
    }
    
    func goToStaffListVC() {
        guard let view = view else { return }
        self.router?.goToStaffListVC(view: view)
    }
    
    func goToLoginVC() {
        self.router?.goToLoginVC()
    }
    
}

extension SideMenuPresenter: InteractorToPresenterSideMenuProtocol {
    
}
