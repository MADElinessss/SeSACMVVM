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
    var outputMarketData: Observable<[Market]> = Observable([])
    
    var outputLabel = Observable("")
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
    }
    
    func callRequest() {
        
        APIService.shared.fetchUpbitMarketAPI { market in
            self.outputMarketData.value = market
            self.outputLabel.value = market[0].korean_name
        }
        
    }
}
