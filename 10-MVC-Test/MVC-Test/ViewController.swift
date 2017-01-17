//
//  ViewController.swift
//  MVC-Test
//
//  Created by Alex Comunian on 17/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let person = Person(first: "Alex", last: "Comu")

    
    
    @IBOutlet weak var renameText: UITextField!
    @IBOutlet weak var fullName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = person.fullName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func renamePressed(_ sender: Any) {
        if let txt = renameText.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }

}

