//
//  ItemDetailsVC.swift
//  11-Coredata
//
//  Created by Alex Comunian on 18/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }

}
