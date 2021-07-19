//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 10.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchSongRouter: SearchSongRouterInput {
    
    weak var viewController: UIViewController?
    
    func openSongDetail(for song: ITunesSong) {
        let vc = SongDetailViewController()
        vc.song = song
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
