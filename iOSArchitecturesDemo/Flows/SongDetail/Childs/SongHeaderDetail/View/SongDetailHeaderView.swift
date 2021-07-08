//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 09.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

class SongDetailHeaderView: UIView {
    private(set) lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.secondarySystemFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray2.cgColor
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 3
        label.textColor = .label
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 3
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
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
        self.addSubview(openButton)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(iconImageView)
        
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 68),
            iconImageView.widthAnchor.constraint(equalToConstant: 68),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4),
            
            
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            subtitleLabel.bottomAnchor.constraint(equalTo: openButton.topAnchor, constant: -16),
            
            openButton.widthAnchor.constraint(equalToConstant: 80),
            openButton.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            openButton.heightAnchor.constraint(equalToConstant: 36),
            openButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        iconImageView.layer.borderColor = UIColor.systemGray2.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.openButton.layer.cornerRadius = self.openButton.frame.height / 2
    }
}

#if DEBUG


struct SongDetailHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        let view = SongDetailHeaderView()
        view.titleLabel.text = "ВКонтакте. Ваша социальная сеть"
        view.subtitleLabel.text = "Mail.ru"
        return UIPreviewView(view)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 200))
    }
}

#endif

