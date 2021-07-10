//
//  SearchSongInteractorIO.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SearchSongInteractorInput: AnyObject {
    func requestSongs(for query: String)
}

protocol SearchSongInteractorOutput: AnyObject {
    func recivedSongs(_ songs: [ITunesSong])
    func recivedError(_ error: Error)
}
