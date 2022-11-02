//
//  OtpTextfield.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class OtpTextfield: UITextField {
    
    var deleteText: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.textAlignment = .center
        self.keyboardType = .numberPad
    }

    override func deleteBackward() {
        super.deleteBackward()
        deleteText?()
    }
 
}
