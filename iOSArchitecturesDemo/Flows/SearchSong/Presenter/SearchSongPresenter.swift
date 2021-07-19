//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchSongPresenter: SearchSongViewOutput {
    
    weak var view: (SearchSongViewInput & UIViewController)!
    
    private let searchService = ITunesSearchService()
    
    // MARK: - SearchViewOutput
    
    func viewDidSearch(with queury: String) {
        self.requestSongs(with: queury)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.openSongDetails(with: song)
    }
    
    // MARK: - Private
    
    private func requestSongs(with query: String) {
        self.view.throbber(show: true)
        self.view.setSearchSongs([])
        
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.view.setSearchSongs([])
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.setSearchSongs(songs)
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
    
    private func openSongDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController()
        songDetaillViewController.song = song
        view.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
    
}
