//
//  ViewController.swift
//  workingWithUIScrollView
//
//  Created by Alex Comunian on 01/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Here we don't have the dimension of the scrollView -> this is why we'll use the viewDidAppear method
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        // Set the width of the scrollView
        let scrollWidth = scrollView.frame.size.width
        
        // For each image create an ImageView
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            
            // Set the position of the image
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            contentWidth += newX
            // Add the image to the scrollView
            scrollView.addSubview(imageView)
            // Set the frame of the imageView
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height/2) - 75, width: 150, height: 150)
        }
        // Show images outside from scrollview
        scrollView.clipsToBounds = false
        // Set content size of the scrollview
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)

    }

}

