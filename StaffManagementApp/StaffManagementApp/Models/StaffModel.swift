//
//  StaffModel.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import Foundation

struct StaffModel {
    var firstName: String
    var lastName: String
    var dob: String
    var phone: String
    var email: String
    var gender: String
    var address: String
    var position: String
    var avtName: String
}

class StaffData  {
    private var currentAccount: UserModel?
    private var detailData: [String:String] = [:]
    private var baseData: [StaffModel] = [
        StaffModel(firstName: "Nguyen Van", lastName: "Huy", dob: "1999/10/22", phone: "0111111111", email: "a@a.com", gender: "Male", address: "Ha Noi", position: "Employee", avtName: "user1.jpeg"),
        StaffModel(firstName: "Nguyen Van", lastName: "Manh", dob: "1999/11/20", phone: "0222222222", email: "b@b.com", gender: "Male", address: "Ha Nam", position: "Employee", avtName: "user2.jpeg"),
        StaffModel(firstName: "Nguyen Van", lastName: "An", dob: "1999/01/15", phone: "0333333333", email: "c@c.com", gender: "Male", address: "Thanh Hoa", position: "Employee", avtName: "user3.jpeg"),
        StaffModel(firstName: "Nguyen Thi", lastName: "Huyen", dob: "1996/04/21", phone: "0444444444", email: "d@d.com", gender: "Female", address: "Tuyen Quang", position: "Manager", avtName: "user4.jpeg"),
        StaffModel(firstName: "Nguyen Thi", lastName: "Dieu Linh", dob: "1991/03/21", phone: "0555555555", email: "e@e.com", gender: "Female", address: "Tuyen Quang", position: "Employee", avtName: "user1.jpeg") ,
        StaffModel(firstName: "Nguyen Hoang", lastName: "Quynh Trang", dob: "1996/04/21", phone: "0666666666", email: "f@f.com", gender: "Female", address: "Tuyen Quang", position: "Manager", avtName: "user2.jpeg"),
        StaffModel(firstName: "Nguyen Do", lastName: "Nhat Nam", dob: "1999/01/20", phone: "0777777777", email: "g@g.com", gender: "Male", address: "Tuyen Quang", position: "Employee", avtName: "user3.jpeg"),
        StaffModel(firstName: "Nguyen Thi", lastName: "Chung", dob: "2000/04/20", phone: "0888888888", email: "h@h.com", gender: "Female", address: "Tuyen Quang", position: "Employee", avtName: "user4.jpeg"),
        StaffModel(firstName: "Nguyen Le", lastName: "Thao Nguyen", dob: "1996/04/21", phone: "0999999999", email: "j@j.com", gender: "Female", address: "Tuyen Quang", position: "Employee", avtName: "user2.jpeg")
    ]
    
    init() {
        self.staffData = self.baseData
    }
    
    private var staffData: [StaffModel] = []
    
    func getStaffData() -> [StaffModel] {
        return self.staffData
    }
    
    func getDetailData() -> [String:String] {
        return detailData
    }
    
    func setDetailData(data: [String:String]) {
        self.detailData = data
    }
    
    func filterData(text: String) {
        self.staffData = text.isEmpty ? baseData : baseData.filter {
            $0.firstName.lowercased().contains(text.lowercased()) || $0.lastName.lowercased().contains(text.lowercased())
        }
    }
    
    func mapping(index: Int) {
        self.initDetailData(data: self.staffData[index])
    }
   
    func initDetailData(data: StaffModel) {
        self.detailData = ["firstName": data.firstName, "lastName": data.lastName, "dob": data.dob, "phone": data.phone, "email": data.email, "gender": data.gender, "address": data.address, "position": data.position, "avtName": data.avtName]
    }
    
    func setCurrentAccount(email: String, password: String) {
        self.currentAccount = UserModel(email: email, password: password)
    }
    
    func getCurrentAccount() -> UserModel {
        return self.currentAccount ?? UserModel(email: "", password: "")
    }

    func mappingByEmail(email: String) {
        self.staffData.forEach { data in
            if data.email == email {
                self.initDetailData(data: data)
            }
        }
    }
}
