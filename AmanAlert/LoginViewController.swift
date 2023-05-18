////
////  LoginViewController.swift
////  AmanAlert
////
////  Created by Arstanbaeva Aisuluu on 21.04.2023.
////
//
//import Foundation
//import UIKit
//
//class LoginViewController: UIViewController {
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if viewModel.isAuthorized {
//            let controller = BaseTabViewController()
//            controller.modalPresentationStyle = .overFullScreen
//            present(controller, animated: true)
//        } else {
//            let controller = DIService.shared.getVc(SplashViewController.self)
//            controller.modalPresentationStyle = .overFullScreen
//            present(controller, animated: true)
//        }
//    }
//    
//    init(viewModel vm: SplashViewModelType) {
//        viewModel = vm
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
