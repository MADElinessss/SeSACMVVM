//
//  RealmDetailViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Foundation
import RealmSwift

class RealmDetailViewModel {
    
    var outputData: Observable<[Diary]> = Observable([])
    
    init() {
        outputData.bind { data in
            print(data)
        }
    }
}
