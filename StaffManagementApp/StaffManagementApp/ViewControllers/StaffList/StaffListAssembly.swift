//
//  StaffListAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Swinject

class StaffListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorStaffListProtocol.self) { (r, presenter: StaffListPresenter) in
            let interactor = StaffListInteractor(presenter: presenter)
            return interactor
        }
        container.register(PresenterToRouterStaffListProtocol.self) { (r) in
            let router = StaffListRouter()
            return router
        }
        container.register(ViewToPresenterStaffListProtocol.self) { (r, view: StaffListVC) in
            let presenter = StaffListPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterStaffListProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorStaffListProtocol.self, argument: presenter)!)
            return presenter
        }
        container.register(StaffListVC.self) { (r) in
            let vc = StaffListVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterStaffListProtocol.self, argument: vc)!)
            return vc
        }
    }
}

