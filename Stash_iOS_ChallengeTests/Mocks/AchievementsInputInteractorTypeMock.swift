//
//  AchievementsInputInteractorTypeMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

@testable import Stash_iOS_Challenge

class AchievementsInputInteractorTypeMock: AchievementsInputInteractorType {
    var didFireFetchAchievements = false
    
    var presenter: AchievementsOutputInteractorType? = nil
    
    func fetchAchievements() {
        didFireFetchAchievements = true
    }
    
    var achievements: [Achievement] = []
    
    var error: Error? = nil
}
