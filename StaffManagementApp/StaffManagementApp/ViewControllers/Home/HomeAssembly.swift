//
//  HomeAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorHomeProtocol.self) { (r, presenter: HomePresenter) in
            let interactor = HomeInteractor(presenter: presenter)
            return interactor
        }
        container.register(PresenterToRouterHomeProtocol.self) { (r) in
            let router = HomeRouter()
            return router
        }
        container.register(ViewToPresenterHomeProtocol.self) { (r, view: HomeVC) in
            let presenter = HomePresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterHomeProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorHomeProtocol.self, argument: presenter)!)
            return presenter
        }
        container.register(HomeVC.self) { (r) in
            let vc = HomeVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterHomeProtocol.self, argument: vc)!)
            return vc
        }
    }
}

