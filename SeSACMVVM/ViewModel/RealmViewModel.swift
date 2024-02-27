//
//  RealmViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Foundation
import RealmSwift

class RealmViewModel {
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    var outputList: Observable<[Diary]> = Observable([])
    
    let repository = DiaryRepository()
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            // fetch realm
            self.outputList.value = self.repository.fetchItem()
        }
    }
}
