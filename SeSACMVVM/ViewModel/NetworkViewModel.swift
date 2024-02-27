//
//  NetworkViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/26/24.
//

import Alamofire
import Foundation

class NetworkViewModel {
    
    let repository = DiaryRepository()
    
    // tableView didSelect 시점 알려주는 변수
    var inputCellDidSelectTrigger: Observable<Market?> = Observable(nil)
    
    // 뷰 did load 시점을 알려주는 변수!
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    // list
    var outputMarketData: Observable<[Market]> = Observable([])

    var outputLabel = Observable("")
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
        
        inputCellDidSelectTrigger.bind { market in
            guard let market = market else { return }
            self.createItem(market: market.market, name: market.korean_name, price: Int.random(in: 100...100000))
        }
    }
    
    private func createItem(market: String, name: String, price: Int) {
        repository.create(market: market, name: name, price: price)
    }
    
    func callRequest() {
        
        APIService.shared.fetchUpbitMarketAPI { market in
            self.outputMarketData.value = market
            self.outputLabel.value = market[0].korean_name
        }
        
    }
}
