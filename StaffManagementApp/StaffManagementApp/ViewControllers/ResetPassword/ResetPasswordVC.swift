//
//  ResetPasswordVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//  
//

import UIKit

final class ResetPasswordVC: BaseVC {
    // MARK: - Properties
    @IBOutlet private weak var passwordTf: BaseTextField!
    @IBOutlet private weak var reEnterPasswordTf: BaseTextField!
    @IBOutlet private weak var confirmBt: BlueButton!
    @IBOutlet private weak var backToLoginBt: UnderLineButton!
    private var presenter: ViewToPresenterResetPasswordProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTf.becomeFirstResponder()
        self.passwordTf.shouldReturn = { [weak self] in
            self?.reEnterPasswordTf.becomeFirstResponder()
        }
        self.reEnterPasswordTf.shouldReturn = { [weak self] in
            self?.resetPassword()
        }
    }
    
    @IBAction func confirm(_ sender: Any) {
        self.resetPassword()
    }
    
    @IBAction func backToLoginVC(_ sender: Any) {
        self.presenter?.backToLoginVC()
    }
    
    private func resetPassword() {
        self.view.endEditing(true)
        self.presenter?.comparePassword(password: passwordTf.text ?? "", reEnterPassword: reEnterPasswordTf.text ?? "")
    }
}

extension ResetPasswordVC: PresenterToViewResetPasswordProtocol{
    func didGetComparePasswordResult(result: String?) {
        guard let result = result else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.presenter?.backToLoginVC()
            }
            return
        }
        self.showAlert(text: result)
    }
    
    func setPresenter(presenter: ViewToPresenterResetPasswordProtocol) {
        self.presenter = presenter
    }
}
