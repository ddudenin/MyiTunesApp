//
//  SongPlayerView.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 09.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import AVFoundation
#if DEBUG
import SwiftUI
#endif

class SongPlayerView: UIView {
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(playImage, for: .normal)
        
        button.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var timeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1.0
        slider.isContinuous = true
        slider.value = 0.0
        slider.minimumTrackTintColor = .systemGreen
        slider.addTarget(self, action: #selector(onSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var player: AVPlayer = {
        return AVPlayer()
    }()
    
    private var timer = Timer()
    
    private let defaultTime = "00:00"
    private let playImage = UIImage(systemName: "play.circle.fill")
    private let pauseImage = UIImage(systemName: "pause.circle.fill")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerEndPlay), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupView() {
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.bounds
        self.layer.addSublayer(playerLayer)
        
        timeLabel.text = defaultTime

        self.addSubview(playButton)
        self.addSubview(timeSlider)
        self.addSubview(timeLabel)
     
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 50),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            playButton.trailingAnchor.constraint(equalTo: timeSlider.leadingAnchor, constant: -16),
            playButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            timeSlider.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeSlider.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -16),
            
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            timeLabel.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func play(_ sender: UIButton!) {
        if player.rate == 0 {
            sender.setImage(pauseImage, for: .normal)
            player.play()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateVideoPlayerSlider), userInfo: nil, repeats: true)
        } else {
            sender.setImage(playImage, for: .normal)
            player.pause()
            timer.invalidate()
        }
    }
    
    @objc func playerEndPlay() {
        playButton.setImage(playImage, for: .normal)
        player.seek(to: CMTime.zero)
        timer.invalidate()
        timeSlider.value = 0
        timeLabel.text = defaultTime
    }
    
    @objc func onSliderValueChanged() {
        guard let duration = player.currentItem?.duration else { return }
        
        let seconds = timeSlider.value * Float(CMTimeGetSeconds(duration))
        
        player.seek(to: CMTime(seconds: Double(seconds), preferredTimescale: .max))

        updateVideoPlayerSlider()
    }
    
    
    @objc func updateVideoPlayerSlider() {
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime())

        let mins = currentTimeInSeconds / 60
        let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
            return
        }
        
        timeLabel.text = "\(minsStr):\(secsStr)"
        timeSlider.value = Float(currentTimeInSeconds)
        
        if let currentItem = player.currentItem {
            let duration = currentItem.duration
            if (CMTIME_IS_INVALID(duration)) {
                // Do sth
                return;
            }
            let currentTime = currentItem.currentTime()
            timeSlider.value = Float(CMTimeGetSeconds(currentTime) / CMTimeGetSeconds(duration))
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.playButton.layer.cornerRadius = self.playButton.frame.height / 2
    }
}

#if DEBUG


struct SongPlayerView_Preview: PreviewProvider {
    static var previews: some View {
        let view = SongPlayerView()
        view.timeLabel.text = "02:00"
        view.timeSlider.value = 0.5
        return Group {
            UIPreviewView(view)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 120))
        }
    }
}

#endif

