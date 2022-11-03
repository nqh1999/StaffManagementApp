//
//  UnderLineButton.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class UnderLineButton: UIButton {
    @IBInspectable private var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            let attributedString = NSMutableAttributedString(string: titleText!)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: titleText!.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .systemFont(ofSize: 14)
    }
}
