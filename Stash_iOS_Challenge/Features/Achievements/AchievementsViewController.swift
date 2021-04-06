//
//  AchievementsViewController.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import UIKit

final class AchievementsViewController: UIViewController {
    private let presenter: AchievementsPresenterType
    
    init(presenter: AchievementsPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension AchievementsViewController: AchievementsViewType {
    func reloadTable() {
    }
    
    func showError() {
        
    }
}
 
