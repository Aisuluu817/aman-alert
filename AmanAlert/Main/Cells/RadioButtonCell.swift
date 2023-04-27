import Foundation
import UIKit


public struct RadioButtonCellModel {
    public let title: String
    public var isSelected: Bool
    
    public init(title: String,
                isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}

class RadioButtonCell: UITableViewCell {
    
    let radioButton = UIButton()
    let label = UILabel()
    
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
        radioButton.setImage(UIImage(named: "ic_radiobutton_unchecked"), for: .normal)
        contentView.addSubview(radioButton)
    }
    
    func setupLabel() {
        // label.frame = CGRect(x: 40, y: 10, width: contentView.bounds.width - 50, height: 20)
        label.text = "Heleo"
        label.textColor = .black
        contentView.addSubview(label)
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.borderColor = UIColor.gray.cgColor
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)) 
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
