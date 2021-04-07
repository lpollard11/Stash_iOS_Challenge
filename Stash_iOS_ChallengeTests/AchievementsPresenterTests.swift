//
//  AchievementsPresenterTests.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

import XCTest
@testable import Stash_iOS_Challenge

class AchievementsPresenterTests: XCTestCase {
    private var sut: AchievementsPresenter!
    private var interactor: AchievementsInputInteractorTypeMock!
    private var view: AchievementsViewTypeMock!
    
    override func setUp() {
        super.setUp()
        interactor = AchievementsInputInteractorTypeMock()
        view = AchievementsViewTypeMock()
        sut = AchievementsPresenter(interactor: interactor)
        sut.view = view
    }
    
    func test_fetchFailed() {
        sut.fetchFailed()
        
        XCTAssertTrue(view.didShowErrorFire)
    }
    
    func test_fetchSuccessful() {
        sut.fetchSuccessful()
        
        XCTAssertTrue(view.didReloadTableFire)
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(interactor.didFireFetchAchievements)
    }
     
    func test_achievement_for_indexPath() {
        interactor.achievements = [achievement]
        
        let achievement = sut.achievement(for: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(achievement, self.achievement)
    }
    
    func test_errorMessage() {
        interactor.error = ResponseError.invalidData
        
        let errorMessage = sut.errorMessage
        
        XCTAssertEqual(errorMessage, "The operation couldn’t be completed. (Stash_iOS_Challenge.ResponseError error 0.)")
    }
    
    func test_achievementCount() {
        interactor.achievements = [achievement, achievement]
        
        let achievementCount = sut.achievementsCount
        
        XCTAssertEqual(achievementCount, 2)
    }
}

extension AchievementsPresenterTests {
    private var achievement: Achievement {
        return Achievement(id: 4,
                           level: "1",
                           progress: 10,
                           total: 50,
                           imageURL: URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png")!,
                           accessible: true)
    }
}
