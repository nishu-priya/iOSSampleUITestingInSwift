//
//  ValidateHelper.swift
//  UITestingSampleApp
//
//  Created by Nishu Priya on 16/12/16.
//  Copyright © 2016 Nishu Priya. All rights reserved.
//

import Foundation

class ValidateHelper {
    
    static let username = "username"
    static let password = "password"


    static func validateEmptyTextField(text: String) -> Bool{
        return text.isEmpty
    }

    static func validateUsernameAndPasswordMatch(user: String, pass: String) -> Bool{
        if username == user && password == pass{
            return true
        }
        return false
    }
}
