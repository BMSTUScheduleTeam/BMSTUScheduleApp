//
//  EventCell.swift
//  BMSTUSchedule
//
//  Created by Artem Belkov on 26/10/2016.
//  Copyright © 2016 BMSTU Team. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell, CellViewModelProtocol {

    @IBOutlet weak var breakLabel: UILabel!

    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var kindView: UIView!
    
    // FIXME: Create kind colors in Theme
    let kindColors = [
        "lecture": AppTheme.shared.greenColor,
        "seminar": AppTheme.shared.blueColor,
        "lab"    : AppTheme.shared.yellowColor,
        ""       : UIColor.gray
    ]
    
    override func awakeFromNib() {
        
        kindView.layer.cornerRadius = 2
    }
    
    override func prepareForReuse() {
        
        breakLabel.text = ""
        
        startTimeLabel.text = ""
        endTimeLabel.text = ""
        
        titleLabel.text = ""
        
        teacherLabel.text = ""
        roomLabel.text = ""
        kindLabel.text = ""
        kindView.backgroundColor = kindColors["default"]
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        if highlighted {
            self.backgroundColor = UIColor.gray.withAlphaComponent(0.15)
        } else {
            self.backgroundColor = UIColor.white
        }
    }
    
    // MARK: - CellViewModelProtocol
    
    func fillCell(model: CellViewModel) {
        
        guard let castedModel = model as? EventCellViewModel else {
            return
        }
        
        breakLabel.text = castedModel.brakeText
        
        startTimeLabel.text = castedModel.startTime
        endTimeLabel.text = castedModel.endTime
        
        titleLabel.text = castedModel.titleText
        
        teacherLabel.text = castedModel.teacherText
        roomLabel.text = castedModel.roomText
        kindLabel.text = castedModel.kindText.localized
        kindLabel.textColor = kindColors[castedModel.kindText]
        kindView.backgroundColor = kindColors[castedModel.kindText]
    }
}
