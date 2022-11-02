//
//  StaffListVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 1/11/2022.
//  
//

import UIKit

final class StaffListVC: BaseVC {
    
    @IBOutlet private weak var searchTf: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: ViewToPresenterStaffListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Staff List")
        self.tableView.register(UINib(nibName: "StaffListTableViewCell", bundle: .main), forCellReuseIdentifier: "StaffListCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 110
        self.tableView.separatorStyle = .none
        self.searchTf.layer.borderWidth = 1
        self.searchTf.layer.cornerRadius = 5
    }
    
    @IBAction func searchHandler(_ sender: UITextField) {
        if let searchText = sender.text {
            self.presenter?.filterData(text: searchText)
            self.tableView.reloadData()
        }
    }
}

extension StaffListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter!.getNumberOfStaffData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StaffListCell", for: indexPath) as! StaffListTableViewCell
        cell.setModel(model: self.presenter!.getStaffDataForIndex(index: indexPath.row))
        cell.tapToCell = { [weak self] in
            self?.presenter?.goToProfileDetail(index: indexPath.row)
        }
        return cell
    }
}

extension StaffListVC: PresenterToViewStaffListProtocol{
    func setPresenter(presenter: ViewToPresenterStaffListProtocol) {
        self.presenter = presenter
    }
}

