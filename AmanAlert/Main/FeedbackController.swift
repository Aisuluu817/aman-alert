//
//  FeedbackController.swift
//  AmanAlert
//
//  Created by Arstanbaeva Aisuluu on 27.04.2023.
//

import Foundation
import UIKit
import SnapKit


class FeedbackController: UIViewController {
    var items: [String] = [" Отлично, очень помогли ", " Хорошо",
                           " Плохо, не помогло", " Не поняла как использовать"]
    
    var isSelected: [Bool] = [false, true, false, false]
    
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "Как Вы оцените \nнаше приложение?"
        text.font = .boldSystemFont(ofSize: 28)
        text.textAlignment = .center
        text.textColor = .black
        text.numberOfLines = 2
        return text
    }()
    
    lazy var finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Закончить", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(RadioButtonCell.self, forCellReuseIdentifier: "cell")
        return tv
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
    
    let staskView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setUpView() {
        view.backgroundColor = .white
        title = "O приложении"
    }
    
    func configure() {
       
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(backButton)
        view.addSubview(finishButton)
        view.addSubview(tableView)
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
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalTo(finishButton.snp.top).offset(-10)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(165)
            $0.height.equalTo(45)
        }
        
        finishButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(165)
            $0.height.equalTo(45)
        }
    }
}

extension FeedbackController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RadioButtonCell
        cell.label.text = items[indexPath.row]
        let image: UIImage = isSelected[indexPath.row] ? UIImage(named: "ic_radiobutton_checked")! : UIImage(named: "ic_radiobutton_unchecked")!
        cell.radioButton.setImage(image, for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
