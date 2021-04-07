//
//  ProgressBarView.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/7/21.
//

import UIKit

final class ProgressBarView: UIView {
    private let progressBar = UIView()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupProgressBar()
    }
    
    func configure(with progress: Int, total: Int, insets: CGFloat, containerWidth: CGFloat) {
        progressBar.backgroundColor = .green
        
        let boundsWidth = containerWidth - insets
        let percentage = CGFloat(progress) / CGFloat(total)
        let width = boundsWidth * percentage
        
        let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([widthConstraint])
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupProgressBar() {
        progressBar.backgroundColor = .green
        
        addSubview(progressBar)
        progressBar.addConstraints {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

