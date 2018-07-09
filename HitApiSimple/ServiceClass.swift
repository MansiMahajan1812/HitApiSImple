//
//  ServiceClass.swift
//  HitApiSimple
//
//  Created by Mansi Mahajan on 6/25/18.
//  Copyright © 2018 Mansi Mahajan. All rights reserved.
//

import Foundation

class ServiceClass : NSObject{
    
    
    
    func ApiHitFunction(url: String, withCompletionHandler: @escaping (_ jsonResult: [ModelForJson]) -> Void){
        
        
        guard let url1 = URL(string: url) else{
            print("Error in url")
            return
        }
        
        var request = URLRequest(url: url1)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task1 = session.dataTask(with: request) { (data, response , error) in
            do{
                guard error == nil else{
                    print("Error ")
                    return
                }
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                guard let jsonResultUnwrapped = jsonResult else{
                    return
                }
                if let response = jsonResultUnwrapped["response"] as? [String:Any],let products = response["product"] as? [[String:Any]]   {
                    var modelArray = [ModelForJson]()
                    for i in 0..<products.count {
                        
                        if let dict = products[i] as? [String:Any] {
                            print(dict["created"]!)
                        
                            let model = ModelForJson(created: dict["created"] as! String, name: dict["name"] as! String, rating: Float(dict["rating"] as! String)!)
                            modelArray.append(model)
    
//                        do {
//                            let data1 = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//                            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .)
//                            let jsonDecoder = JSONDecoder()
//                            let model = try jsonDecoder.decode(ModelForJson.self, from: jsonData!)
//                            print(model.inWishlist)
//                        }
//                        catch {
//                            print(error.localizedDescription)
//                        }
                          }
                      }
                   withCompletionHandler(modelArray)
                }
            }catch{
                print("Error")
            }
        }
        task1.resume()
    }
}
