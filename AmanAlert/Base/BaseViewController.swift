//
//  BaseViewController.swift
//  AmanAlert
//
//  Created by Arstanbaeva Aisuluu on 22.04.2023.
//

import Foundation

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
 
    private func setUp() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationController?.navigationBar.backgroundColor = Asset.clientBackround.color
//        navigationController?.navigationBar.barTintColor =  Asset.clientBackround.color
        navigationController?.navigationBar.isTranslucent = false
//        view.backgroundColor = Asset.clientBackround.color
    }
}
