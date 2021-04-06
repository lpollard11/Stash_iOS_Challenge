//
//  AchievementsProtocols.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

protocol AchievementsInputInteractorType {
    var presenter: AchievementsOutputInteractorType? { get set }
    func fetchAchievements()
    var achievements: [Achievement] { get }
    var error: Error? { get }
}

protocol AchievementsOutputInteractorType: class {
    func fetchFailed()
    func fetchSuccessful()
}

protocol AchievementsPresenterType {
    var view: AchievementsViewType? { get set }
    func viewDidLoad()
    var achievementsCount: Int { get }
    var errorMessage: String? { get }
    func achievementCellViewModel(for indexPath: IndexPath)
}

protocol AchievementsViewType: class {
    func reloadTable()
    func showError()
}


