import Foundation
import UIKit
import Moya
import RxSwift


class LoginViewController: UIViewController {
    
    private var isAuthorized = false
    let networkManager = NetworkManager()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if checkIfAuthorized() {
            navigationController?.pushViewController(BaseTabViewController(), animated: true)
            navigationController?.removeViewController(LoginViewController.self)
        }
        setUpView()
        configure()
        setConstraints()
        numberTextField.delegate = self
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchDown)
    }
    
    private func checkIfAuthorized() -> Bool {
        if let token = UserDefaults.standard.string(forKey: "token") {
            return true
        }
        return false
    }

    @objc func addButtonPressed(_ sender: UIButton) {
        let controller  = CodeInputController()
      //  networkManager.signIn("996509817818")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    let stackView = UIStackView()
    
    public lazy var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_aman_blue"))
        return image
    }()
    
    public lazy var authTitle: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    
    public lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Введите свой номер телефона"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    public lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var numberTextField: UITextField = {
        let field = UITextField()
        field.text = "    996509817818"
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
        view.addSubview(numberLabel)
        view.addSubview(numberTextField)
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
        numberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(subtitle.snp.bottom).offset(60)
        }
        numberTextField.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(5)
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
