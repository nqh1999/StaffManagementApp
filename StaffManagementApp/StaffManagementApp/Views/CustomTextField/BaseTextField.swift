//
//  BaseTextField.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class BaseTextField: UITextField {
    // MARK: - Properties
    var didEndEditting: (() -> Void)?
    var shouldReturn: (() -> Void)?
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(named: "tfBorder")?.cgColor
        self.layer.borderWidth = 1
        self.delegate = self
    }
}
extension BaseTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.didEndEditting?()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.shouldReturn?()
        return true
    }
}
