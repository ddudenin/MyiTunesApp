//
//  AppScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol AppScreenshotsViewControllerDelegate: AnyObject {
    func appScreenshotsView(_ view: UIViewController, _ images: [UIImage?], didShowImageAt index: Int)
}

class AppScreenshotsViewController: UIViewController {
    
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    
    private var appScreenshotsView: AppScreenshotsView {
        return self.view as! AppScreenshotsView
    }
    
    weak var appDelegate: AppScreenshotsViewControllerDelegate?
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
        
        self.appScreenshotsView.showDelegate = self
    }
    
    override func loadView() {
        self.view = AppScreenshotsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        downloadScreenshots()
    }
    
    private func downloadScreenshots() {
        for url in self.app.screenshotUrls {
            self.imageDownloader.getImage(fromUrl: url) { image, _ in
                self.appScreenshotsView.screenshots.append(image)
                self.appScreenshotsView.collectionView.reloadData()
            }
        }
    }
}

extension AppScreenshotsViewController: AppScreenshotsViewDelegate {
    func showScreenshot(at index: Int) {
        self.appDelegate?.appScreenshotsView(self, self.appScreenshotsView.screenshots, didShowImageAt: index)
    }
}
