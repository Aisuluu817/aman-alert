
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
        setUpCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
        setUpCardView()
    }
    
    func setUpView() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(desc)
    }
    
    func setUpCardView() {
//        title.textColor = .black
//        title.font = .boldSystemFont(ofSize: 16)
//        title.text = model.title
//
//        desc.textColor = .black
//        desc.font = .systemFont(ofSize: 14)
//        desc.text = model.description
//
     //   image.image = UIImage(model.urlImage)


        contentView.backgroundColor = .white
       contentView.layer.cornerRadius = 16
       contentView.layer.masksToBounds = true
       
       // Add shadow to the card view
       contentView.layer.shadowColor = UIColor.gray.cgColor
       contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
       contentView.layer.shadowOpacity = 0.5
       contentView.layer.shadowRadius = 4
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
