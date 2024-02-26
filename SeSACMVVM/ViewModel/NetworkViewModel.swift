//
//  NetworkViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/26/24.
//

import Alamofire
import Foundation

class NetworkViewModel {
    
    // 뷰 did load 시점을 알려주는 변수!
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    // list
    var ourpurMarketData: Observable<[Market]> = Observable([])
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
    }
    
    func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                self.ourpurMarketData.value = success
            case .failure(let failure):
                print("🚨")
            }
        }
    }
    
    
    
    
    
    
}
