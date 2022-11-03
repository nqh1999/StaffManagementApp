//
//  HomeVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit

final class HomeVC: BaseVC {
    // MARK: - Properties
    private var presenter: ViewToPresenterHomeProtocol?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Home")
    }
}
extension HomeVC: PresenterToViewHomeProtocol{
    func setPresenter(presenter: ViewToPresenterHomeProtocol) {
        self.presenter = presenter
    }
}
