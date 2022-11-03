//
//  HomeContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterHomeProtocol)
}
// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorHomeProtocol)
    func setRouter(router: PresenterToRouterHomeProtocol)
}
// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: AnyObject {
    
}
// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: AnyObject {
    
}
// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {
    
}
