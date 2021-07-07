//
//  SearchViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 7/6/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    
    func setSearchApps(_ items: [ITunesApp])
    
    func throbber(show: Bool)
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with queury: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
}
