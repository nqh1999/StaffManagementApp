//
//  ProfileDetailContract.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewProfileDetailProtocol: AnyObject {
    func setPresenter(presenter: ViewToPresenterProfileDetailProtocol)
}


// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterProfileDetailProtocol: AnyObject {
    func setInteractor(interactor: PresenterToInteractorProfileDetailProtocol)
    func setRouter(router: PresenterToRouterProfileDetailProtocol)
    func getDetailDataForKey(key: String) -> String
    func getDetailData() -> [String:String]
}


// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProfileDetailProtocol: AnyObject {
    func getDetailData() -> [String:String]
    func getDetailDataForKey(key: String) -> String
}


// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProfileDetailProtocol: AnyObject {
    
}


// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterProfileDetailProtocol: AnyObject {
    
}
