//
//  ScreenshotCell.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    static let reuseId = "ScreenshotCell"
    
    private let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    private func setupView() {
        self.addSubview(screenshotImageView)
        
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: self.topAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage?) {
        self.screenshotImageView.image = image
    }
}
