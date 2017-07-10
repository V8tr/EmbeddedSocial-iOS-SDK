//
//  WelcomeWelcomeRouterInput.swift
//  MSGP-Framework
//
//  Created by igor.popov on 07/07/2017.
//  Copyright © 2017 akvelon. All rights reserved.
//

import Foundation

protocol WelcomeRouterInput {
    
    func openSignIn(with : SignInType)
    func openCreateAccount();
    
}
