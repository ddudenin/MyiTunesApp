//
//  SearchSongRouterIO.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SearchSongRouterInput {
    func openSongDetail(for song: ITunesSong)
}
