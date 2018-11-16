//
//  MessagesTableViewController.swift
//  VK Messenger
//
//  Created by Nikolay on 30/10/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController, UISearchBarDelegate {
    
    let messenger = Messenger()
    
    var users : [vkUser] = [
        vkUser(avatarInterlocutor: UIImage(named: "dog"), lastMessageAuthorAvatar: UIImage(named: "dog"), name: "erofenrferofnoeirnfoeifoerfonerfneonrfoenr", lastMessageTime: "Yesterday", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: UIImage(named: "dog"), lastMessageAuthorAvatar: UIImage(named: "dog"), name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: UIImage(named: "dog"), lastMessageAuthorAvatar: UIImage(named: "dog"), name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: UIImage(named: "dog"), lastMessageAuthorAvatar: UIImage(named: "dog"), name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Пока"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "хомяк", lastMessageTime: "11:35", lastMessage: "good bye"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "good bye"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "улитка", lastMessageTime: "11:35", lastMessage: "пока"),
                vkUser(avatarInterlocutor: nil, lastMessageAuthorAvatar: nil, name: "Джон Конор", lastMessageTime: "11:35", lastMessage: "Привет")
    ]
    
    var filteredUsers = [vkUser]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToLoginViewController", sender: self)
    }
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredUsers = users.filter({( user : vkUser) -> Bool in
            return user.lastMessage.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = messenger.lightActiveLoginButtonColor
        tableView.reloadData()
        tableView.rowHeight =  100

        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return users.count
//    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredUsers.count
        }
        
        return users.count
    }

    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let candy: Candy
//        if isFiltering() {
//            candy = filteredCandies[indexPath.row]
//        } else {
//            candy = candies[indexPath.row]
//        }
//        cell.textLabel!.text = candy.name
//        cell.detailTextLabel!.text = candy.category
//        return cell
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "User Cell", for: indexPath) as! MessageTableViewCell
        
        let user : vkUser
        
        if  isFiltering(){
            user = filteredUsers[indexPath.row]
        }else{
            user = users[indexPath.row]
        }
        
        cell.name.text = user.name
        
        cell.nameOne.text = user.name
        //cell.message.text = user.lastMessage
        
//        cell.interlocutorPhoto.image = user.avatarInterlocutor
//        cell.interlocutorPhoto.layer.cornerRadius = cell.interlocutorPhoto.frame.size.width/2
//        cell.interlocutorPhoto.clipsToBounds = true
//
//        cell.lastMessageAuthorPhoto.image = user.lastMessageAuthorAvatar
//        cell.lastMessageAuthorPhoto.layer.cornerRadius = cell.lastMessageAuthorPhoto.frame.size.width/2
//        cell.lastMessageAuthorPhoto.clipsToBounds = true
        
        cell.time.text = user.lastMessageTime
        cell.timeOne.text = user.lastMessageTime

        return cell
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
