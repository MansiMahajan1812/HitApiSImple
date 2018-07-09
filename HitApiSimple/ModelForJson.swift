//
//  ModelForJson.swift
//  HitApiSimple
//
//  Created by Mansi Mahajan on 6/25/18.
//  Copyright © 2018 Mansi Mahajan. All rights reserved.
//

import Foundation

class ModelForJson: NSObject {
    var name: String?
    var final_disc: String?
    var rating: Float?
    var in_stock: Int?
    var price: Int?
    var product_id: Int?
    var inWishlist: String?
    var created: String?
    var image: String?
    var type_id: String?
    var final_price: Int?
    var minimal_price: String?
    var price_html: String?
    var is_new_prod: Int?
    
   

    init(created: String, name: String, rating: Float) {
        self.created = created
        self.name = name
        self.rating = rating
        print(self.created)
        
    }
}
