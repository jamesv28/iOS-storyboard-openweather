//
//  DailyCollectionCell.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/19/26.
//

import UIKit

class DailyCollectionCell: UICollectionViewCell {
   static let id = "DailyCollectionCell"
    
    @IBOutlet weak private var img: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var tempLabel: NSLayoutConstraint!
    func configure() {
        
    }
    
}
