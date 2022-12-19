//
//  EquationTableViewCell.swift
//  Calc
//
//  Created by Giorgi Makadze on 14.12.2022.
//

import UIKit

class EquationTableViewCell: UITableViewCell {
    
    @IBOutlet var lhsLabel: UILabel!
    @IBOutlet var rhsLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tick: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tick.alpha = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func displayTick() {
        UIView.animate(withDuration: 0.25, delay: 0, options: []) { [weak self] in
            self?.tick.alpha = 1
            self?.tick.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: []) { [weak self] in
                self?.tick.transform = CGAffineTransform.identity
            } completion: { _ in
                
                
            }
        }
        
    }
    
}
