//
//  UserViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

class UserViewModel {
    
    var list = [User(name: "Madeline", age: 27),
                User(name: "Moana", age: 26),
                User(name: "Musk", age: 24),
                User(name: "A", age: 29),
                User(name: "B", age: 30)]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    // indexPath.row 매개변수
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
