
import Foundation
import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "Вы стали жертвой \nнасилия?"
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
        button.setTitle("Заполнить анкету", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var sosButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("SOS", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
    }
    
    func setUpView() {
        view.backgroundColor = .white
        title = "Main"
    }
    
    func configure() {
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(startButton)
        view.addSubview(sosButton)
        
        startButton.addTarget(self, action: #selector(fillFormPressed(_:)), for: .touchDown)
        sosButton.addTarget(self, action: #selector(sosButtonPressed(_:)), for: .touchDown)
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
        
        startButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(290)
            $0.height.equalTo(45)
        }
        sosButton.snp.makeConstraints {
            $0.top.equalTo(startButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(290)
            $0.height.equalTo(45)
        }
    }
    
    @objc func fillFormPressed(_ sender: UIButton) {
        let controller = FillOutFormController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func sosButtonPressed(_ sender: UIButton) {
        let controller = MainSosContactController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MainViewController {
    
    
}
