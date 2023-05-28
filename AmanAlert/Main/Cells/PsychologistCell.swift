
import UIKit

class PsychologistCell: UITableViewCell {
    
    let cellView = UIView()
    let upperPart = UIView()
    let avatarImage = UIImageView(image: UIImage(named: "ic_aman_blue"))
    let nameLabel = UILabel()
    let descLabel = UILabel()
    let xpLabel = UILabel()
    let feedbackLabel = UILabel()
    let lowerPart = UIView()
    let phoneTitleLabel = UILabel()
    let phoneLabel = UILabel()
    let contactTitleLabel = UILabel()
    let contactLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error")
    }
    
    func setupView() {
        
        nameLabel.numberOfLines = 1
        descLabel.numberOfLines = 3
        xpLabel.numberOfLines = 1
        feedbackLabel.numberOfLines = 1
        phoneTitleLabel.numberOfLines = 1
        phoneLabel.numberOfLines = 1
        contactTitleLabel.numberOfLines = 1
        contactLabel.numberOfLines = 1
        
        nameLabel.font = .systemFont(ofSize: 16)
        descLabel.font = .systemFont(ofSize: 14)
        xpLabel.font = .systemFont(ofSize: 14)
        feedbackLabel.font = .systemFont(ofSize: 14)
        
        cellView.addSubview(upperPart)
        cellView.addSubview(lowerPart)
        
        upperPart.addSubview(avatarImage)
        upperPart.addSubview(nameLabel)
        upperPart.addSubview(descLabel)
        upperPart.addSubview(xpLabel)
        upperPart.addSubview(feedbackLabel)
        
        lowerPart.addSubview(phoneTitleLabel)
        lowerPart.addSubview(phoneLabel)
        lowerPart.addSubview(contactTitleLabel)
        lowerPart.addSubview(contactLabel)
        
        contentView.addSubview(cellView)
    }
    
    func setupCell() {
           
            cellView.layer.borderWidth = CGFloat(1)
            cellView.layer.borderColor = UIColor(named: "greyBorder")!.cgColor
            cellView.layer.cornerRadius = 16
        }
        
    func setupConstraints() {
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        cellView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        cellView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        
        upperPart.translatesAutoresizingMaskIntoConstraints = false
                
                upperPart.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15).isActive = true
                upperPart.leftAnchor.constraint(equalTo: cellView.leftAnchor).isActive = true
                upperPart.rightAnchor.constraint(equalTo: cellView.rightAnchor).isActive = true
                
                lowerPart.translatesAutoresizingMaskIntoConstraints = false

        lowerPart.topAnchor.constraint(equalTo: upperPart.bottomAnchor).isActive = true
        lowerPart.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        lowerPart.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
        lowerPart.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        avatarImage.topAnchor.constraint(equalTo: upperPart.topAnchor).isActive = true
               avatarImage.leftAnchor.constraint(equalTo: upperPart.leftAnchor).isActive = true
//               avatarImage.widthAnchor.constraint(equalTo: upperPart.widthAnchor, multiplier: 1/3).isActive = true
               avatarImage.bottomAnchor.constraint(equalTo: upperPart.bottomAnchor).isActive = true
               
               nameLabel.translatesAutoresizingMaskIntoConstraints = false
    
        nameLabel.topAnchor.constraint(equalTo: upperPart.topAnchor).isActive = true

        nameLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
                nameLabel.rightAnchor.constraint(equalTo: upperPart.rightAnchor).isActive = true
                
                descLabel.translatesAutoresizingMaskIntoConstraints = false
                
                descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
                descLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
                descLabel.rightAnchor.constraint(equalTo: upperPart.rightAnchor).isActive = true
        
        xpLabel.translatesAutoresizingMaskIntoConstraints = false
                
                xpLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor).isActive = true
                xpLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
                xpLabel.rightAnchor.constraint(equalTo: upperPart.rightAnchor).isActive = true
                
                feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        feedbackLabel.topAnchor.constraint(equalTo: xpLabel.bottomAnchor).isActive = true
                feedbackLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
                feedbackLabel.rightAnchor.constraint(equalTo: upperPart.rightAnchor).isActive = true
                feedbackLabel.bottomAnchor.constraint(equalTo: upperPart.bottomAnchor).isActive = true
                
                phoneTitleLabel.translatesAutoresizingMaskIntoConstraints = false

                phoneTitleLabel.topAnchor.constraint(equalTo: lowerPart.topAnchor, constant: 15).isActive = true
                phoneTitleLabel.leftAnchor.constraint(equalTo: lowerPart.leftAnchor).isActive = true
                phoneTitleLabel.rightAnchor.constraint(equalTo: lowerPart.rightAnchor).isActive = true

                phoneLabel.translatesAutoresizingMaskIntoConstraints = false

                phoneLabel.topAnchor.constraint(equalTo: phoneTitleLabel.bottomAnchor, constant: 10).isActive = true
                phoneLabel.leftAnchor.constraint(equalTo: lowerPart.leftAnchor).isActive = true
                phoneLabel.rightAnchor.constraint(equalTo: lowerPart.rightAnchor).isActive = true

                contactTitleLabel.translatesAutoresizingMaskIntoConstraints = false

                contactTitleLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20).isActive = true
                contactTitleLabel.leftAnchor.constraint(equalTo: lowerPart.leftAnchor).isActive = true
                contactTitleLabel.rightAnchor.constraint(equalTo: lowerPart.rightAnchor).isActive = true

                contactLabel.translatesAutoresizingMaskIntoConstraints = false

                contactLabel.topAnchor.constraint(equalTo: contactTitleLabel.bottomAnchor, constant: 10).isActive = true
                contactLabel.leftAnchor.constraint(equalTo: lowerPart.leftAnchor).isActive = true
                contactLabel.rightAnchor.constraint(equalTo: lowerPart.rightAnchor).isActive = true
                contactLabel.bottomAnchor.constraint(equalTo: lowerPart.bottomAnchor, constant: -20).isActive = true
            }
        }

