//
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
//

import Foundation

protocol EditProfileModuleInput: class {
    func setIsLoading(_ isLoading: Bool)
    
    func getFinalUser() -> User
    
    func getModuleView() -> UIView
    
    func setupInitialState()
}
