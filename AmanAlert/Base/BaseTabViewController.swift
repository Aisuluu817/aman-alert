import UIKit

enum TabBar: CaseIterable {
    case Main
    case Info
    case AboutApp
    case Chat
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .Main: return UITabBarItem(title: "Главная", image: UIImage(named: "ic_main_icon"), tag: 0)
        case .Info: return UITabBarItem(title: "Актуальные", image: UIImage(named: "ic_info_icon"), tag: 1)
        case .AboutApp: return UITabBarItem(title: "O приложении", image: UIImage(named: "ic_about_app_icon"), tag: 2)
        case .Chat: return UITabBarItem(title: "Чат", image: UIImage(named: "ic_chat_icon"), tag: 3)
        }
    }
    
    var viewController: UINavigationController {
        var vc = UINavigationController()
        switch self {
        case .Main: vc = UINavigationController(rootViewController: MainViewController())
        case .Info: vc = UINavigationController(rootViewController: InfoViewController())
        case .AboutApp: vc = UINavigationController(rootViewController: FeedbackController())
        case .Chat: vc = UINavigationController(rootViewController: ChatViewController())
        }
        vc.setNavigationBarHidden(true, animated: false)
        vc.tabBarItem = tabBarItem
        return vc
    }
}

class BaseTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        viewControllers = TabBar.allCases.map({ $0.viewController })
    }
}
