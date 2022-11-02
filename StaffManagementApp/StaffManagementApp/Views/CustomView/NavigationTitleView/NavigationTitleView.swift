//
//  NavigationTitleView.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class NavigationTitleView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLbl: UILabel!
    var showSideMenu: (()-> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNavBarView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initNavBarView()
    }
    
    func initNavBarView() {
        Bundle.main.loadNibNamed("NavigationTitleView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.frame
    }
    
    func setTitleView(title: String) {
        self.titleLbl.text = title
    }
}


