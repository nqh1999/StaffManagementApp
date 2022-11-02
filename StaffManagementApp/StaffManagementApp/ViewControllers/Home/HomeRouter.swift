//
//  HomeRouter.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation
import UIKit
import Swinject

class HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {
        
        let viewController = Container.shared.resolve(HomeVC.self)!
        return viewController
    }
    
}
