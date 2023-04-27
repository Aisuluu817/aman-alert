

import Foundation
import UIKit
import SnapKit


class MainSosContactController: UIViewController {
    let items: [String] = [" 102 Милиция", " 911 Служба спасения"]
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "SOS"
        text.font = .boldSystemFont(ofSize: 28)
        text.textAlignment = .center
        text.textColor = .black
        text.numberOfLines = 2
        return text
    }()
    
    let tableView = UITableView()
    
    var addButtonCell: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_add_contact_cell"), for: .normal)
        return button
    }()
    
    public lazy var callButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Позвонить", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RadioButtonCell.self, forCellReuseIdentifier: "RadioButtonCell")
        
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchDown)
        addButtonCell.addTarget(self, action: #selector(addButtonCellPressed(_:)), for: .touchDown)
    }
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(backButton)
        view.addSubview(callButton)
        view.addSubview(tableView)
        view.addSubview(addButtonCell)
    }
    
    func setUpConstraints() {
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
        }
        label.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(image.snp.bottom).offset(10)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
            $0.height.equalTo(135)
        }
        addButtonCell.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        backButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-120)
            $0.centerX.equalToSuperview()
        }
        callButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalTo(backButton.snp.top).offset(-8)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonCellPressed(_ sender: UIButton) {
        let controller = AddContactController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MainSosContactController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioButtonCell", for: indexPath) as! RadioButtonCell
        cell.label.text = items[indexPath.row]
        return cell
    }
}



