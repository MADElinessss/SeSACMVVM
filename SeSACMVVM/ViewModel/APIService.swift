//
//  APIService.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Alamofire
import Foundation

// 여러 뷰 모델에서 api호출하지 않고 여기다가 싱글톤으로
class APIService {
    
    static let shared = APIService()
    
    private init() { }
    
    // ex) request url이 많을 때: enum!
    // completionHandler 잘 다루기 - 실패 케이스에 대한 처리도 해주기!
    // 필요할때마다 호출하지 말고, call을 줄일 수 있는 방법도 생각해보기!
    // ex) naver shopping api - 검색했을 때, 버튼/엔터키 기준으로 호출할텐데, 
    // 이걸 짱많이 눌렀을 때에는 어떻게 처리할건지,,
    
    func fetchUpbitMarketAPI(completionHandler: @escaping ([Market]) -> Void) {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print("🚨")
            }
        }
    }
}
