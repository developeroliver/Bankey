//
//  LocalState.swift
//  Bankey
//
//  Created by olivier geiger on 18/03/2024.
//

import UIKit

public class LocaleState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
