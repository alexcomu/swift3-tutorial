//
//  ViewController.swift
//  09-tableViews
//
//  Created by Alex Comunian on 13/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p1 = PartyRock(imageURL: "http://www.cfau-pd.net/image.php?pic=/images/random-wallpaper/random-wallpaper-6.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wZZ7oFKsKzY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Just a Frog")
        
        let p2 = PartyRock(imageURL: "http://www.cfau-pd.net/image.php?pic=/images/random-picture/random-picture-4.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wZZ7oFKsKzY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Ambin Boh Asd Org Pof")
        
        let p3 = PartyRock(imageURL: "http://vignette2.wikia.nocookie.net/potcoplayers/images/0/09/Random_shots_059.jpg/revision/latest?cb=20141130221009", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wZZ7oFKsKzY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Qua Qua Qua Prr")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCellTableViewCell{
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return partyRocks.count
    }

}

