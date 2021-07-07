//
//  AppWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppWhatsNewViewController: UIViewController {
    
    private let app: ITunesApp

    private var appWhatsNewView: AppWhatsNewView {
        return self.view as! AppWhatsNewView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = AppWhatsNewView()
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
        self.appWhatsNewView.versionLabel.text = "Версия \(app.version)"
        self.appWhatsNewView.dateLabel.text = getTimeAge(from: app.currentVersionReleaseDate)
        self.appWhatsNewView.discriptionLabel.text = app.releaseNotes
    }
}

