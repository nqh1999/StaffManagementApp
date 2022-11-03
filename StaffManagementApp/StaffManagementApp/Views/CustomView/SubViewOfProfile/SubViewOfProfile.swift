//
//  SubViewOfProfile.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class SubViewOfProfile: UIView {
    // MARK: - Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLbl: UILabel!
    var goToVC: (()->Void)?
    @IBInspectable private var title: String? {
        didSet {
            self.titleLbl.text = title
        }
    }
    @IBInspectable private var key: String?
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    private func initView() {
        Bundle.main.loadNibNamed("SubViewOfProfile", owner: self, options: nil)
        self.addSubview(contentView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        self.addGestureRecognizer(tapGesture)
        self.contentView.frame = self.bounds
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor(named: "bgr")?.cgColor
    }
    @objc private func tapOnView() {
        self.goToVC?()
    }
    func getKey() -> String {
        return key ?? ""
    }
}
