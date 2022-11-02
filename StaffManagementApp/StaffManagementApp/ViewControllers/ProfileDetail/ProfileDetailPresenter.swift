//
//  ProfileDetailPresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class ProfileDetailPresenter: ViewToPresenterProfileDetailProtocol {

    // MARK: - Properties
    private weak var view: PresenterToViewProfileDetailProtocol?
    private var interactor: PresenterToInteractorProfileDetailProtocol?
    private var router: PresenterToRouterProfileDetailProtocol?
    
    // MARK: - Init
    init(view: PresenterToViewProfileDetailProtocol) {
        self.view = view
    }
    
    func setInteractor(interactor: PresenterToInteractorProfileDetailProtocol) {
        self.interactor = interactor
    }

    func setRouter(router: PresenterToRouterProfileDetailProtocol) {
        self.router = router
    }
    
    func getDetailDataForKey(key: String) -> String {
        return self.interactor!.getDetailDataForKey(key: key)
    }
    
    func getDetailData() -> [String:String] {
        return self.interactor!.getDetailData()
    }
}

// MARK: - Outputs to view
extension ProfileDetailPresenter: InteractorToPresenterProfileDetailProtocol {
    
}
