
import Foundation
import UIKit

class SosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
    }
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "Отправить SOS"
        text.font = .boldSystemFont(ofSize: 32)
        text.textAlignment = .center
        text.textColor = .black
        return text
    }()
    
    let seconds: UILabel = {
        let text = UILabel()
        text.text = "10"
        text.font = .boldSystemFont(ofSize: 64)
        text.textAlignment = .center
        text.textColor = UIColor(named: "blueButtonColor")
        return text
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    func setUpView() {
        view.backgroundColor = .white
        title = "Main"
    }
    
    func configure() {
        view.addSubview(seconds)
        view.addSubview(label)
        view.addSubview(cancelButton)
    }
    
    func setUpConstraints() {
        
        cancelButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(290)
            $0.height.equalTo(45)
        }
        
        seconds.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(cancelButton.snp.top).offset(-25)
        }
        
        label.snp.makeConstraints {
            $0.bottom.equalTo(seconds.snp.top).offset(-28)
            $0.centerX.equalToSuperview()
        }
    }
}
