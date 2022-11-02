//
//  SideMenuAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import Swinject

class SideMenuAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PresenterToInteractorSideMenuProtocol.self) { (r, presenter: SideMenuPresenter, email: String, password: String) in
            let interactor = SideMenuInteractor(presenter: presenter, email: email, password: password)
            return interactor
        }
        
        container.register(PresenterToRouterSideMenuProtocol.self) { (r) in
            let router = SideMenuRouter()
            return router
        }

        container.register(ViewToPresenterSideMenuProtocol.self) { (r, view: SideMenuVC, email: String, password: String) in
            let presenter = SideMenuPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterSideMenuProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorSideMenuProtocol.self, arguments: presenter, email, password)!)
            return presenter
        }
        
        container.register(SideMenuVC.self) { (r, email: String, password: String) in
            let vc = SideMenuVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterSideMenuProtocol.self, arguments: vc, email, password)!)
            return vc
        }
    }
}

