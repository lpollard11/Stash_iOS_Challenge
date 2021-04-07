//
//  AchievementsViewController.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import UIKit

final class AchievementsViewController: UIViewController {
    private let tableView = UITableView()
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
        setupView()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        navigationItem.title = "Smart Investing"
        view.backgroundColor = .white
    }
    
    private func setupTableView() {
        tableView.register(cell: AchievementCell.self)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.addConstraints {[
            $0.topAnchor.constraint(equalTo: view.topAnchor),
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]}
    }
}

extension AchievementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.achievementsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AchievementCell.identifier, for: indexPath) as! AchievementCell
        let achievement = presenter.achievement(for: indexPath)
        cell.configure(with: achievement.imageURL)
        return cell
    }
}

extension AchievementsViewController: AchievementsViewType {
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        
    }
}
 
