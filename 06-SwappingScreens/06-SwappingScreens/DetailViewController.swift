//
//  DetailViewController.swift
//  06-SwappingScreens
//
//  Created by Alex Comunian on 02/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var songTitleLabel: UILabel!
    
    private var _selectedSong:String!
    
    var selectedSong:String{
        get{
            return _selectedSong
        }
        set{
            _selectedSong = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // value is setted by the other ViewController
        songTitleLabel.text = selectedSong
    }

    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
   
}
