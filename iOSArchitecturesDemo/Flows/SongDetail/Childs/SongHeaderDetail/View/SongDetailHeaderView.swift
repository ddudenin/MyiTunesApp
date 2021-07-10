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
    private(set) lazy var artworkImageView: UIImageView = {
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
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 3
        label.textColor = .label
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
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
        self.addSubview(artworkImageView)
        self.addSubview(trackLabel)
        self.addSubview(artistLabel)
        self.addSubview(genreLabel)
  
        NSLayoutConstraint.activate([
            artworkImageView.heightAnchor.constraint(equalToConstant: 100),
            artworkImageView.widthAnchor.constraint(equalToConstant: 100),
            artworkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            artworkImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            artworkImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            trackLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            trackLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            trackLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 16),
            trackLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: -4),
            
            
            artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            artistLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 16),
            artistLabel.bottomAnchor.constraint(equalTo: genreLabel.topAnchor, constant: -4),
            
            genreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            genreLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 16),
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        artworkImageView.layer.borderColor = UIColor.systemGray2.cgColor
    }
}

#if DEBUG

struct SongDetailHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        let view = SongDetailHeaderView()
        view.trackLabel.text = "Огненная дуга"
        view.artistLabel.text = "Кипелов"
        view.genreLabel.text = "Рок"
        return UIPreviewView(view)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 150))
    }
}

#endif

