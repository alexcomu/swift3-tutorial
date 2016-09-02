//
//  MusicListViewController.swift
//  06-SwappingScreens
//
//  Created by Alex Comunian on 02/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
    }

    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickMeButtonPressed(_ sender: AnyObject) {
        // segue programmatically
        let detailInfo = "Hello Friend"
        performSegue(withIdentifier: "DetailViewController", sender: detailInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // set the label for the third view controller
        if let destination = segue.destination as? DetailViewController{
            if let song = sender as? String{
                destination.selectedSong = song
            }
        }
    }
}
