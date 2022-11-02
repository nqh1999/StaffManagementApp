//
//  ResetPasswordAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Swinject

class ResetPasswordAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorResetPasswordProtocol.self) { (r, presenter: ResetPasswordPresenter, email: String) in
            let interactor = ResetPasswordInteractor(presenter: presenter, email: email)
            return interactor
        }
        
        container.register(PresenterToRouterResetPasswordProtocol.self) { (r) in
            let router = ResetPasswordRouter()
            return router
        }

        container.register(ViewToPresenterResetPasswordProtocol.self) { (r, view: ResetPasswordVC, email: String) in
            let presenter = ResetPasswordPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterResetPasswordProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorResetPasswordProtocol.self, arguments: presenter, email)!)
            return presenter
        }
        
        container.register(ResetPasswordVC.self) { (r, email: String) in
            let vc = ResetPasswordVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterResetPasswordProtocol.self, arguments: vc, email)!)
            return vc
        }
    }
}

