//
//  BranchVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import UIKit

class BranchVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrowLeft"), style: .plain, target: self, action: #selector(popVC))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
