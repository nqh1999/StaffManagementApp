//
//  SceneDelegate.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: Container.shared.resolve(LoginVC.self)!)
        self.window = window
        window.makeKeyAndVisible()
    }
}

