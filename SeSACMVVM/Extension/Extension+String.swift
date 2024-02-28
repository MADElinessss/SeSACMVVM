//
//  Extension+String.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/28/24.
//

import Foundation

extension String {
    
    func localized() -> String {
        
        return NSLocalizedString(self, comment: "")
        
    }
    
    
    var local: String {
        
        return NSLocalizedString(self, comment: "")
        
    }
    
    
}
