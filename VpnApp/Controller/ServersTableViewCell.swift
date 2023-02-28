//
//  denemeTableCell.swift
//  VpnApp
//
//  Created by Şükrü Özkoca on 27.02.2023.
//

import UIKit

class ServersTableViewCell: UITableViewCell {

    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var selectLocationButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        lineView.backgroundColor = UIColor(red: 59/255, green: 69/255, blue: 82/255, alpha: 1)
        bgView.backgroundColor = UIColor(red: 44/255, green: 58/255, blue: 71/255, alpha: 1)
        bgView.layer.cornerRadius = 25
        flagImageView.layer.cornerRadius = 18
        flagImageView.layer.masksToBounds = false
        flagImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bgView.backgroundColor = isSelected ? .green : UIColor(red: 44/255, green: 58/255, blue: 71/255, alpha: 1)
        selectLocationButton.tintColor = isSelected ? .white : .green
        lineView.backgroundColor = isSelected ? UIColor(red: 108/255, green: 210/255, blue: 110/255, alpha: 1) : UIColor(red: 59/255, green: 69/255, blue: 82/255, alpha: 1)
    }
}
