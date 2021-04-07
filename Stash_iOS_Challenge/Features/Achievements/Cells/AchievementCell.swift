//
//  AchievementCell.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/7/21.
//

import Foundation

import UIKit

final class AchievementCell: UITableViewCell {
    private let containerView = UIView()
    private let progressLabel = UILabel()
    private let totalLabel = UILabel()
    private let achievementImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageURL: URL) {
        achievementImageView.load(with: imageURL)
    }
    
    private func setupUI() {
        selectionStyle = .none

        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
        
        contentView.addSubview(containerView)
        containerView.addConstraints {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            $0.heightAnchor.constraint(equalToConstant: 200)
        ]}
        
        containerView.addSubview(achievementImageView)
        achievementImageView.addConstraints {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ]}
    }
}
