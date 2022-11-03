//
//  SimeMenuTableViewCell.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUI(model: SideMenuModel) {
        self.img.image = UIImage(named: model.imgItem!)
        self.titleLbl.text = model.title
    }
}
