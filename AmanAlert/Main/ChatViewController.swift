import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    let tableView = UITableView()
    
    var items: [Psychologist] = [
    Psychologist(name: "Эльмира Мукашевна",
                 description: "MBBS, MS - Психолог, психотерапевт. гештальт терапевт, семейный коуч",
                 urlImage: "psy1",
                 rating: "5.0 / 10 отзывов",
                 stag: "8 лет",
                 phoneNumber: "996501515333"),
    Psychologist(name: "Анна Михайлована Р",
                 description: "MBBS, MS - Психолог, психотерапевт. гештальт терапевт, семейный коуч",
                 urlImage: "psy2",
                 rating: "4.9 ",
                 stag: "5 лет",
                 phoneNumber: "996555681717")
    ]
    
    public lazy var chatMenuTitle: UILabel = {
        let label = UILabel()
        label.text = "Услуги психолога"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        
        setupView()
        configure()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func setupView() {
        
        view.backgroundColor = .white
    }
    
    func configure() {
        
        tableView.register(PsychologistCell.self, forCellReuseIdentifier: "PsychologistCell")
        
        view.addSubview(chatMenuTitle)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        chatMenuTitle.translatesAutoresizingMaskIntoConstraints = false
        
        chatMenuTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        chatMenuTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        chatMenuTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: chatMenuTitle.bottomAnchor, constant: 12).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PsychologistCell", for: indexPath) as! PsychologistCell
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.descLabel.text = item.description
        cell.xpLabel.text = item.stag
        cell.feedbackLabel.text = item.rating
        
        cell.phoneTitleLabel.text = "Номер телефона: "
        cell.phoneLabel.text = item.phoneNumber
        cell.contactTitleLabel.text = "Связаться по WhatsApp: "
        cell.contactLabel.text = item.phoneNumber
        cell.avatarImage.image = UIImage(named: item.urlImage ?? "ic_aman_blue")
        
        cell.selectionStyle = .none
        return cell
    }
    
    //        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //            return 100
    //        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phoneNumber =  "+996501502502" // you need to change this number
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
}
