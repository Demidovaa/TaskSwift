//
//  CustomTableViewCell.swift
//  TectClosuresInUI
//
//  Created by Анастасия Демидова on 16.05.2020.
//  Copyright © 2020 AnastasiaDemidova. All rights reserved.
//

import UIKit

enum AnimationState {
    case began
    case finished
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    var buttonTapHandler: ((CustomTableViewCell) -> Void)?
    
    @IBAction func testButton(_ sender: Any) {
        buttonTapHandler?(self)
        print("Кнопка была нажата")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
        
    func animate(animationState: @escaping ((AnimationState) -> Void)) {
        UIView.animate(withDuration: 5.0, animations: {
            self.statusLabel.alpha = 0
            animationState(.began)
        }) { (success) in
            animationState(.finished)
        }
    }
}
