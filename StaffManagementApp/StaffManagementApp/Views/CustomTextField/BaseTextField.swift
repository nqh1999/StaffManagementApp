//
//  BaseTextField.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class BaseTextField: UITextField {
    
    var didEndEditting: (() -> Void)?
    var shouldReturn: (() -> Void)?
    
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
