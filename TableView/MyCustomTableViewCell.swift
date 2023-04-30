//
//  MyCustomTableViewCell.swift
//  TableView
//
//  Created by Edgar Gamarra on 29/04/23.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    // esta funcion se ejecuta por primera vez
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        backgroundColor = .gray
        
        mySecondLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        print(myFirstLabel.text ?? "")
    }
    
}
