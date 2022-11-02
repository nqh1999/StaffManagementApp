//
//  ForgotPasswordVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import UIKit

final class ForgotPasswordVC: BaseVC {
    // MARK: - Properties
    @IBOutlet private weak var emailTf: BaseTextField!
    @IBOutlet private weak var sendOtpBt: BlueButton!
    @IBOutlet private weak var backToLoginBt: UnderLineButton!
    
    private var presenter: ViewToPresenterForgotPasswordProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTf.becomeFirstResponder()
        self.emailTf.shouldReturn = { [weak self] in
            self?.sendOtp()
        }
    }
    
    // MARK: - Processing Methods
    private func sendOtp() {
        self.view.endEditing(true)
        self.presenter?.checkEmail(email: emailTf.text ?? "")
    }
    
    // MARK: - Button Action
    @IBAction private func sendOtp(_ sender: Any) {
        self.sendOtp()
    }
    
    @IBAction private func backToLoginVC(_ sender: Any) {
        self.presenter?.backToLoginVC()
    }

}

extension ForgotPasswordVC: PresenterToViewForgotPasswordProtocol{
    func setPresenter(presenter: ViewToPresenterForgotPasswordProtocol) {
        self.presenter = presenter
    }
    
    func didGetCheckEmailResult(result: String?) {
        guard let result = result else {
            self.presenter?.goToOtpVC(email: emailTf.text!)
            return
        }
        self.showAlert(text: result)
    }
}
