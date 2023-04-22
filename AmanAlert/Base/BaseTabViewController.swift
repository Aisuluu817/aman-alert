import UIKit


enum TabBar: CaseIterable {
    case Main
    case Info
    case AboutApp
    case Chat
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .Main: return UITabBarItem(title: nil, image: UIImage(systemName: "ic_main_icon"), selectedImage: nil)
        case .Info: return UITabBarItem(title: nil, image: UIImage(systemName: "ic_info_icon"), selectedImage: nil)
        case .AboutApp: return UITabBarItem(title: nil, image: UIImage(systemName: "ic_about_app_icon"), selectedImage: nil)
        case .Chat: return UITabBarItem(title: nil, image: UIImage(systemName: "ic_chat_icon"), selectedImage: nil)
        }
    }
    
    var viewController: UINavigationController {
        var vc = UINavigationController()
        switch self {
        case .Main: vc = UINavigationController(rootViewController: MainViewController())
        case .Info: vc = UINavigationController(rootViewController: InfoViewController())
        case .AboutApp: vc = UINavigationController(rootViewController: AboutAppViewController())
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
        view.backgroundColor = .clear
        viewControllers = TabBar.allCases.map({ $0.viewController })
        
//        let main = UINavigationController(rootViewController: MainViewController())
//        let info = UINavigationController(rootViewController: InfoViewController())
//        let aboutApp = UINavigationController(rootViewController: AboutAppViewController())
//        let chat = UINavigationController(rootViewController: ChatViewController())
    }
}
