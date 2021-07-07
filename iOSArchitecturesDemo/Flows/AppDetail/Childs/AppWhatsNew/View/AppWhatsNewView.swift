//
//  AppWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

class AppWhatsNewView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.textColor = .label
        label.text = "Что нового"
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 5
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(dateLabel)
        self.addSubview(discriptionLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -4),
            
            
            versionLabel.trailingAnchor.constraint(equalTo: self.dateLabel.leadingAnchor, constant: -16),
            versionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            versionLabel.bottomAnchor.constraint(equalTo: discriptionLabel.topAnchor, constant: -16),
            
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            //dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: discriptionLabel.topAnchor, constant: -16),
            
            discriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            discriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            discriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
            
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

#if DEBUG


struct AppWhatsNewView_Preview : PreviewProvider {
    static var previews: some View {
        let view = AppWhatsNewView()
        view.versionLabel.text = "Version 2.2.4"
        view.dateLabel.text = "2w ago"
        view.discriptionLabel.text = """
The Official Street League Skateboarding Mobile Game.
        
#1 game in 80 countries. Loved by skaters all over the world.

        
Touch Arcade review – 4.5/5 – “”True skate is clearly something special””

        
Note: True Skate comes with a single skate park and contains additional content only available by In-App purchase. See below.
"""
        return UIPreviewView(view)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 200))
    }
}

#endif

