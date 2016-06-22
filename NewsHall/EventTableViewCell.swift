//
//  EventTableViewCell.swift
//  
//
//  Created by Ankit Kumar on 15/04/16.
//
//

import UIKit

class EventTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
