//
//  LocalizationViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/28/24.
//

import UIKit

class LocalizationViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var justButton: UIButton!
    @IBOutlet weak var isDoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 다국어 대응
        profileLabel.text = NSLocalizedString("cancel", comment: "")
        
    }
    
    @IBAction func justButtonTapped(_ sender: UIButton) {
        // 메서드로 써도 되고
        let title = "alert_title".localized()
        // let title = NSLocalizedString("alert_title", comment: "")
        
        // 연산 프로퍼티 써도 돼
        // let content = "alert_contents".local + " \(nicknameTextField.text!)."
        // let content = NSLocalizedString("alert_contents", comment: "")
        // let test = String(format: "저는 %@입니다.", nicknameTextField.text!)
        
        // let content = String(format: "alert_contents".local, nicknameTextField.text!)
        
        let content = "alert_contents".localized(with: nicknameTextField.text!)
        
        let saveString = "alert_save".local
        let cancelString = "alert_cancel".local
        
        let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        let ok = UIAlertAction(title: saveString, style: .default)
        let cancel = UIAlertAction(title: cancelString, style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
}
