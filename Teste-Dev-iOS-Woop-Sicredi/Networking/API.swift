//
//  API.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

enum API {
    
    static var currentScheme: API = .development
    
     /// For staging and production builds, the API URL
     /// must me defined here
    case development
    
    var url: String {
        
        switch self {
            case .development: return "http://5b840ba5db24a100142dcd8c.mockapi.io/api"
        }
    }
}
