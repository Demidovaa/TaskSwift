//
//  LocalAuth.swift
//  FaceID
//
//  Created by Анастасия Демидова on 22.05.2020.
//  Copyright © 2020 AnastasiaDemidova. All rights reserved.
//

import UIKit
import LocalAuthentication

public protocol LocalAuthDelegate {
    func pass()
    func fail()
}

open class LocalAuth: NSObject {
    
    open var delegate:LocalAuthDelegate!
    
    open func checkAuthentication() {
        let context = LAContext()
        var error: NSError?
        var description: String?
        
        // MARK: -Touch ID/Face ID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            switch context.biometryType {
            case .faceID:
                description = "Permission for access face id"
                break
            case .touchID:
                description = "Permission for access toch id"
                break
            case .none:
                description = "Your device not support face/touch id"
                break
            }
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: description ?? "",
                                   reply: {success, evaluateError in
                if (success) {
                    DispatchQueue.main.async {
                        self.delegate.pass()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.delegate.fail()
                    }
                }
            })
        } 
    }
}
