
import Foundation
import UIKit
import RxSwift

class FillOutFormController: UIViewController {
    
    var networkManager = NetworkManager()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
    }
    
    public lazy var formTitle: UILabel = {
        let label = UILabel()
        label.text = "Заполнить анкету"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var nameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "  Ваше имя"
        field.font = .systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.backgroundColor = UIColor(named: "textFieldColor")
        field.layer.borderColor = UIColor(named: "textFieldStrokeColor")?.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var whatTitle: UILabel = {
        let label = UILabel()
        label.text = "Что произошло?"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var whatTextField: UITextView = {
        let field = UITextView()
        field.layer.masksToBounds = true
        field.font = .systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.backgroundColor = UIColor(named: "textFieldColor")
        field.layer.borderColor = UIColor(named: "textFieldStrokeColor")?.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var whereTitle: UILabel = {
        let label = UILabel()
        label.text = "Где произошло?"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var whereTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "  Место"
        field.font = .systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.backgroundColor = UIColor(named: "textFieldColor")
        field.layer.borderColor = UIColor(named: "textFieldStrokeColor")?.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var whenTitle: UILabel = {
        let label = UILabel()
        label.text = "Когда произошло?"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var whenTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "  Месяц/ Число/ Год"
        field.font = .systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.backgroundColor = UIColor(named: "textFieldColor")
        field.layer.borderColor = UIColor(named: "textFieldStrokeColor")?.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    public lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Заполнить анкету", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        view.addSubview(formTitle)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(whatTitle)
        view.addSubview(whatTextField)
        view.addSubview(whereTitle)
        view.addSubview(whereTextField)
        view.addSubview(whenTitle)
        view.addSubview(whenTextField)
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(didStartButton(_:)), for: .touchDown)
    }
    
    @objc func didStartButton(_ sender: UIButton) {
        let formDTO = FormDTO(name: "Segodnya", eventDescription: "zavtra", eventLocation: "Hello", eventTime: "12:32")
        
        networkManager.report(formDTO)
    }
    
    private func navigateToBottomSheet() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setUpConstraints() {
        formTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(16)
        }
        nameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(formTitle.snp.bottom).offset(40)
        }
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        whatTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(nameTextField.snp.bottom).offset(30)
        }
        whatTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(whatTitle.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        whereTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(whatTextField.snp.bottom).offset(30)
        }
        whereTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(whereTitle.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        whenTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(whereTextField.snp.bottom).offset(30)
        }
        whenTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
            $0.top.equalTo(whenTitle.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-120)
            $0.centerX.equalToSuperview()
        }
    }
}
