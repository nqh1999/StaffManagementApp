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
        self.presenter?.checkLogin(email: emailTf.text ?? "", password: passwordTf.text ?? "")
    }
    
    // MARK: - Button Action
    @IBAction func login(_ sender: Any) {
        self.login()
    }
    @IBAction func goToForgotPasswordVC(_ sender: Any) {
        self.presenter?.goToForgotPasswordVC()
    }
    @IBAction func goToRegisterVC(_ sender: Any) {
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
