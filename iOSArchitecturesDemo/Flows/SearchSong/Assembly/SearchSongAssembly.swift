//
//  SearchSongAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchSongAssembly {
    static func make() -> SearchSongViewController {
        let viewController = SearchSongViewController()
        let presenter = SearchSongPresenter()
        let interactor = SearchSongInteractor(searchService: ITunesSearchService())
        let router = SearchSongRouter()
        
        router.viewController = viewController
        
        viewController.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}
