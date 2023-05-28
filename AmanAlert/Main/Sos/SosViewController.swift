
import Foundation
import UIKit
import AVFoundation
import MessageUI
import CoreLocation

class SosViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    let locationManager = CLLocationManager()
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
              
              // Handle the result if needed
              switch result {
              case .cancelled:
                  print("cancelled")
                  break
              case .sent:
                  print("sended")
                  break
              case .failed:
                  print("failed")
                  break
              @unknown default:
                  break
              }
    }
   
    var phoneNumber: String = "996501515333"
    var phoneMessageNumber: String = "996501515333"
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configure()
        setUpConstraints()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchDown)
    }
    
    @objc func updateCounter() {
        if totalTime != 0 {
            print("\(totalTime) seconds to the end of the world")
            totalTime = totalTime - 1
            seconds.text = "\(totalTime)"
        } else {
            timer.invalidate()
            seconds.text = "Отправлено "
            print("DONE")
            sendSosMessage(phoneNumber)
           // navigationController?.popViewController(animated: true)
        }
    }
    

    
    private func sendSosMessage(_ number: String) {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            if let currentLocation =  locationManager.location {
                   let messageController = MFMessageComposeViewController()
                   messageController.recipients =  [phoneNumber]
                   messageController.body = "SOS, Помоги мне: мои геоданные: \(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)"
                   messageController.messageComposeDelegate = self
                   
                  present(messageController, animated: true, completion: nil)
               }
           }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    @objc func cancelButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        navigationController?.popViewController(animated: true)
    }
    
    let label: UILabel = {
        let text = UILabel()
        text.text = "Отправить SOS"
        text.font = .boldSystemFont(ofSize: 32)
        text.textAlignment = .center
        text.textColor = .black
        return text
    }()
    
    let seconds: UILabel = {
        let text = UILabel()
        text.text = "5"
        text.font = .boldSystemFont(ofSize: 64)
        text.textAlignment = .center
        text.textColor = UIColor(named: "blueButtonColor")
        return text
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    func setUpView() {
        view.backgroundColor = .white
        title = "Main"
    }
    
    func configure() {
        view.addSubview(seconds)
        view.addSubview(label)
        view.addSubview(cancelButton)
    }
    
    func setUpConstraints() {
        
        cancelButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(290)
            $0.height.equalTo(45)
        }
        
        seconds.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(cancelButton.snp.top).offset(-25)
        }
        
        label.snp.makeConstraints {
            $0.bottom.equalTo(seconds.snp.top).offset(-28)
            $0.centerX.equalToSuperview()
        }
    }
}
