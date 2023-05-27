import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    let tableView = UITableView()
    
    var items: [Psychologist] = []
    
    public lazy var chatMenuTitle: UILabel = {
        let label = UILabel()
        label.text = "Uslugi Psihologa"
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
        //        return items.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PsychologistCell", for: indexPath) as! PsychologistCell
        cell.nameLabel.text = "Psychologist"
        cell.descLabel.text = "MBBS, MS - Психолог, психотерапевт. гештальт терапевт, семейный коуч"
        cell.xpLabel.text = "12 let kak specialist"
        cell.feedbackLabel.text = "5 zvezd iz 5"
        
        cell.phoneTitleLabel.text = "phone"
        cell.phoneLabel.text = "+996 701 222 002"
        cell.contactTitleLabel.text = "Contact with Whats' App"
        cell.contactLabel.text = "+996 701 222 002"
        
        cell.selectionStyle = .none
        return cell
    }
    
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 100
//        }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //    }
}
