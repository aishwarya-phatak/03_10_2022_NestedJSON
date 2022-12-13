//
//  Product.swift
//  JSONNestedLevel2
//
//  Created by Vishal Jagtap on 12/12/22.
//

import Foundation

struct Product : Decodable{
    var id : Int
    var title : String
    var description: String
    var price : Double
    var category : String
    var rate : Double
    var count : Int
    
    enum CodingKeys : CodingKey{
        case id
        case title
        case description
        case price
        case category
        case rating
    }
        
    enum RatingKeys : CodingKey{
        case rate
        case count
    }
    
    init(from decoder: Decoder) throws {
        let prContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try prContainer.decode(Int.self, forKey: .id)
        self.title = try prContainer.decode(String.self, forKey: .title)
        self.description = try prContainer.decode(String.self, forKey: .description)
        self.price = try prContainer.decode(Double.self, forKey: .price)
        self.category = try prContainer.decode(String.self, forKey: .category)
        
        let ratingContainer = try prContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        
        self.rate = try ratingContainer.decode(Double.self, forKey: .rate)
        self.count = try ratingContainer.decode(Int.self, forKey: .count)
        
    }
}
