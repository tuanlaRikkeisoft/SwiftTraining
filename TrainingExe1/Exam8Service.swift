//
//  Exam8Service.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import Alamofire

protocol Exam8ServiceDelegate {
    func getDataCompleted(data:[Songs],message: String)
}

final class Exam8Service {
    var delegate: Exam8ServiceDelegate?
    let getSongCompletedNotification = "getSongCompletedNotification"
    
    static let sharedInstance: Exam8Service = Exam8Service()
    private init(){
        print("Initilization...")
    }
    public func getListSongWithClosure(key: String, completion: @escaping (_ message: String,_ data: [Songs])-> Void) {
       
        let params = ["term":key,"media":"music"]
        
        Alamofire.request(URL.init(string: "https://itunes.apple.com/search")!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(response.result.error)")
                completion((response.result.error?.localizedDescription)!,Array())
                return
            }
            
            var listSongs = [Songs]()
            
            let responseItem = response.result.value as? [String: Any]
            let results = responseItem?["results"] as? [[String: Any]]

            for item in results!{
                let song = Songs()
                song.artistName = item["artistName"] as? String
                song.trackName = item["trackName"] as? String
                song.artworkUrl100 = item["artworkUrl100"] as? String
                listSongs.append(song)
            }
            DispatchQueue.main.async {
                completion(String(),listSongs)
            }
        }
    }
    
    public func getListSongWithDelegate(key: String){
        let params = ["term":key,"media":"music"]
        
        Alamofire.request(URL.init(string: "https://itunes.apple.com/search")!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(response.result.error)")
                self.delegate?.getDataCompleted(data: [], message: (response.result.error?.localizedDescription)!)
                return
            }
            
            var listSongs = [Songs]()
            
            let responseItem = response.result.value as? [String: Any]
            let results = responseItem?["results"] as? [[String: Any]]
            
            for item in results!{
                let song = Songs()
                song.artistName = item["artistName"] as? String
                song.trackName = item["trackName"] as? String
                song.artworkUrl100 = item["artworkUrl100"] as? String
                listSongs.append(song)
            }
            DispatchQueue.main.async {
                self.delegate?.getDataCompleted(data: listSongs, message: "")
            }
        }
    }
    
    public func getListSongWithNotification(key : String){
        let params = ["term":key,"media":"music"]
        
        Alamofire.request(URL.init(string: "https://itunes.apple.com/search")!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(response.result.error)")
                
                return
            }
            
            var listSongs = [Songs]()
            
            let responseItem = response.result.value as? [String: Any]
            let results = responseItem?["results"] as? [[String: Any]]
            
            for item in results!{
                let song = Songs()
                song.artistName = item["artistName"] as? String
                song.trackName = item["trackName"] as? String
                song.artworkUrl100 = item["artworkUrl100"] as? String
                listSongs.append(song)
            }
            let dictData: [String:Any] = ["listSongs":listSongs]
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: self.getSongCompletedNotification), object: nil, userInfo: dictData)
            }
            
        }
    }
}
