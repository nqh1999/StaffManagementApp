//
//  ProfileDetailVC.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 1/11/2022.
//  
//

import UIKit

final class ProfileDetailVC: BranchVC {

    @IBOutlet private weak var btDownload: UIButton!
    @IBOutlet private var listView: [SubViewOfProfileDetail]!
    
    private var presenter: ViewToPresenterProfileDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Profile Detail")
        self.btDownload.layer.borderWidth = 1
        self.btDownload.layer.borderColor = UIColor(named: "btBlue")?.cgColor
        self.btDownload.layer.cornerRadius = 5
        self.listView.forEach { subview in
            subview.setText(text: self.presenter!.getDetailDataForKey(key: subview.getKey()))
        }
    }
    
    @IBAction func btDownloadClicked(_ sender: Any) {
        print("Download")
    }
}

extension ProfileDetailVC: PresenterToViewProfileDetailProtocol{
    func setPresenter(presenter: ViewToPresenterProfileDetailProtocol) {
        self.presenter = presenter
    }
}
