import Foundation
import UIKit


public struct RadioButtonCellModel {
    public var title: String
    public var isSelected: Bool
    
    public init(title: String,
                isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}

class RadioButtonCell: UITableViewCell {
    
    let radioButton = UIButton()
    var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupRadioButton()
        setupLabel()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupRadioButton()
        setupLabel()
        setUpConstraints()
    }
    
    
    func setupRadioButton() {
        radioButton.layer.cornerRadius = 10
        contentView.addSubview(radioButton)
    }
    
    func configureCell(model: RadioButtonCellModel) {
        label.text = model.title
        if model.isSelected {
            radioButton.setImage(UIImage(named: "ic_radiobutton_checked"), for: .normal)
        } else {
            radioButton.setImage(UIImage(named: "ic_radiobutton_unchecked"), for: .normal)
        }
    }
    
    func isSelected(model: RadioButtonCellModel) {
        if model.isSelected {
            radioButton.setImage(UIImage(named: "ic_radiobutton_checked"), for: .normal)
        } else {
            radioButton.setImage(UIImage(named: "ic_radiobutton_unchecked"), for: .normal)
        }
    }
    
    func setupLabel() {
        label.textColor = .black
        contentView.addSubview(label)
    }
    
    func setUpConstraints() {
        radioButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.leading.equalTo(radioButton.snp.trailing).offset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
