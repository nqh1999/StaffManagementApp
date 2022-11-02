//
//  SubViewOfProfileDetail.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 01/11/2022.
//

import UIKit

class SubViewOfProfileDetail: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var tf: BaseTextField!
    
    @IBInspectable var text: String? {
        didSet {
            titleLbl.text = text
        }
    }
    
    @IBInspectable private var key: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customView()
    }
    
    func customView() {
        self.loadNib()
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.tf.layer.cornerRadius = 5
        self.tf.isUserInteractionEnabled = false
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed("SubViewOfProfileDetail", owner: self, options: nil)
    }
    
    func setText(text: String) {
        self.tf.text = text
    }
    
    func getKey() -> String {
        return self.key ?? ""
    }
}
