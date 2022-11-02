//
//  OtpInputView.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class OtpInputView: UIView {

    @IBOutlet private var arrTf: [OtpTextfield]!
    @IBOutlet private var contentView: UIView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    func initView() {
        Bundle.main.loadNibNamed("OtpInputView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        arrTf[0].becomeFirstResponder()
        for (index,tf) in arrTf.enumerated() {
            tf.delegate = self
            tf.tag = index
            arrTf[index].deleteText = { [weak self] in
                if index == 0 {
                    self?.arrTf[index].resignFirstResponder()
                } else {
                    self?.arrTf[index-1].becomeFirstResponder()
                }
            }
        }
    }
    
    func getOTP() -> String {
        return arrTf.reduce("") { otp, i in
            otp + (i.text ?? "")
        }
    }
    
    func clearOTP() {
        arrTf.forEach { tf in
            tf.text = ""
        }
        arrTf[0].becomeFirstResponder()
    }
}

extension OtpInputView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count <= 1 && range.length == 0 {
            textField.text = string
            if textField.tag == arrTf.count - 1 {
                arrTf[textField.tag].resignFirstResponder()
            } else {
                arrTf[textField.tag+1].becomeFirstResponder()
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

