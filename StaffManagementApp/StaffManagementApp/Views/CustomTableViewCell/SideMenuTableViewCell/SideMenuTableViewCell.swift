//
//  SimeMenuTableViewCell.swift
//  StaffManagementApp
//
//  Created by Nguyen Quang Huy on 02/11/2022.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI(model: SideMenuModel) {
        img.image = UIImage(named: model.imgItem!)
        titleLbl.text = model.title
    }
}
