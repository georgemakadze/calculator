//
//  ViewController.swift
//  Calc
//
//  Created by Giorgi Makadze on 16.11.2022.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var lcdDisplay: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var pinpadButton0: UIButton!
    @IBOutlet weak var pinpadButton1: UIButton!
    @IBOutlet weak var pinpadButton2: UIButton!
    @IBOutlet weak var pinpadButton3: UIButton!
    @IBOutlet weak var pinpadButton4: UIButton!
    @IBOutlet weak var pinpadButton5: UIButton!
    @IBOutlet weak var pinpadButton6: UIButton!
    @IBOutlet weak var pinpadButton7: UIButton!
    @IBOutlet weak var pinpadButton8: UIButton!
    @IBOutlet weak var pinpadButton9: UIButton!
    
    @IBOutlet weak var clerButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var persentageButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var divadeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!

    
    @IBOutlet weak var decimalButton: UIButton!
    
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(backgroundColor: "#000000", displayColor: "#FFFFFF", extraFunctionColor: "#a6a6a6", extraFunctionTitleColor: "#FFFFFF", operationColor: "#ff9f0a", operationTitleColor: "#FFFFFF", pinpadColor: "#333333", pinpadTitleColor: "#FFFFFF")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decorateView()
    }
    
    private func decorateView () {
        
        
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = UIColor(hex: currentTheme.displayColor)
        displayLabel.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        
        decorateButton()
    }
    
    private func decorateButton() {
        decoratePinPadButton(pinpadButton0, true)
        decoratePinPadButton(pinpadButton1)
        decoratePinPadButton(pinpadButton2)
        decoratePinPadButton(pinpadButton3)
        decoratePinPadButton(pinpadButton4)
        decoratePinPadButton(pinpadButton5)
        decoratePinPadButton(pinpadButton6)
        decoratePinPadButton(pinpadButton7)
        decoratePinPadButton(pinpadButton8)
        decoratePinPadButton(pinpadButton9)
        
        decorateExtraFunctionButton(clerButton)
        decorateExtraFunctionButton(negateButton)
        decorateExtraFunctionButton(persentageButton)
        
        decorateOperationButton(equalsButton)
        decorateOperationButton(divadeButton)
        decorateOperationButton(addButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(multiplyButton)
        
        decoratePinPadButton(decimalButton)
        
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false){
        let image = usingSlicedImage ? UIImage(named: "CircleSliced") : UIImage(named: "Circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
        
    }
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
        
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    


}

