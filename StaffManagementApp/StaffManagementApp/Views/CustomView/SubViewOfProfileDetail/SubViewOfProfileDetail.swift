//
//  SubViewOfProfileDetail.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class SubViewOfProfileDetail: UIView {
    // MARK: - Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var tf: BaseTextField!
    @IBInspectable var text: String? {
        didSet {
            self.titleLbl.text = text
        }
    }
    @IBInspectable private var key: String?
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customView()
    }
    private func customView() {
        Bundle.main.loadNibNamed("SubViewOfProfileDetail", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.tf.layer.cornerRadius = 5
        self.tf.isUserInteractionEnabled = false
    }
    // MARK: - Getter - Setter
    func setText(text: String) {
        self.tf.text = text
    }
    func getKey() -> String {
        return self.key ?? ""
    }
}
