//
//  ViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

 import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 1번
//        viewModel.outputResult.bind {
//            print(" ☃️ ")
//            self.resultLabel.text = self.viewModel.outputResult.text
//        }
        // -> 얘는 Observable의 text didSet으로 수행되는 것
        
        viewModel.outputResult.bind { text in
            self.resultLabel.text = text
        }
        
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    @objc func numberTextFieldChanged() {
        // viewModel.inputText = numberTextField.text
        // MARK: 2번
        // resultLabel.text = viewModel.outputResult.text
        // 얘는 뷰에서 텍필 바뀔때마다 호출되는 것
        
        viewModel.inputText.text = numberTextField.text!
    }
}

