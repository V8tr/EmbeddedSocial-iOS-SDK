//
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
//

import UIKit

final class FollowingConfigurator {
    let viewController: FollowingViewController
    
    init() {
        viewController = StoryboardScene.Following.instantiateFollowingViewController()
        viewController.title = L10n.Following.screenTitle
    }
    
    func configure(api: UsersListAPI,
                   navigationController: UINavigationController?,
                   moduleOutput: FollowingModuleOutput? = nil) {
        
        let presenter = FollowingPresenter()
        presenter.view = viewController
        presenter.usersList = makeUserListModule(api: api, navigationController: navigationController, output: presenter)
        presenter.moduleOutput = moduleOutput

        viewController.output = presenter
    }
    
    private func makeUserListModule(api: UsersListAPI,
                                    navigationController: UINavigationController?,
                                    output: UserListModuleOutput?) -> UserListModuleInput {
        
        let settings = UserListConfigurator.Settings(api: api,
                                                     navigationController: navigationController,
                                                     output: output)
        
        return UserListConfigurator().configure(with: settings)
    }
}
