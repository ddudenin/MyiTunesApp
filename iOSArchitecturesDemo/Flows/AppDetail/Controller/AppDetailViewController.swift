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
        self.view.addSubview(scrollView)
        scrollView.fillSuperview()
        
        self.view.backgroundColor = .systemBackground
        self.configureNavigationController()
        self.addHeaderViewController()
        self.addDescriptionViewController()
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
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
            descriptionView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        ])
    }
    
    @objc func tappedEvent(tapGestureRecognizer: UITapGestureRecognizer) {
        print("click")
    }

}
