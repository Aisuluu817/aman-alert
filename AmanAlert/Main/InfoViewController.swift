
import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info"
        setUpView()
        configure()
        setUpConstraints()
    }
    
    public lazy var infoTitle: UILabel = {
        let label = UILabel()
        label.text = "Актуальные"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "InfoCell")
        return tv
    }()
    
    func setUpView() {}
    
    func configure() {
        view.addSubview(infoTitle)
    }
    
    func setUpConstraints() {
        infoTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(16)
        }
    }
}


