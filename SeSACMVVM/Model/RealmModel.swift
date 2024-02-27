//
//  RealmModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Foundation
import RealmSwift

class Diary: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var market: String
    @Persisted var name: String
    @Persisted var price: Int
    
    convenience init(market: String, name: String, price: Int) {
        self.init()
        self.market = market
        self.name = name
        self.price = price
    }
}
