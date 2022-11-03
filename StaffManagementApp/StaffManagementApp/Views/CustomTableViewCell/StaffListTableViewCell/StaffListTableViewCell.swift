//
//  StaffListTableViewCell.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 1/11/2022.
//

import UIKit

class StaffListTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var avtImgView: UIImageView!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var dobLbl: UILabel!
    @IBOutlet private weak var phoneLbl: UILabel!
    @IBOutlet private weak var positionlbl: UILabel!
    var tapToCell: (() -> Void)?
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avtImgView.layer.cornerRadius = avtImgView.frame.width/2
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.cornerRadius = 16
        let tapToView = UITapGestureRecognizer(target: self, action: #selector(tapToView))
        self.containerView.addGestureRecognizer(tapToView)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setModel(model: StaffModel) {
        self.avtImgView.image = UIImage(named: model.avtName)
        self.nameLbl.text = model.firstName + " " + model.lastName
        self.dobLbl.text = "Date of birth: \(model.dob)"
        self.phoneLbl.text = "Phone number: \(model.phone)"
        self.positionlbl.text = model.position
    }
    @objc private func tapToView() {
        self.tapToCell?()
    }
}
