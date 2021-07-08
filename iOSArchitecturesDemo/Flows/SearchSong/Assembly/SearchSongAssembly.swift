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
        
        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
