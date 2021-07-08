//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong!
    lazy var headerViewController = SongDetailHeaderViewController(song: song)
    //lazy var whatsNewViewController = AppWhatsNewViewController(app: app)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: - Private
    
    func configureView() {
        self.view.backgroundColor = .systemBackground
        self.configureNavigationController()
        self.addHeaderViewController()
        //self.addDescriptionViewController()
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        let headerView = headerViewController.view!
        self.view.addSubview(headerView)
        headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    /*private func addDescriptionViewController() {
        self.addChild(whatsNewViewController)
        let descriptionView = whatsNewViewController.view!
        self.view.addSubview(descriptionView)
        whatsNewViewController.didMove(toParent: self)
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            descriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }*/

}
