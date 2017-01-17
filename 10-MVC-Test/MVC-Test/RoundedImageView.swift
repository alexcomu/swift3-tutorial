//
//  RoundedImageView.swift
//  MVC-Test
//
//  Created by Alex Comunian on 17/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
