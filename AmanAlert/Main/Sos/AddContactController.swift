
import Foundation
import UIKit
import RxSwift

class AddContactController: UIViewController {
    
    let networkManager = NetworkManager()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
        nameTextField.delegate = self
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchDown)
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchDown)
    }
    
    public lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.text = "Добавить контакт"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер "
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var numberTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "  +996 555 555 555"
        field.font = .systemFont(ofSize: 13)
        field.layer.cornerRadius = 22
        field.backgroundColor = UIColor.white
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var nameTextField: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 14)
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
        button.setTitle("Сохранить", for: .normal)
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
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        view.addSubview(screenTitle)
        view.addSubview(numberLabel)
        view.addSubview(numberTextField)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(addButton)
        view.addSubview(backButton)
    }
    
    func setUpConstraints() {
        
        screenTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(16)
        }
        numberLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(screenTitle.snp.bottom).offset(40)
        }
        numberTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(numberLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(numberTextField.snp.bottom).offset(20)
        }
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-120)
            $0.centerX.equalToSuperview()
        }
        addButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalTo(backButton.snp.top).offset(-8)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonPressed(_ sender: UIButton) {
        let contact = Contact(name: "Zhibek", phoneNumber: "996700000627")
        addContact(contact)
    }
    
    private func addContact(_ model: Contact) {
        networkManager.addContact(model)
            .subscribe { [weak self] data in
                switch data {
                case .success(let response):
                    print(response)
                    self?.showSuccessMessage()
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }.disposed(by: disposeBag)
    }
    
    private func showSuccessMessage() {
        let alert = UIAlertController(title: "Ваш контакт был добавлен!", message: nil,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}

extension AddContactController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
