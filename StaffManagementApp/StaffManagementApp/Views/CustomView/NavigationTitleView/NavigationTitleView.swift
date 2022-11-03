//
//  NavigationTitleView.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class NavigationTitleView: UIView {
    // MARK: - Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLbl: UILabel!
    var showSideMenu: (()-> Void)?
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initNavBarView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initNavBarView()
    }
    private func initNavBarView() {
        Bundle.main.loadNibNamed("NavigationTitleView", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.frame
    }
    func setTitleView(title: String) {
        self.titleLbl.text = title
    }
}


