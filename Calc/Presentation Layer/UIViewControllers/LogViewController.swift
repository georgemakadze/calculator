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

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let equation = datasource[indexPath.row]
        let userInfo: [AnyHashable: Any] = ["PasteKey" : equation]
        NotificationCenter.default.post(name: NSNotification.Name("IOSBFree.com.Calc.LogViewController.pasteMathEquation"), object: nil, userInfo: userInfo)
        
        dismiss(animated: true, completion: nil)
    }
    

  

}
