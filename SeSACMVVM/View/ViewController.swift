//
//  ViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

 import UIKit

class ViewController: UIViewController {

    @IBOutlet  weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let food = Food("pizza")
        print(food.name) // pizza
        
        // 3. 클로저 활용
        
        
//        func test() {
//            print("test") // () -> Void 형태의 함수!
//        }
        
//        food.closure = test // 서로 같은 형태를 넣어줌
        
        // 위 두개를 합치면 요렇게!
//        food.closure = {
//            print("* test")
//        }
        
        
        
//        food.closure?() // * test // 4. 여기에 머 넣어보자
        
        food.test { // 얘는 closure 축약 형태임(소괄호 생략): @autoclosure
            print("🥟")// 클로저 매개변수로 넣은 형태
        }
        food.name = "maratang"
        
        food.name = "meat"
        print(food.name)
        
        
        
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

