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
    
    var urlList: [String] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let uList = appDelegate.applicationData?.videourls {
            return uList
        }
        return []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let urlString = urlList.randomElement(), let url = URL(string: urlString) {
            
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
