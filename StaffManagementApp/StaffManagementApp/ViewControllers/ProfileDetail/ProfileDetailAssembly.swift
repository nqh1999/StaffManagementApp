//
//  ProfileDetailAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Swinject

class ProfileDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorProfileDetailProtocol.self) { (r, presenter: ProfileDetailPresenter, data: [String: String]) in
            let interactor = ProfileDetailInteractor(presenter: presenter, data: data)
            return interactor
        }
        container.register(PresenterToRouterProfileDetailProtocol.self) { (r) in
            let router = ProfileDetailRouter()
            return router
        }
        container.register(ViewToPresenterProfileDetailProtocol.self) { (r, view: ProfileDetailVC, data: [String: String]) in
            let presenter = ProfileDetailPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterProfileDetailProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorProfileDetailProtocol.self, arguments: presenter, data)!)
            return presenter
        }
        container.register(ProfileDetailVC.self) { (r, data: [String: String]) in
            let vc = ProfileDetailVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterProfileDetailProtocol.self, arguments: vc, data)!)
            return vc
        }
    }
}

