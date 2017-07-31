//
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
//

class CreatePostPresenter: CreatePostModuleInput, CreatePostViewOutput, CreatePostInteractorOutput {
    
    weak var view: CreatePostViewInput!
    var interactor: CreatePostInteractorInput!
    var router: CreatePostRouterInput!
    
    var user: User?

    // MARK: CreatePostViewOutput
    func viewIsReady() {
        view.setupInitialState()
        view.show(user: user!)
    }
    
    func post(photo: Photo?, title: String?, body: String!) {
        interactor.postTopic(photo: photo, title: title, body: body)
    }
    
    func back() {
        guard let vc = view as? UIViewController else {
            return
        }
        
        router.back(from: vc)
    }
    
    // MARK: CreatePostInteractorOutput
    func created() {
        // TODO: handle
        view.topicCreated()
        back()
    }
    
    func postCreationFailed(error: Error) {
        view.show(error: error)
    }
}