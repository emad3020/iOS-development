//
//  singlePlace.swift
//  JSON Parser Example
//
//  Created by Emad on 10/15/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation
import Alamofire

class singlePlace{
    
    
    func getPlaceData(complete: DownloadComplete){
        let singlePlaceUrl = URL(string: Single_Place)!
        Alamofire.request(singlePlaceUrl,method: .get).responseJSON {
            response in
            let result = response
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let status = dict["status"] as? String{
                    print(status)
                }
            }
            
        }
        complete()
    }
}
