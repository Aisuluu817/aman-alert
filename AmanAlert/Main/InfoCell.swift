
import Foundation
import UIKit


class InfoCell: UITableViewCell {
    
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    let title = UILabel()
    let desc = UILabel()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(desc)
    }
    
    func configureCell() {
        title.textColor = .black
        title.font = .boldSystemFont(ofSize: 16)
        title.text = "Уроки самообороны"
        
        desc.textColor = .black
        desc.font = .systemFont(ofSize: 14)
        desc.text = "Читать полностью"

        contentView.layer.cornerRadius = 16
        contentView.layer.borderColor = UIColor(named: "greyBorder")?.cgColor
    }
    
    func setUpConstraints() {
        image.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        title.snp.makeConstraints {
            $0.leading.equalTo(image.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(10)
        }
        
        desc.snp.makeConstraints{
            $0.leading.equalTo(image.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
            
        }
    }
}
