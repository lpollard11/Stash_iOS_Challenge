//
//  AchievementsPresenter.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

final class AchievementsPresenter: AchievementsPresenterType {
    weak var view: AchievementsViewType?
    private let interactor: AchievementsInputInteractorType
    
    init(interactor: AchievementsInputInteractorType) {
        self.interactor = interactor
    }
    
    var achievementsCount: Int {
        return interactor.achievements.count
    }
    
    var errorMessage: String? {
        return interactor.error?.localizedDescription
    }
    
    func achievementCellViewModel(for indexPath: IndexPath) {
        
    }
    
    func viewDidLoad() {
        interactor.fetchAchievements()
    }   
}

extension AchievementsPresenter: AchievementsOutputInteractorType {
    func fetchFailed() {
        view?.showError()
    }
    
    func fetchSuccessful() {
        view?.reloadTable()
    }
}
