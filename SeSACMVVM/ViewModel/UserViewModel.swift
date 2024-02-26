//
//  UserViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

class UserViewModel {

    var list: Observable<[User]> = Observable([])
    
    // 검색 버튼 클릭 시 검색 키워드
    var inputSearchWord: Observable<String?> = Observable("")
    
    // 추가 버튼 클릭시 추가할 텍스트 받아오는 변수
    var inputAddText: Observable<String?> = Observable("")
    
    // 로드 버튼 탭했따!
    var inputLoadButtonTapped: Observable<Void?> = Observable(nil)
    
    // 삭제 버튼 탭해따!
    var inputDeleteButtonTapped: Observable<Void?> = Observable(nil)
    
    // 애초에 뷰모델에서 리스트에 데이터 넣기
    init() {
        fetchUser()
        
        inputLoadButtonTapped.bind { _ in
            self.fetchUser()
        }
        
        inputDeleteButtonTapped.bind { _ in
            self.list.value.removeAll()
        }
        
        inputAddText.bind { value in
            self.appendUser(name: value)
        }
        
        inputSearchWord.bind { value in
            guard let value = value else { return }
            let result = self.list.value.filter { $0.name.contains(value) }
            self.list.value = result
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.count
    }
    
    // indexPath.row 매개변수
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list.value[indexPath.row]
    }
    
    private func fetchUser() {
        list.value = [User(name: "Madeline", age: 27),
                      User(name: "Moana", age: 26),
                      User(name: "Musk", age: 24),
                      User(name: "A", age: 29),
                      User(name: "B", age: 30)]
    }
    
    func appendUser(name: String?) {
        // 옵셔널 바인딩
        guard let name = name else { return }
        
        let value = list.value.filter { $0.name == name }
        if value.count == 0 {
            let age = Int.random(in: 20...40)
            let user = User(name: name, age: age)
            list.value.append(user)
        } else { return }
        
        // 중복 여부 확인 -> 비즈니스 로직
//        for item in list {
//            if item.name == name {
//               return // 중복이니까 무시해
//            } else {
//                let age = Int.random(in: 20...40)
//                let user = User(name: name, age: age)
//                list.append(user)
//            }
//        }
    }
}
