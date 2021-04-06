//
//  AchievementsRouter.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import UIKit

final class AchievementsRouter {
    private let modelProviding: ModelProviding
    private let httpProviding: HTTPProviding
    
    init() {
        modelProviding = ModelProvider()
        httpProviding = HTTPProvider()
    }
    
    func buildAchievementsController() -> UIViewController {
        let networkRequester: NetworkRequesting = NetworkRequester(modelProviding: modelProviding, httpProviding: httpProviding)
        let service: AchievementsService = AchievementsServiceAPI(networkRequester: networkRequester)
        var interactor: AchievementsInputInteractorType = AchievementsInteractor(service: service)
        var presenter: AchievementsOutputInteractorType & AchievementsPresenterType = AchievementsPresenter(interactor: interactor)
        interactor.presenter = presenter
        let view = AchievementsViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
