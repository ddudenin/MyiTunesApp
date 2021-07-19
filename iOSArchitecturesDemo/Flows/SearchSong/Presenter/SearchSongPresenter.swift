//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchSongPresenter {
    
    var interactor: SearchSongInteractorInput!
    var router: SearchSongRouterInput!
    weak var view: SearchSongViewInput!
    
    var songs: [ITunesSong] = []
}

// MARK: - SearchViewOutput
extension SearchSongPresenter: SearchSongViewOutput {
    
    func viewDidSearch(with queury: String) {
        self.view.throbber(show: true)
        self.interactor.requestSongs(for: queury)
    }
    
    func viewDidSelectSong(_ cellModel: SongCellModel) {
        guard let song = self.songs.first(where: { $0.trackName == cellModel.title }) else { return }
        self.router.openSongDetail(for: song)
    }
}

extension SearchSongPresenter: SearchSongInteractorOutput {
    func recivedSongs(_ songs: [ITunesSong]) {
        self.view.throbber(show: false)
        
        self.songs = songs
        
        if songs.isEmpty {
            self.view.showNoResults()
        } else {
            self.view.hideNoResults()
        }
        let models = songs.map { SongCellModelFactory.cellModel(from: $0) }
        self.view.setSearchSongs(models)
    }
    
    func recivedError(_ error: Error) {
        self.view.throbber(show: false)
        self.view.showNoResults()
    }
}
