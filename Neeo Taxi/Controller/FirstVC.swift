//
//  ViewController.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class FirstVC: BaseVC {
    
    @IBOutlet var videoView: UIView!
    var introPlayer: AVPlayer?
    var avpController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        self.avpController.showsPlaybackControls = false
        playVideo()
        // Do any additional setup after loading the view.
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "OptionsVC") as? OptionsVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "splash", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let url = URL(fileURLWithPath: path)
        introPlayer = AVPlayer(url: url)
        
        avpController.player = introPlayer
        
        avpController.view.frame.size.height = videoView.frame.size.height
        
        avpController.view.frame.size.width = videoView.frame.size.width
        
        self.avpController.player?.play()
        
        self.videoView.addSubview(avpController.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}

