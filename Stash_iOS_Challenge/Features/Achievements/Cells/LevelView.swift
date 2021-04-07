//
//  LevelView.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/7/21.
//

import UIKit

final class LevelView: UIView {
    private let labelsContainer = UIView()
    private let levelLabel = UILabel()
    private let levelNumberLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with level: String) {
        levelNumberLabel.text = level
    }
    
    private func setupView() {
        backgroundColor = .white
        alpha = 0.9
    }
    
    private func setupLabels() {
        addSubview(labelsContainer)
        labelsContainer.addConstraints {[
            $0.centerYAnchor.constraint(equalTo: centerYAnchor),
            $0.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]}
        
        levelLabel.text = "Level"
        levelLabel.textAlignment = .center
        levelLabel.textColor = .black
        levelLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        labelsContainer.addSubview(levelLabel)
        levelLabel.addConstraints {[
            $0.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            $0.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            $0.topAnchor.constraint(equalTo: labelsContainer.topAnchor),
        ]}
        
        levelNumberLabel.textColor = .black
        levelNumberLabel.textAlignment = .center
        levelNumberLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        labelsContainer.addSubview(levelNumberLabel)
        levelNumberLabel.addConstraints {[
            $0.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            $0.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            $0.topAnchor.constraint(equalTo: levelLabel.bottomAnchor),
            $0.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor)
        ]}
    }
}
