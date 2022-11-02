//
//  OtpVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit

final class OtpVC: BaseVC {
    // MARK: - Properties
    @IBOutlet private weak var emailLbl: UILabel!
    @IBOutlet private weak var otpInputView: OtpInputView!
    private var presenter: ViewToPresenterOtpProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    @IBAction func checkOtp(_ sender: Any) {
        self.presenter?.checkOtp(otp: self.otpInputView.getOTP())
    }
    
    @IBAction func resendOtp(_ sender: Any) {
        self.otpInputView.clearOTP()
    }
}

extension OtpVC: PresenterToViewOtpProtocol{
    func setPresenter(presenter: ViewToPresenterOtpProtocol) {
        self.presenter = presenter
    }
    
    func didGetEmail(email: String) {
        self.emailLbl.text = email
    }
    
    func didGetCheckOtpResult(result: Bool) {
        if result {
            presenter?.goToResetPasswordVC()
        } else {
            self.otpInputView.clearOTP()
        }
    }
}
