//
//  SearchSongInteractot.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

class SearchSongInteractor: SearchSongInteractorInput {
    
    weak var output: SearchSongInteractorOutput?
    
    private let searchService: ITunesSearchService
    
    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }
    
    func requestSongs(for query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { songs in
                    self.output?.recivedSongs(songs)
                }
                .withError {
                    self.output?.recivedError($0)
                }
        }
    }
}
