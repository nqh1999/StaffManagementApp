//
//  BaseVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import UIKit
import SideMenu

class BaseVC: UIViewController {
    private let titleView = NavigationTitleView()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapToView = UITapGestureRecognizer(target: self, action: #selector(tapToView))
        view.addGestureRecognizer(tapToView)
        view.layer.contents = UIImage(named: "bgr")?.cgImage
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "sideMenu"), style: .plain, target: self, action: #selector(showSideMenu))
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.titleView = titleView
        navigationController?.navigationBar.isTranslucent = false
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .black
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.isTranslucent = false
        } else {
            navigationController?.navigationBar.tintColor = .black
        }
    }
    
    func setTitle(title: String) {
        titleView.setTitleView(title: title)
    }
    
    @objc private func showSideMenu() {
        if let leftMenu = SideMenuManager.default.menuLeftNavigationController {
            present(leftMenu, animated: true,completion: nil)
        }
    }
    
    @objc private func tapToView() {
        view.endEditing(true)
    }
    
    func showAlert(text: String) {
        let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
