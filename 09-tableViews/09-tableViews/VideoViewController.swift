//
//  VideoViewController.swift
//  09-tableViews
//
//  Created by Alex Comunian on 13/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock{
        get{
            return _partyRock
        } set{
            _partyRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }


}
