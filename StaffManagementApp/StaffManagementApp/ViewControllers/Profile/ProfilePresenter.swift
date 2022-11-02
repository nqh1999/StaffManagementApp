//
//  ProfilePresenter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import Foundation

class ProfilePresenter: ViewToPresenterProfileProtocol {
    
    // MARK: - Properties
    private weak var view: PresenterToViewProfileProtocol?
    private var interactor: PresenterToInteractorProfileProtocol?
    private var router: PresenterToRouterProfileProtocol?
    
    // MARK: - Init
    
    init(view: PresenterToViewProfileProtocol) {
        self.view = view
        NotificationCenter.default.addObserver(self, selector: #selector(updatePassword(notification:)), name: .NewData, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .NewData, object: nil)
    }
    
    func setInteractor(interactor: PresenterToInteractorProfileProtocol) {
        self.interactor = interactor
    }
    
    func setRouter(router: PresenterToRouterProfileProtocol) {
        self.router = router
    }
    
    func getDataForKey(key: String) -> String {
        return self.interactor!.getDataForKey(key: key)
    }
    
    func goToProfileDetailVC() {
        guard let interactor = interactor, let view = view else { return }
        self.router?.goToProfileDetailVC(view: view, data: interactor.getDetailData())
    }
    
    @objc func updatePassword(notification: Notification) {
        guard let interactor = interactor else { return }
        let newPass = notification.object as? [String:String] ?? [:]
        interactor.saveCurrentAccount(acc: UserModel(email: newPass["email"] ?? "", password: newPass["pass"] ?? ""))
    }
}

// MARK: - Outputs to view
extension ProfilePresenter: InteractorToPresenterProfileProtocol {

}
