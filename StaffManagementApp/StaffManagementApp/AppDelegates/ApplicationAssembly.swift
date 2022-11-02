//
//  ApplicationAssembly.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 31/10/2022.
//

import Swinject

fileprivate let container: Container = {
    let container = Container()
    let assembler = Assembler(container: container)
    assembler.apply(assemblies: [
        LoginAssembly(),
        ForgotPasswordAssembly(),
        OtpAssembly(),
        ResetPasswordAssembly(),
        SideMenuAssembly(),
        HomeAssembly(),
        StaffListAssembly(),
        ProfileDetailAssembly(),
        ProfileAssembly()
    ])
    return container
}()

extension Container {
    static var shared: Container {
        return container
    }
}

