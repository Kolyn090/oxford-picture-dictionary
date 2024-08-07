//
//  UserDefaultsUtils.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/6/24.
// https://www.codementor.io/@mehobega/swiftui-app-theme-switch-1q1p21rsij

import Foundation

class UserDefaultsUtils {
    static var shared = UserDefaultsUtils()
    
    func setDarkMode(enable: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(enable, forKey: Constants.DARK_MODE)
    }
    func getDarkMode() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: Constants.DARK_MODE)
    }
}
