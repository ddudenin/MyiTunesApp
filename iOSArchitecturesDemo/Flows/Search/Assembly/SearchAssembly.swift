//
//  SearchAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchAssembly {
    static func make() -> SearchViewController {
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
