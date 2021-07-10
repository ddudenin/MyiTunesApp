//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp!
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var whatsNewViewController = AppWhatsNewViewController(app: app)
    lazy var screenshotsViewController = AppScreenshotsViewController(app: app)
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: - Private
    
    func configureView() {
        self.view.backgroundColor = .systemBackground
        self.configureNavigationController()
        self.configureScrollView()
        self.addHeaderViewController()
        self.addDescriptionViewController()
        self.addScreenshotsViewController()
    }

    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureScrollView() {
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        let headerView = headerViewController.view!
        self.scrollView.addSubview(headerView)
        headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        self.addChild(whatsNewViewController)
        let descriptionView = whatsNewViewController.view!
        self.scrollView.addSubview(descriptionView)
        whatsNewViewController.didMove(toParent: self)
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            descriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    private func addScreenshotsViewController() {
        self.addChild(screenshotsViewController)
        let screenshotView = screenshotsViewController.view!
        self.scrollView.addSubview(screenshotView)
        screenshotsViewController.didMove(toParent: self)
        
        screenshotView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotView.topAnchor.constraint(equalTo: whatsNewViewController.view.bottomAnchor),
            screenshotView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            screenshotView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            screenshotView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            screenshotView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
