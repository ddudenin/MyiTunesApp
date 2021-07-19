//
//  AppDetailScreenshotsView.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

protocol AppScreenshotsViewDelegate: AnyObject {
    func showScreenshot(at index: Int)
}

class AppScreenshotsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.textColor = .label
        label.text = "Предпросмотр"
        return label
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: ScreenshotCell.reuseId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    var screenshots = [UIImage?]()
    weak var showDelegate: AppScreenshotsViewDelegate?
    
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
        self.addSubview(collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: self.collectionView.topAnchor, constant: -10),
            
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension AppScreenshotsView : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.screenshots.count
    }
}

extension AppScreenshotsView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCell.reuseId, for: indexPath) as! ScreenshotCell
        
        let screenshot = self.screenshots[indexPath.row]
        cell.configure(with: screenshot)
        
        return cell
    }
}

extension AppScreenshotsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let image = self.screenshots[indexPath.row] else {
            return .init(width: 200, height: 300)
        }
        let origSize = image.size
        
        if origSize.height > origSize.width {
            return getVerticalSize(collectionView, origSize)
        } else {
            return getHorizontalSize(collectionView, origSize)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.showDelegate?.showScreenshot(at: indexPath.row)
    }
    
    private func getVerticalSize(_ collectionView: UICollectionView, _ imageSize: CGSize) -> CGSize {
        let aspectRatio = imageSize.height / imageSize.width
        
        let insets = collectionView.contentInset
        
        let insetsHSpace = insets.right + insets.left
        let insetsVSpace = insets.top + insets.bottom
        
        var width = collectionView.bounds.width
        
        width -= width / 2 - insetsHSpace
        
        var height = width * aspectRatio
        
        let heightLimit = collectionView.bounds.height - insetsVSpace
        
        if height > heightLimit {
            height = heightLimit
            width = height / aspectRatio
        }
        
        return .init(width: width, height: height)
    }
    
    private func getHorizontalSize(_ collectionView: UICollectionView, _ imageSize: CGSize) -> CGSize {
        let aspectRatio = imageSize.width / imageSize.height
        
        let insets = collectionView.contentInset
        
        let insetsHSpace = insets.right + insets.left
        let insetsVSpace = insets.top + insets.bottom
        
        var height = collectionView.bounds.height - insetsVSpace
        
        var width = height * aspectRatio
        
        let widthLimit = collectionView.bounds.width - insetsHSpace
        
        if width > widthLimit {
            width = widthLimit
            height = width / aspectRatio
        }
        
        return .init(width: width, height: height)
    }
}

#if DEBUG

struct AppScreenshotsView_Preview : PreviewProvider {
    static var previews: some View {
        let view = AppScreenshotsView()
        
        return UIPreviewView(view)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 200))
    }
}

#endif
