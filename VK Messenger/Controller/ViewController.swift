//
//  ViewController.swift
//  VK Messenger
//
//  Created by Nikolay on 30/10/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(makeRightSwipe(sender:)))
        // the default direction is right
        
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func makeRightSwipe (sender: UIGestureRecognizer){
        if sender.state == .ended {
            view.backgroundColor = .red
        }
    }


}

