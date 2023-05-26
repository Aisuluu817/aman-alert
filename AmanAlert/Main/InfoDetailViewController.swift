
import UIKit
import RxSwift

class InfoDetailsViewController: UIViewController {
    
    var newsId: Int?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let networkManager = NetworkManager()
    var model = News(id: 0, title: "", description: "", urlImage: "")
    
    public lazy var infoDetailsTitle: UILabel = {
        let label = UILabel()
        label.text = model.title
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_aman_blue")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = model.description
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        setupView()
        configure()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        
        view.addSubview(infoDetailsTitle)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(image)
        contentView.addSubview(subtitleLabel)
    }
    
    
    func setupConstraints() {
        
        infoDetailsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        infoDetailsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        infoDetailsTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        infoDetailsTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: infoDetailsTitle.bottomAnchor, constant: 12).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 180).isActive = true
        image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
