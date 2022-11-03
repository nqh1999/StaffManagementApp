//
//  UserModel.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import Foundation

// MARK: - User Model
struct UserModel {
    var email: String
    var password: String
}

class UserData {
    // MARK: - Data
    private var userData: [UserModel] = [
        UserModel(email: "a@a.com", password: "1"),
        UserModel(email: "b@b.com", password: "1"),
        UserModel(email: "c@c.com", password: "1"),
        UserModel(email: "d@d.com", password: "1"),
        UserModel(email: "e@e.com", password: "1"),
        UserModel(email: "f@f.com", password: "1"),
        UserModel(email: "g@g.com", password: "1"),
        UserModel(email: "h@h.com", password: "1"),
        UserModel(email: "j@j.com", password: "1")
    ]
    private var otp: String = "000000"
    private var currentAccount = UserModel(email: "", password: "")
    // MARK: - Getter - Setter
    func getAllUser() -> [UserModel] {
        return self.userData
    }
    func getOtp() -> String {
        return self.otp
    }
    func setCurrentAccount(email: String, password: String) {
        self.currentAccount.email = email
        self.currentAccount.password = password
    }
    func getCurrentAccount() -> UserModel {
        return self.currentAccount
    }
    func setData(data: [UserModel]) {
        self.userData = data
    }
    // MARK: - Processing Methods
    func checkNewPassword(pass: String, reEnterPassword: String) -> String? {
        if pass.isEmpty {
            return "Please enter new password"
        } else if reEnterPassword.isEmpty {
            return "Please re-enter new password"
        } else if pass.count < 6 {
            return "Password must be at least 6 characters"
        } else if pass != reEnterPassword {
            return "Re-enter password is not the same as password"
        } else {
            return nil
        }
    }
    func validateResult(email: String, password: String) -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Please enter your email"
        } else if password.isEmpty {
            return "Please enter your password"
        } else if userData.contains (where: { user in
            user.email == email && user.password == password
        }) {
            return nil
        } else {
            return "Login Failed"
        }
    }
    func validateEmail(email: String) -> String? {
        let email = email.trimmingCharacters(in: .whitespaces)
        if email.isEmpty {
            return "Please enter your email"
        } else if email.isValidEmail == false {
            return "Invalid email"
        } else if userData.contains (where: { data in
            data.email == email
        }) {
            return nil
        } else {
            return "Email does not exist"
        }
    }
    func resetPassword(email: String, pass: String) {
        for (index, _) in userData.enumerated() {
            if userData[index].email == email {
                userData.remove(at: index)
                userData.append(UserModel(email: email, password: pass))
            }
        }
    }
}
// MARK: - Regex Email
extension String {
    var isValidEmail: Bool {
        let validEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let email = NSPredicate(format:"SELF MATCHES %@", validEmail)
        return email.evaluate(with: self)
    }
}
