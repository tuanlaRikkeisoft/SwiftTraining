//
//  Exam8Service.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/22/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import Alamofire

class Exam8Service: NSObject {
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
                song.artistName = item["artistName"] as! String
                song.collectionName = item["collectionName"] as! String
                song.trackName = item["trackName"] as! String
                song.artworkUrl100 = item["artworkUrl100"] as! String
                //song.trackPrice = item["trackPrice"] as! Float
                //song.trackTimeMillis = item["trackTimeMillis"] as! Float
                song.primaryGenreName = item["primaryGenreName"] as! String
                listSongs.append(song)
            }
           
            completion(String(),listSongs)
        }
    }
}
