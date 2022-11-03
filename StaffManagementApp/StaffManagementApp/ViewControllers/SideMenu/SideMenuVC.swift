//
//  SideMenuVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import UIKit

final class SideMenuVC: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var tblSideMenuItem: UITableView!
    private var presenter: ViewToPresenterSideMenuProtocol?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblSideMenuItem.register(UINib(nibName: "SideMenuTableViewCell", bundle: .main), forCellReuseIdentifier: "itemCell")
        self.tblSideMenuItem.delegate = self
        self.tblSideMenuItem.dataSource = self
    }
}
extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter!.getNumberOfSideMenuData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! SideMenuTableViewCell
        cell.setUI(model: self.presenter!.getDataForIndex(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.presenter?.goToHomeVC()
        case 1:
            self.presenter?.goToProfileVC()
        case 2:
            self.presenter?.goToStaffListVC()
        case 3:
            self.presenter?.goToLoginVC()
        default:
            break
        }
    }
}
extension SideMenuVC: PresenterToViewSideMenuProtocol{
    func setPresenter(presenter: ViewToPresenterSideMenuProtocol) {
        self.presenter = presenter
    }
}
