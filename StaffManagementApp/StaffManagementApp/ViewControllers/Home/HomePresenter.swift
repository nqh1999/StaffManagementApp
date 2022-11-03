//
//  HomePresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    // MARK: - Properties
    private weak var view: PresenterToViewHomeProtocol?
    private var interactor: PresenterToInteractorHomeProtocol?
    private var router: PresenterToRouterHomeProtocol?
    // MARK: - Init
    init(view: PresenterToViewHomeProtocol) {
        self.view = view
    }
    func setInteractor(interactor: PresenterToInteractorHomeProtocol) {
        self.interactor = interactor
    }
    func setRouter(router: PresenterToRouterHomeProtocol) {
        self.router = router
    }
}
// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    
}
