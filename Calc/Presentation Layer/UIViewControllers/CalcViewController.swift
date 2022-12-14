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
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!

    
    @IBOutlet weak var decimalButton: UIButton!
    
    var needToDisplayWelcomeIntro = true
    
    // MARK: - Color Themes
    
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
        prepareForWelcomeIntro()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needToDisplayWelcomeIntro {
            needToDisplayWelcomeIntro = false
            displayWelcomeIntro()
        }
    }
    
    private func prepareForWelcomeIntro() {
        lcdDisplay.alpha = 0
    }
    
    private func displayWelcomeIntro() {
        
        let didRestoreFromLastSession = calculatorEngine.restoreFromLastSession()
        refreshLCDDisplay()
        
        let timeDelay: TimeInterval = 0.25
            if didRestoreFromLastSession {
                slideInLCDDisplay(withDelay: timeDelay)
            } else {
                fadeInLCDDisplay(withDelay: timeDelay)
            }
            
        }
        
    
    
    private func fadeInLCDDisplay(withDelay delay: TimeInterval) {
        UIView.animate(withDuration: 1.0, delay: delay, options: .curveEaseOut) { [weak self] in
            self?.lcdDisplay.alpha = 1
        } completion: { _ in
            
        }
    }
    
    private func slideInLCDDisplay(withDelay delay: TimeInterval) {
        lcdDisplay.transform = CGAffineTransform(translationX: 0, y: lcdDisplay.frame.height * 0.5)
        UIView.animate(withDuration: 0.35, delay: delay, options: .curveEaseOut) { [weak self] in
            self?.lcdDisplay.alpha = 1
            self?.lcdDisplay.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { _ in
            
        }
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
        
        decorateExtraFunctionButton(clearButton)
        decorateExtraFunctionButton(negateButton)
        decorateExtraFunctionButton(percentageButton)
        
        decorateOperationButton(equalsButton)
        decorateOperationButton(divideButton)
        decorateOperationButton(addButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(multiplyButton)
        
        decoratePinPadButton(decimalButton)
        
    }
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false){
        let image = usingSlicedImage ? UIImage(named: UIImage.keys.circleSliced) : UIImage(named: UIImage.keys.circle)
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
        
        if button.isSelected {
            selectOperationButton(button, true)
        }
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
        clearButton.bounce()
        deselectOperationButtons()
        
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        negateButton.bounce()
        
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func percentagePressed() {
        percentageButton.bounce()
        
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operation
    
    @IBAction private func addPressed() {
        addButton.bounce()
        
        deselectOperationButtons()
        selectOperationButton(addButton, true)
        
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        minusButton.bounce()
        
        deselectOperationButtons()
        selectOperationButton(minusButton, true)
        
        calculatorEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        multiplyButton.bounce()
        
        deselectOperationButtons()
        selectOperationButton(multiplyButton, true)
        
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        divideButton.bounce()
        
        deselectOperationButtons()
        selectOperationButton(divideButton, true)
        
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        equalsButton.bounce()
        
        deselectOperationButtons()
        
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        decimalButton.bounce()
        
        deselectOperationButtons()
        
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        sender.bounce()
        
        deselectOperationButtons()
        
        let number = sender.tag
        calculatorEngine.pinPadPressed(number)
        refreshLCDDisplay()
    }
    // MARK: - Refrec LCDDislay
    
    private func refreshLCDDisplay() {
        lcdDisplay.label.text = calculatorEngine.lcdDisplayText
    }
    
    // MARK: - Notifications
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReccievePasteNotification(notification:)), name: Notification.Name(LCDDisplay.keys.pasteNumberNotification), object: nil )
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveHistoryLogNotification(notification:)), name: Notification.Name(LCDDisplay.keys.historyLogNotification), object: nil )
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivePasteMathEquationNotification(notification:)), name: Notification.Name(LogViewController.keys.pasteEquationNotification), object: nil )
    }
    
    @objc private func didReceivePasteMathEquationNotification(notification: Notification) {
        guard let mathEquation = notification.userInfo?[LogViewController.keys.pasteNumberKey] as? MathEquation else { return }
        
        pasteMathEquationIntoCalculator(from: mathEquation)
    }
    
   @objc private func didReccievePasteNotification(notification: Notification) {
       guard let doubleValue = notification.userInfo?[LCDDisplay.keys.pasteNumberKey] as? Double else { return }
       
       pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }
    
    @objc private func didReceiveHistoryLogNotification(notification: Notification) {
        presentHistoryLogScreen()
    }
    
    // MARK: - History Log Screen
    
    private func presentHistoryLogScreen() {
        let storyboard = UIStoryboard(name: UIStoryboard.keys.mainStoryboard , bundle: nil)
        guard let logViewController = storyboard.instantiateViewController(withIdentifier: UIStoryboard.keys.logViewController) as? LogViewController else {
            return
        }
        
        logViewController.datasource = calculatorEngine.historyLog
        
        let navigationController = UINavigationController(rootViewController: logViewController)
        
        let theme = ThemeManager.shared.currentTheme
        navigationController.navigationBar.backgroundColor = UIColor(hex: theme.backgroundColor)
        navigationController.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        present(navigationController, animated: true, completion: nil )
    }
    
    // MARK: - Copy & Paste
    
    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshLCDDisplay()
    }
    
    private func pasteMathEquationIntoCalculator(from mathEquation: MathEquation) {
        calculatorEngine.pasteInMathEquation(from: mathEquation)
        refreshLCDDisplay()
    }
    
}

