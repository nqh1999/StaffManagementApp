//
//  ProfileVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//
//

import UIKit

class ProfileVC: BaseVC {
    
    @IBOutlet private weak var imgAvt: UIImageView!
    @IBOutlet private weak var btUploadImg: UIButton!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private var listSubView: [SubViewOfProfile]!
    
    private var presenter: ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Profile")
        self.imgAvt.layer.cornerRadius = imgAvt.frame.width / 2
        self.imgAvt.image = UIImage(named: presenter!.getDataForKey(key: "avtName"))
        self.lblName.text = (presenter!.getDataForKey(key: "firstName") + " " + presenter!.getDataForKey(key: "lastName"))
        self.listSubView.forEach { subview in
            subview.goToVC = { [weak self] in
                self?.goToVC(key: subview.getKey())
            }
        }
    }
    
    func goToVC(key: String) {
        if key == "profileDetail" {
            self.presenter?.goToProfileDetailVC()
        } else if key == "help" {
            print("Help VC")
        }
    }
}

extension ProfileVC: PresenterToViewProfileProtocol{
    func setPresenter(presenter: ViewToPresenterProfileProtocol) {
        self.presenter = presenter
    }
}
