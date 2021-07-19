//
//  SearchAppAssembly.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum SearchAppAssembly {
    static func make() -> SearchAppViewController {
        let viewController = SearchAppViewController()
        let presenter = SearchAppPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
        
        return viewController
    }
}
