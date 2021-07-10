//
//  SongDetailPlayerViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 09.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import AVFoundation

class SongDetailPlayerViewController: UIViewController {
    
    private let song: ITunesSong
    
    private var songDetailView: SongDetailPlayerView {
        return self.view as! SongDetailPlayerView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = SongDetailPlayerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.songDetailView.player.pause()
    }
    
    
    // MARK: - Private
    
    private func fillData() {
        guard let audioURL = URL(string: song.audio) else { return }
        
        self.songDetailView.player.replaceCurrentItem(with: AVPlayerItem(url: audioURL))
    }
}
