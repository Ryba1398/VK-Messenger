//
//  VkSdkClass.swift
//  VK Messenger
//
//  Created by Nikolay on 01/11/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import Foundation
import VK_ios_sdk

class VkSdkClass {
    
    let SCOPE = [VK_PER_FRIENDS, VK_PER_WALL, VK_PER_AUDIO, VK_PER_PHOTOS, VK_PER_NOHTTPS, VK_PER_EMAIL, VK_PER_MESSAGES];
    
    func authorize(){
        VKSdk.authorize(SCOPE)
    }
    
    func checkAuthorization() -> Bool {
    
        var flag = false
        
        VKSdk.wakeUpSession(SCOPE, complete: { state, error in
            if state == VKAuthorizationState.authorized {
                flag = true
            } else if error != nil {
                flag = false
            }
        })
        return flag
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if ((result?.token) != nil) {
            print("All is good with token")
            //print(result.token.accessToken!)
            //getData(access_token: result.token.accessToken!)
        } else if ((result?.error) != nil) {
            print("problem with token")
        }
    }
    
    func initialize(){
        VKSdk.initialize(withAppId: "6738119").register(self as? VKSdkDelegate)
        VKSdk.instance().uiDelegate = self as? VKSdkUIDelegate
    }
    
    struct vkontakteUser : Decodable {
        let response : [Response]
    }
    
    struct Response : Decodable{
        let id : Int
        let first_name : String
        let last_name : String
    }

    
    func getData(access_token: String){
        
        let responseString = "https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=\(access_token)&v=5.87"
        
        let url = URL(string: responseString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil, data != nil else{
                print("ERROR")
                print(error!.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()
            guard let mydata = try? decoder.decode(vkontakteUser.self, from: data!) else {
                print("Some Error")
                return
            }
        }
        task.resume()
    }
    
    func getUser() {
        let request: VKRequest? = VKApi.users().get()
        request?.execute(resultBlock: { response in
            if let aResponse = response {
                let userData = (aResponse.parsedModel as! VKUsersArray).firstObject() as VKUser
                
                print("\(userData.first_name!) \(userData.last_name!), \(userData.id)")
                
            }
        }, errorBlock: { error in
            if let anError = error {
                print("Error: \(anError)")
            }
        })
    }
    
    func openVkApp() {
        let Username =  "vk6738119"
        let appURL = URL(string: "vk://\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        }
    }
    
}
