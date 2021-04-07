//
//  AchievementCell.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/7/21.
//

import Foundation

import UIKit

final class AchievementCell: UITableViewCell {
    private enum Constants {
        static let standardSpacing: CGFloat = 16
        static let tightSpacing: CGFloat = 12
        static let tighterSpacing: CGFloat = 8
        static let containerHeight: CGFloat = 200
        static let progressBarHeight: CGFloat = 8
        static let levelHeight: CGFloat = 100
    }
    
    private let containerView = UIView()
    private let progressLabel = UILabel()
    private let totalLabel = UILabel()
    private let achievementImageView = UIImageView()
    private let progressBarView = ProgressBarView()
    private let levelView = LevelView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageURL: URL, progress: Int, total: Int, level: String) {
        achievementImageView.load(with: imageURL)
        progressLabel.text = "\(String(progress))pts"
        totalLabel.text = "\(String(total))pts"
        progressBarView.configure(with: progress,
                                  total: total,
                                  insets: (Constants.standardSpacing * 2) + (Constants.tighterSpacing),
                                  containerWidth: bounds.width)
        levelView.configure(with: level)
    }
    
    private func setupUI() {
        selectionStyle = .none

        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
        
        contentView.addSubview(containerView)
        containerView.addConstraints {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.standardSpacing),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardSpacing),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.standardSpacing),
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.standardSpacing),
            $0.heightAnchor.constraint(equalToConstant: Constants.containerHeight)
        ]}
        
        containerView.addSubview(achievementImageView)
        achievementImageView.addConstraints {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ]}
        
        progressLabel.textColor = .white
        progressLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        containerView.addSubview(progressLabel)
        progressLabel.addConstraints {[
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.tighterSpacing),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.standardSpacing),
        ]}
        
        totalLabel.textColor = .white
        totalLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        containerView.addSubview(totalLabel)
        totalLabel.addConstraints {[
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.tighterSpacing),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.standardSpacing),
        ]}
        
        progressBarView.layer.cornerRadius = 4
        progressBarView.clipsToBounds = true
        
        containerView.addSubview(progressBarView)
        progressBarView.addConstraints {[
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.tighterSpacing),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.tighterSpacing),
            $0.bottomAnchor.constraint(equalTo: progressLabel.topAnchor, constant: -Constants.tightSpacing),
            $0.heightAnchor.constraint(equalToConstant: Constants.progressBarHeight)
        ]}
        
        levelView.layer.cornerRadius = Constants.levelHeight / 2
        levelView.clipsToBounds = true
        
        containerView.addSubview(levelView)
        levelView.addConstraints {[
            $0.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            $0.bottomAnchor.constraint(equalTo: progressBarView.topAnchor, constant: -Constants.standardSpacing),
            $0.heightAnchor.constraint(equalToConstant: Constants.levelHeight),
            $0.widthAnchor.constraint(equalToConstant: Constants.levelHeight)
        ]}
    }
}
