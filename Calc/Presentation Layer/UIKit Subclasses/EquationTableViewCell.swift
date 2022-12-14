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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
