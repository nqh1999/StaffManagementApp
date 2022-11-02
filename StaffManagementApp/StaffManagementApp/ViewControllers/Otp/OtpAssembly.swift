//
//  OtpAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import Swinject

class OtpAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PresenterToInteractorOtpProtocol.self) { (r, presenter: OtpPresenter, email: String) in
            let interactor = OtpInteractor(presenter: presenter, email: email)
            return interactor
        }
        
        container.register(PresenterToRouterOtpProtocol.self) { (r) in
            let router = OtpRouter()
            return router
        }

        container.register(ViewToPresenterOtpProtocol.self) { (r, view: OtpVC, email: String) in
            let presenter = OtpPresenter(view: view)
            presenter.setRouter(router: r.resolve(PresenterToRouterOtpProtocol.self)!)
            presenter.setInteractor(interactor: r.resolve(PresenterToInteractorOtpProtocol.self, arguments: presenter, email)!)
            return presenter
        }
        
        container.register(OtpVC.self) { (r, email: String) in
            let vc = OtpVC()
            vc.setPresenter(presenter: r.resolve(ViewToPresenterOtpProtocol.self, arguments: vc, email)!)
            return vc
        }
    }
}

