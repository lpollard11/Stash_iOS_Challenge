//
//  AchievementsInteractor.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

final class AchievementsInteractor: AchievementsInputInteractorType {
    weak var presenter: AchievementsOutputInteractorType?
    
    var achievements: [Achievement] = []
    var error: Error?
    
    private let service: AchievementsService
    
    init(service: AchievementsService) {
        self.service = service
    }
    
    func fetchAchievements() {
        service.achievements { [weak self] result in
            switch result {
            case .success(let achievementList):
                self?.achievements = achievementList.achievements
                self?.presenter?.fetchSuccessful()
            case .failure(let error):
                self?.error = error
                self?.presenter?.fetchFailed()
            }
        }
    }
}
