

import Foundation
import UIKit

class RadioButtonCell: UITableViewCell {
    
    let radioButton = UIButton()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupRadioButton()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupRadioButton()
        }
        
        func setupRadioButton() {
            radioButton.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
            radioButton.layer.cornerRadius = 10
            radioButton.layer.borderWidth = 1
            radioButton.layer.borderColor = UIColor.gray.cgColor
            contentView.addSubview(radioButton)
        }
}
