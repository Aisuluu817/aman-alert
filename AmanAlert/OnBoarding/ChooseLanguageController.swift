import Foundation
import UIKit
import SnapKit


class ChooseLanguageController: UIViewController {
    
    
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "Выберите язык для \nиспользования"
        text.font = .boldSystemFont(ofSize: 28)
        text.textAlignment = .center
        text.textColor = .black
        text.numberOfLines = 2
        return text
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(RadioButtonCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    
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
        title = "Main"
    }
    
    func configure() {
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(startButton)
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
            $0.top.equalTo(label.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(startButton.snp.top).offset(10)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(290)
            $0.height.equalTo(45)
        }
        
    }
}

extension ChooseLanguageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RadioButtonCell
        return cell
        
    }
}
