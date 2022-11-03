//
//  ForgotPasswordAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Swinject

class ForgotPasswordAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorForgotPasswordProtocol.self) { (r, presenter: ForgotPasswordPresenter) in
            let interactor = ForgotPasswordInteractor(presenter: presenter)
            return interactor
        }
        container.register(PresenterToRouterForgotPasswordProtocol.self) { (r) in
            let router = ForgotPasswordRouter()
            return router
        }
        container.register(ViewToPresenterForgotPasswordProtocol.self) { (r, view: ForgotPasswordVC) in
            let presenter = ForgotPasswordPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterForgotPasswordProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorForgotPasswordProtocol.self, argument: presenter)!)
            return presenter
        }
        container.register(ForgotPasswordVC.self) { (r) in
            let vc = ForgotPasswordVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterForgotPasswordProtocol.self, argument: vc)!)
            return vc
        }
    }
}

