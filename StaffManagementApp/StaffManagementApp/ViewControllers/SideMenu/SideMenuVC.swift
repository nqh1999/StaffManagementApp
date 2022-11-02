//
//  SideMenuVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//
//

import UIKit

final class SideMenuVC: UIViewController {
    
    @IBOutlet weak var tblSideMenuItem: UITableView!
    
    private var presenter: ViewToPresenterSideMenuProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSideMenuItem.register(UINib(nibName: "SideMenuTableViewCell", bundle: .main), forCellReuseIdentifier: "itemCell")
        tblSideMenuItem.delegate = self
        tblSideMenuItem.dataSource = self
    }
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.getNumberOfSideMenuData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! SideMenuTableViewCell
        cell.setUI(model: presenter!.getDataForIndex(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            presenter?.goToHomeVC()
        case 1:
            presenter?.goToProfileVC()
        case 2:
            presenter?.goToStaffListVC()
        case 3:
            presenter?.goToLoginVC()
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
