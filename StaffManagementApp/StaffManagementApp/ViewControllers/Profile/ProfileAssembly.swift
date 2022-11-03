//
//  ProfileAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import Swinject

class ProfileAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorProfileProtocol.self) { (r, presenter: ProfilePresenter, data: [String:String], acc: UserModel) in
            let interactor = ProfileInteractor(presenter: presenter, data: data, acc: acc)
            return interactor
        }
        container.register(PresenterToRouterProfileProtocol.self) { (r) in
            let router = ProfileRouter()
            return router
        }
        container.register(ViewToPresenterProfileProtocol.self) { (r, view: ProfileVC, data: [String:String], acc: UserModel) in
            let presenter = ProfilePresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterProfileProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorProfileProtocol.self, arguments: presenter, data, acc)!)
            return presenter
        }
        container.register(ProfileVC.self) { (r, data: [String : String], acc: UserModel) in
            let vc = ProfileVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterProfileProtocol.self, arguments: vc, data, acc)!)
            return vc
        }
    }
}

