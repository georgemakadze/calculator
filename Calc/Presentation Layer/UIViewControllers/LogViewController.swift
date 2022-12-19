//
//  LogViewController.swift
//  Calc
//
//  Created by Giorgi Makadze on 14.12.2022.
//

import UIKit

class LogViewController: UITableViewController {
    
    // MARK: - Datasource
    
    var datasource: [MathEquation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        setupNavigationBar()

    }
    
    // MARK: - Navigation Bar
    
    private func  setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
    }
    
    @objc private func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EquationTableViewCell", for: indexPath) as? EquationTableViewCell else {
            return UITableViewCell()
        }

        let equation = datasource[indexPath.row]
        cell.lhsLabel.text = equation.lhs.formatted()
        cell.rhsLabel.text = equation.generateStringRepresentationOfOperation() + " " + (equation.rhs?.formatted() ?? "")
        cell.resultLabel.text = "= " + (equation.result?.formatted() ?? "")
        cell.selectedBackgroundView = UIView()
        decorateCell(cell)
        
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? EquationTableViewCell else {
            return
        }
        
        let equation = datasource[indexPath.row]
        let userInfo: [AnyHashable: Any] = ["PasteKey" : equation]
        NotificationCenter.default.post(name: NSNotification.Name("IOSBFree.com.Calc.LogViewController.pasteMathEquation"), object: nil, userInfo: userInfo)
        
        tableView.isUserInteractionEnabled = false
        cell.displayTick()
        dismissAfterDelay()
    }
    
    private func dismissAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Decorate
    
    private func decorateCell(_ cell: EquationTableViewCell) {
        let theme = ThemeManager.shared.currentTheme
        cell.backgroundColor = UIColor(hex: theme.backgroundColor)
        cell.selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationColor)
        cell.lhsLabel.textColor = UIColor(hex: theme.displayColor)
        cell.rhsLabel.textColor = UIColor(hex: theme.displayColor)
        cell.resultLabel.textColor = UIColor(hex: theme.displayColor)
        cell.lhsLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.rhsLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.resultLabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.tick.tintColor = UIColor(hex: theme.operationTitleColor)
    }
    
    private func decorateView() {
        let theme = ThemeManager.shared.currentTheme
        tableView.backgroundColor = UIColor(hex: theme.backgroundColor)
        tableView.tintColor = UIColor(hex: theme.displayColor)
        
        tableView.separatorColor = UIColor(hex: theme.displayColor)
        switch theme.statusBarStyle {
        case .light: tableView.indicatorStyle = .white
        case .dark: tableView.indicatorStyle = .black
        }
    }
    
}
