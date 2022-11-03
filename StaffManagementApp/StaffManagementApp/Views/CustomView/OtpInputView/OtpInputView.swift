//
//  OtpInputView.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class OtpInputView: UIView {
    // MARK: Properties
    @IBOutlet private var arrTf: [OtpTextfield]!
    @IBOutlet private var contentView: UIView!
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    private func initView() {
        Bundle.main.loadNibNamed("OtpInputView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.arrTf[0].becomeFirstResponder()
        for (index,tf) in arrTf.enumerated() {
            tf.delegate = self
            tf.tag = index
            self.arrTf[index].deleteText = { [weak self] in
                if index == 0 {
                    self?.arrTf[index].resignFirstResponder()
                } else {
                    self?.arrTf[index-1].becomeFirstResponder()
                }
            }
        }
    }
    func getOTP() -> String {
        return self.arrTf.reduce("") { otp, i in
            otp + (i.text ?? "")
        }
    }
    func clearOTP() {
        self.arrTf.forEach { tf in
            tf.text = ""
        }
        self.arrTf[0].becomeFirstResponder()
    }
}
extension OtpInputView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count <= 1 && range.length == 0 {
            textField.text = string
            if textField.tag == self.arrTf.count - 1 {
                self.arrTf[textField.tag].resignFirstResponder()
            } else {
                self.arrTf[textField.tag+1].becomeFirstResponder()
            }
            return true
        } else if range.length > 0 {
            textField.text = ""
            return true
        } else {
            return false
        }
    }
}
