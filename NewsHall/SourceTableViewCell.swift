//
//  SourceTableViewCell.swift
//  
//
//  Created by Ankit Kumar on 15/04/16.
//
//

import UIKit

class SourceTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var sourceImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var rating1Label: UILabel!
    @IBOutlet weak var rating2Label: UILabel!
    @IBOutlet weak var rating3Label: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
