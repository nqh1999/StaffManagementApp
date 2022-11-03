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
        guard let interactor = self.interactor, let view = self.view else { return }
        self.router?.goToProfileDetailVC(view: view, data: interactor.getDetailData())
    }
    func goToHelpVC() {
        guard let view = self.view else {return}
        self.router?.goToHelpVC(view: view)
    }
    @objc func updatePassword(notification: Notification) {
        let newPass = notification.object as? [String:String] ?? [:]
        guard let email = newPass["email"], let password = newPass["pass"] else { return }
        self.interactor?.saveCurrentAccount(acc: UserModel(email: email, password: password))
    }
}
// MARK: - Outputs to view
extension ProfilePresenter: InteractorToPresenterProfileProtocol {

}
