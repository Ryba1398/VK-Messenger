//
//  vkUser.swift
//  VK Messenger
//
//  Created by Nikolay on 07/11/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import Foundation
import UIKit

class vkUser {
    
    var avatarInterlocutor : UIImage!
    var lastMessageAuthorAvatar : UIImage!
    
    var name : String!
    var lastMessageTime : String!
    var lastMessage : String!
    
    init(avatarInterlocutor : UIImage?, lastMessageAuthorAvatar : UIImage?, name : String?, lastMessageTime : String?, lastMessage : String?) {
        
        self.avatarInterlocutor = avatarInterlocutor
        self.lastMessageAuthorAvatar = lastMessageAuthorAvatar
        
        self.name = name
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
    }
}
