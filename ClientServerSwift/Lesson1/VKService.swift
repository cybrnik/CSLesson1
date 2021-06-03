//
//  VkService.swift
//  ClientServerSwift
//
//  Created by Nikita on 31.05.2021.
//

import Foundation

final class VkService {
    func VKgetFriends(){

        let configuration = URLSessionConfiguration.default

        let session =  URLSession(configuration: configuration)
        
        let url = URL(string: "https://api.vk.com/method/friends.get?access_token="+Session.shared.token+"&v=5.103")
        

        let task = session.dataTask(with: url!) { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)

            print(json ?? "ERROR")
        }

        task.resume()
        
    }
    func VKgetPhotos(){

        let configuration = URLSessionConfiguration.default

        let session =  URLSession(configuration: configuration)
        
        let url = URL(string: "https://api.vk.com/method/photos.getAll?access_token="+Session.shared.token+"&v=5.103")
        

        let task = session.dataTask(with: url!) { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)

            print(json ?? "ERROR")
        }

        task.resume()
        
    }
    func VKgetGroups(){

        let configuration = URLSessionConfiguration.default

        let session =  URLSession(configuration: configuration)
        
        let url = URL(string: "https://api.vk.com/method/groups.get?access_token="+Session.shared.token+"&v=5.103")
        

        let task = session.dataTask(with: url!) { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)

            print(json ?? "ERROR")
        }

        task.resume()
        
    }
    func VKgetGroupsSearch(text: String){

        let configuration = URLSessionConfiguration.default

        let session =  URLSession(configuration: configuration)
        
        let url = URL(string: "https://api.vk.com/method/groups.search?access_token="+Session.shared.token+"&q="+text+"&v=5.103")
        

        let task = session.dataTask(with: url!) { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)

            print(json ?? "ERROR")
        }

        task.resume()
        
    }
    
}
