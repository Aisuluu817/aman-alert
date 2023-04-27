
import Foundation
import UIKit
import Moya
import RxSwift

class CodeInputController: UIViewController {
    
    let provider = MoyaProvider<AuthTarget>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setConstraints()
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchDown)
    }
    
    @objc func addButtonPressed(_ sender: UIButton) {
        let controller = ChooseLanguageController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    public lazy var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
        return image
    }()
    
    public lazy var authTitle: UILabel = {
        let label = UILabel()
        label.text = "Авторизоваться"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    
    public lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Введите код из SMS"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    public lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var codeTextField: UITextField = {
        let field = UITextField()
        field.placeholder = " "
        field.font = .systemFont(ofSize: 15)
        field.layer.cornerRadius = 22
        field.backgroundColor = UIColor.white
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Авторизоваться", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        view.addSubview(image)
        view.addSubview(authTitle)
        view.addSubview(subtitle)
        view.addSubview(codeLabel)
        view.addSubview(codeTextField)
        view.addSubview(addButton)
    }
    
    func setConstraints() {
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(68)
        }
        authTitle.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        subtitle.snp.makeConstraints {
            $0.top.equalTo(authTitle.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        codeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(subtitle.snp.bottom).offset(50)
        }
        codeTextField.snp.makeConstraints {
            $0.top.equalTo(codeLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
        }
        addButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
        }
    }
}
