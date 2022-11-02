//
//  HomeInteractor.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {

    // MARK: - Properties
    private weak var presenter: InteractorToPresenterHomeProtocol?
    
    // MARK: - Init
    init(presenter: InteractorToPresenterHomeProtocol) {
        self.presenter = presenter
    }
    
}
