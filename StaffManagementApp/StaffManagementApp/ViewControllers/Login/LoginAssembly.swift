//
//  LoginAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//  
//

import Swinject

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorLoginProtocol.self) { (r, presenter: LoginPresenter) in
            let interactor = LoginInteractor(presenter: presenter)
            return interactor
        }
        container.register(PresenterToRouterLoginProtocol.self) { (r) in
            let router = LoginRouter()
            return router
        }
        container.register(ViewToPresenterLoginProtocol.self) { (r, view: LoginVC) in
            let presenter = LoginPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterLoginProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorLoginProtocol.self, argument: presenter)!)
            return presenter
        }
        container.register(LoginVC.self) { (r) in
            let vc = LoginVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterLoginProtocol.self, argument: vc)!)
            return vc
        }
    }
}

