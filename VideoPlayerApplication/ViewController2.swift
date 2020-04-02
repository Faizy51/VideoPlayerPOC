//
//  ViewController2.swift
//  VideoPlayerApplication
//
//  Created by Faizyy on 02/04/20.
//  Copyright © 2020 faiz. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class ViewController2: UIViewController {

    @IBOutlet weak var chatsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatsCollection.delegate = self
        chatsCollection.dataSource = self
        
    }
}

extension ViewController2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ChatCell
        
        cell?.messageTextView.text = "Hello Daryl, how are you?"
                
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}


