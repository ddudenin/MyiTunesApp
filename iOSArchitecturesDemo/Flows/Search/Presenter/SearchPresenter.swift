//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchPresenter: SearchViewOutput {
    
    weak var view: (SearchViewInput & UIViewController)!
    
    private let searchService = ITunesSearchService()
    
    // MARK: - SearchViewOutput
    
    func viewDidSearch(with queury: String) {
        self.requestApps(with: queury)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }
    
    // MARK: - Private
    
    private func requestApps(with query: String) {
        self.view.throbber(show: true)
        self.view.setSearchApps([])
        
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.view.setSearchApps([])
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.setSearchApps(apps)
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController()
        appDetaillViewController.app = app
        view.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
}
