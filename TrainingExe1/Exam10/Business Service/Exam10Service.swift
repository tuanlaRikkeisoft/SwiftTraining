//
//  Exam10Service.swift
//  TrainingExe1
//
//  Created by Nguyen Minh Tien on 3/24/17.
//  Copyright © 2017 Nguyen Minh Tien. All rights reserved.
//

import UIKit
import Alamofire

final class Exam10Service: NSObject {
    
    static let sharedInstance: Exam10Service = Exam10Service()
    override private init(){
        print("Initilization...")
    }
    
    //movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all
    
    public func getListDataWithClosure(key: String,type: String, completion: @escaping (_ message: String,_ data: [MediaModel])-> Void) {
        
        let params = ["term":key,"media":type]
        
        Alamofire.request(URL.init(string: "https://itunes.apple.com/search")!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(response.result.error)")
                completion((response.result.error?.localizedDescription)!,Array())
                return
            }
            
            var listMedias = [MediaModel]()
            
            let responseItem = response.result.value as? [String: Any]
            let results = responseItem?["results"] as? [[String: Any]]
            
            for item in results!{
                let media = MediaModel()
                media.artistName = item["artistName"] as? String
                media.trackName = item["trackName"] as? String
                media.thumbImage = item["artworkUrl100"] as? String
                listMedias.append(media)
            }
            DispatchQueue.main.async {
                completion(String(),listMedias)
            }
        }
    }

    
}
