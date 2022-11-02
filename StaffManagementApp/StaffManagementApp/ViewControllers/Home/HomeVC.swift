//
//  HomeVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit

final class HomeVC: BaseVC {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Home")
    }

    // MARK: - Properties
    private var presenter: ViewToPresenterHomeProtocol?
    
    func setPresenter(presenter: ViewToPresenterHomeProtocol) {
        self.presenter = presenter
    }
}

extension HomeVC: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}
