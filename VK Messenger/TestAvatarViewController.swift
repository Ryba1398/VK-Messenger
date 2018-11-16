//
//  TestAvatarViewController.swift
//  VK Messenger
//
//  Created by Nikolay on 15/11/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import UIKit

class TestAvatarViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var leftStackView: UIStackView!
    
    @IBOutlet weak var rightStackView: UIStackView!
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var third: UIImageView!
    @IBOutlet weak var fourth: UIImageView!

    @IBOutlet weak var avatarView: UIView!
    
    let one = [UIImage(named: "dog")]
    
    let two = [UIImage(named: "dog"), UIImage(named: "rock")]
    
    let three = [UIImage(named: "dog"), UIImage(named: "rock"), UIImage(named: "grass")]
    
    let four = [UIImage(named: "dog"), UIImage(named: "rock"), UIImage(named: "grass"), UIImage(named: "pink")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarView.layer.cornerRadius = avatarView.frame.size.width/2
        avatarView.layer.masksToBounds = true
    
        
        setAvatar(array: four as! [UIImage])
        
    }
    
    func setAvatar (array: [UIImage]){
        
        let arrayLength = array.count
        
        switch arrayLength {
        case 1:
            
            let image = UIImageView(frame: CGRect(origin: mainStackView.frame.origin, size: mainStackView.layer.frame.size))
                
            
            image.image = array[0]
            self.avatarView.addSubview(image)
            
            first.removeFromSuperview()
            
            second.removeFromSuperview()
            third.removeFromSuperview()
            fourth.removeFromSuperview()
        case 2:
            first.image = array[0]
            first.contentMode = .scaleAspectFill
            first.clipsToBounds = true
            
            second.image = array[0]
            second.contentMode = .scaleAspectFill
            second.clipsToBounds = true
            
            third.removeFromSuperview()
            fourth.removeFromSuperview()
        case 3:
            first.image = array[0]
            first.contentMode = .scaleAspectFill
            first.clipsToBounds = true
            
            second.image = array[1]
            third.removeFromSuperview()
            fourth.image = array[2]
            
        case 4:
            first.image = array[0]
            second.image = array[1]
            third.image = array[2]
            fourth.image = array[3]
        default:
            print("That's error")

        }
    }
}
