//
//  WelcomeWelcomeViewOutput.swift
//  MSGP-Framework
//
//  Created by igor.popov on 07/07/2017.
//  Copyright © 2017 akvelon. All rights reserved.
//

protocol WelcomeViewOutput: class {

    /**
        @author igor.popov
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    
    func signWithTwitter()
    func signWithGoogle()
    func signWithEmail()
    func createAccount()
    
}
