//
//  DiaryRepository.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Foundation
import RealmSwift

class DiaryRepository {
    
    private let realm = try! Realm()
    
    // 통으로 가져오기
    func fetchItem() -> [Diary] {
        let result = realm.objects(Diary.self)
        return Array(result)
    }
    
    func create(market: String, name: String, price: Int) {
        
        let diary = Diary(market: market, name: name, price: price)
        do {
            try realm.write {
                realm.add(diary)
                print("🐶")
            }
        } catch {
            print(error)
        }
    }
}
