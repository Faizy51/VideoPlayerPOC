//
//  AVPlayerController.swift
//  VideoPlayerApplication
//
//  Created by Faizyy on 03/04/20.
//  Copyright © 2020 faiz. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AVPlayerController: AVPlayerViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let url = URL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") {
            
            let player = AVPlayer(url: url)
            self.player = player
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.player?.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
