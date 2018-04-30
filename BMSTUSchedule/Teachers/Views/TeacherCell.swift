//
//  TeacherCell.swift
//  BMSTUSchedule
//
//  Created by a.belkov on 30/04/2018.
//  Copyright © 2018 BMSTU Team. All rights reserved.
//

import UIKit

class TeacherCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var liningView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareUI()
    }
    
    func fill() {
    
        photoView.image = #imageLiteral(resourceName: "test_teacher")
        nameLabel.text = "Абулкасимов Манас Мукитович"
        positionLabel.text = "старший преподаватель"
    }

    // MARK: - UI
    
    private func prepareUI() {

        // FIXME: Fix shadow
        liningView.layer.cornerRadius = 15.0
        liningView.layer.shadowColor = UIColor.black.withAlphaComponent(0.05).cgColor
        liningView.layer.shadowRadius = 15.0
        
        photoView.layer.cornerRadius = photoView.frame.height / 2
    }
}