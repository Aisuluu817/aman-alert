
import Foundation
import UIKit
import RxSwift

class InfoViewController: UIViewController {
//    var items: [String] = ["samooborona1", "statistics", "ic_aman_blue", "samooborona1", "samooborona1"]
//    var labels: [String] = ["Уроки самообороны 3", "Cтатистика инцидентов",
//                            "обновления приложения","Уроки самообороны 2", "Уроки самообороны 1" ]
    
    var items: [News] = []
    var networkManager = NetworkManager()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info"
        setUpView()
        fetchNews()
        configure()
      
        setUpConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    public func fetchNews() {
        networkManager.getAllNews().subscribe{ [weak self] data in
            switch data {
            case .success(let news):
                self?.items.append(contentsOf: news)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.disposed(by: disposeBag)
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
        tv.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        return tv
    }()
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    func configure() {
        view.addSubview(infoTitle)
        view.addSubview(tableView)
    }
    
    func setUpConstraints() {
        infoTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(infoTitle.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
        cell.image.image = UIImage(named: items[indexPath.row].urlImage)
        cell.title.text = items[indexPath.row].title
        cell.desc.text = items[indexPath.row].description
        
        cell.layer.cornerRadius = 16
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}
