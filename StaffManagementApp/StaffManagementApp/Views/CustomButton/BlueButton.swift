//
//  BlueButton.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class BlueButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = UIColor(named: "btBlue")
        self.tintColor = UIColor(named: "bgr")
    }
}
