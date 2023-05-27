import Foundation
import UIKit
import SnapKit


class OnBoardingController: UIViewController {
    
    let stackView = UIStackView()
    
    public lazy var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_onboarding_1"))
        return image
    }()
    
    public lazy var label: UILabel = {
        let text = UILabel()
        text.font = .boldSystemFont(ofSize: 28)
        text.textAlignment = .center
        text.numberOfLines = 3
        return text
    }()
    
    public lazy var desc: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.numberOfLines = 3
        text.font = .systemFont(ofSize: 17)
        return text
    }()
    
    init(image: String, label: String, desc: String) {
        super.init(nibName: nil, bundle: nil)
        self.image.image = UIImage(named: image)
        self.label.text = label
        self.desc.text = desc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpConstraints()
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    
    func setUpView() {
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(desc)
    }
    
    func setUpConstraints() {
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        desc.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(38)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
    }
}
