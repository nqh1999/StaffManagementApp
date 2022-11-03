//
//  ProfileVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import UIKit

class ProfileVC: BaseVC {
    // MARK: - Properties
    @IBOutlet private weak var imgAvt: UIImageView!
    @IBOutlet private weak var btUploadImg: UIButton!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private var listSubView: [SubViewOfProfile]!
    private var presenter: ViewToPresenterProfileProtocol?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Profile")
        self.imgAvt.layer.cornerRadius = imgAvt.frame.width / 2
        self.imgAvt.image = UIImage(named: self.presenter!.getDataForKey(key: "avtName"))
        self.lblName.text = (self.presenter!.getDataForKey(key: "firstName") + " " + self.presenter!.getDataForKey(key: "lastName"))
        self.listSubView.forEach { subview in
            subview.goToVC = { [weak self] in
                self?.goToVC(key: subview.getKey())
            }
        }
    }
    // MARK: - Processing Methods
    private func goToVC(key: String) {
        if key == "profileDetail" {
            self.presenter?.goToProfileDetailVC()
        } else if key == "help" {
            self.presenter?.goToHelpVC()
        }
    }
}
extension ProfileVC: PresenterToViewProfileProtocol{
    func setPresenter(presenter: ViewToPresenterProfileProtocol) {
        self.presenter = presenter
    }
}
