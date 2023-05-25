import Foundation
import UIKit


class InfoCell: UITableViewCell {
    
    let cellView = UIView()
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    let title = UILabel()
    let desc = UILabel()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpConstraints()
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error")
    }
    
    func setUpView() {
        
        title.numberOfLines = 1
        desc.numberOfLines = 2
        
        cellView.addSubview(image)
        cellView.addSubview(title)
        cellView.addSubview(desc)
        contentView.addSubview(cellView)
    }
    
    func setUpCell() {
        
        cellView.layer.borderWidth = CGFloat(1)
        cellView.layer.borderColor = UIColor(named: "greyBorder")!.cgColor
        
        cellView.layer.cornerRadius = 16
    }
    
    func setUpConstraints() {
        
        cellView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(6)
            $0.leading.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(self.image.snp.height)
            $0.leading.equalToSuperview().offset(10)
        }
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(image.snp.trailing).offset(12)
        }
        
        desc.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(12)
            $0.leading.equalTo(image.snp.trailing).offset(12)
        }
    }
}
