//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 09.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    private let imageDownloader = ImageDownloader()
    
    private var songDetailView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = SongDetailHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadArtwork()

        self.songDetailView.trackLabel.text = song.trackName
        self.songDetailView.artistLabel.text = song.artistName
        self.songDetailView.genreLabel.text = song.genre + " - " + getYear(from: song.release)
    }
    
    private func downloadArtwork() {
        guard let url = self.song.artwork else { return }
        
        self.imageDownloader.getImage(fromUrl: url) { image, _ in
            self.songDetailView.artworkImageView.image = image
        }
    }
}

