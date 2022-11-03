//
//  LoginVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

final class LoginVC: BaseVC {
    // MARK: - Properties
    @IBOutlet private weak var emailTf: BaseTextField!
    @IBOutlet private weak var passwordTf: BaseTextField!
    @IBOutlet private weak var loginBt: BlueButton!
    @IBOutlet private weak var forgotPasswordBt: UnderLineButton!
    @IBOutlet private weak var registerBt: UnderLineButton!
    private var presenter: ViewToPresenterLoginProtocol?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTf.becomeFirstResponder()
        self.emailTf.shouldReturn = { [weak self] in
            self?.passwordTf.becomeFirstResponder()
        }
        self.passwordTf.shouldReturn = { [weak self] in
            self?.login()
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.emailTf.text = ""
        self.passwordTf.text = ""
    }
    // MARK: - Processing Methods
    private func login() {
        self.view.endEditing(true)
        guard let email = self.emailTf.text, let password = self.passwordTf.text else {return}
        self.presenter?.checkLogin(email: email, password: password)
    }
    // MARK: - Button Action
    @IBAction private func login(_ sender: Any) {
        self.login()
    }
    @IBAction private func goToForgotPasswordVC(_ sender: Any) {
        self.presenter?.goToForgotPasswordVC()
    }
    @IBAction private func goToRegisterVC(_ sender: Any) {
        self.presenter?.goToRegisterVC()
    }
}
extension LoginVC: PresenterToViewLoginProtocol {
    func setPresenter(presenter: ViewToPresenterLoginProtocol) {
        self.presenter = presenter
    }
    func didGetLoginResult(result: String?) {
        guard let result = result else {
            self.presenter?.goToHomeVC()
            return
        }
        self.showAlert(text: result)
    }
}
