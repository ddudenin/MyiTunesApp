//
//  ScreenshotsPageViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 11.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class ScreenshotsPageViewController: UIPageViewController {
 
    private let images: [UIImage?]
    private var curIdx: Int
    
    init(index: Int, images: [UIImage?]) {
        self.curIdx = index
        self.images = images
        
        super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.dataSource = self
        self.view.backgroundColor = .black
        
        let contentVC = ContentViewController()
        contentVC.image = isValidIndex(self.curIdx) ?
            self.images[curIdx] :
            UIImage(systemName: "photo.fill")
        
        let viewControllers = [contentVC]
        self.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
    private func isValidIndex(_ index: Int) -> Bool {
        return index >= 0 && index < self.images.count
    }
}

extension ScreenshotsPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getContentViewController(at: self.curIdx - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getContentViewController(at: self.curIdx + 1)
    }
    
    private func getContentViewController(at index: Int) -> UIViewController? {
        guard isValidIndex(index) else { return nil }
        
        let contentVC = ContentViewController()
        contentVC.image = self.images[index]
        
        self.curIdx = index
        
        return contentVC
    }
}

class ContentViewController: UIViewController {
    
    var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        view.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16),
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16),
        ])
    }
}
