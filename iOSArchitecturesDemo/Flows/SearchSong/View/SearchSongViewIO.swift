//
//  SearchSongViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongViewInput: AnyObject {
    
    func setSearchSongs(_ items: [ITunesSong])
    
    func throbber(show: Bool)
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
}

protocol SearchSongViewOutput: AnyObject {
    func viewDidSearch(with queury: String)
    
    func viewDidSelectSong(_ song: ITunesSong)
}

