
import Foundation
import UIKit

class ChatViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        setUpConstraints()
    }
    func setUpView() {
        view.addSubview(infoTitle)
        view.addSubview(imageView)
    }
    
    public lazy var infoTitle: UILabel = {
        let label = UILabel()
        label.text = "Услуги психолога"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let imageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "card"))
        return image
    }()
    
    func setUpConstraints() {
        infoTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(16)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(infoTitle.snp.bottom).offset(-60)
            $0.leading.equalToSuperview()
        }
    }
}
