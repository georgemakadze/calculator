//
//  CalcViewController.swift
//  Calc
//
//  Created by Giorgi Makadze on 16.11.2022.
//

import UIKit


      // MARK: - IBOutlets
class CalcViewController: UIViewController {
    @IBOutlet weak var lcdDisplay: LCDDisplay!
   
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
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!

    
    @IBOutlet weak var decimalButton: UIButton!
    
    // MARK: - Color Themes
    
    /*
     gray:       #a6a6a6
     dark gray:  #333333
     orange:     #ff9f0a
     purple:     #7550FE
     */
    
    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }
    
    
    // MARK: - Calculator Engine
    
    private var calculatorEngine = CalculatorEngine()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addThemeGestureRecogniser()
        redecorateView()
        registerForNotifications()
    }
    
    // MARK: - Gestures
    
    private func addThemeGestureRecogniser() {
        let themeGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.themeGestureRecogniserDidTap(_:)))
        themeGestureRecogniser.numberOfTapsRequired = 2
        lcdDisplay.addGestureRecognizer(themeGestureRecogniser)
    }
    
    @objc private func themeGestureRecogniserDidTap(_ gesture: UITapGestureRecognizer) {
        lcdDisplay.prepareForColorThemeUptade()
        decorateViewWithNextTheme()
    }
    
    // MARK: - Decorate
    
    private func decorateViewWithNextTheme() {
        ThemeManager.shared.moveToNextTheme()
        redecorateView()
    }
    
    private func redecorateView() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = .clear
        lcdDisplay.label.textColor = UIColor(hex: currentTheme.displayColor)
        lcdDisplay.label.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        
        setNeedsStatusBarAppearanceUpdate()
        
        decorateButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch currentTheme.statusBarStyle {
        case .light: return .lightContent
        case .dark: return .darkContent
        }
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
        decorateOperationButton(divideButton)
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleSelectedColor), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
        
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    // MARK: - Select Operation Buttons
    
    private func deselectOperationButtons() {
        selectOperationButton(multiplyButton, false)
        selectOperationButton(minusButton, false)
        selectOperationButton(addButton, false)
        selectOperationButton(divideButton, false)
    }
    
    private func selectOperationButton(_ button: UIButton, _ selected: Bool) {
        button.tintColor = selected ? UIColor(hex: currentTheme.operationSelectedColor) : UIColor(hex: currentTheme.operationColor)
        button.isSelected = selected
    }
    
    // MARK: - IBAction
    
    @IBAction private func clearPressed() {
        deselectOperationButtons()
        
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func percentagePressed() {
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operation
    
    @IBAction private func addPressed() {
        deselectOperationButtons()
        selectOperationButton(addButton, true)
        
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        deselectOperationButtons()
        selectOperationButton(minusButton, true)
        
        calculatorEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        deselectOperationButtons()
        selectOperationButton(multiplyButton, true)
        
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        deselectOperationButtons()
        selectOperationButton(divideButton, true)
        
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        deselectOperationButtons()
        
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        deselectOperationButtons()
        
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        deselectOperationButtons()
        
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshLCDDisplay()
    }
    // MARK: - Refrec LCDDislay
    
    private func refreshLCDDisplay() {
        lcdDisplay.label.text = calculatorEngine.lcdDisplayText
    }
    
    // MARK: - Notifications
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReccievePasteNotification(notification:)), name: Notification.Name("IOSBFree.com.Calc.LCDDisplay.pasteNumber"), object: nil )
    }
    
   @objc private func didReccievePasteNotification(notification: Notification) {
       guard let doubleValue = notification.userInfo?["PasteKey"] as? Double else { return }
       
       pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }
    
    // MARK: - Copy & Paste
    
    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshLCDDisplay()
    }
    
}

