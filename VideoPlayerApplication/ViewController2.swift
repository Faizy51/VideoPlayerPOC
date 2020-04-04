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
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var messages: [String] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let mList = appDelegate.applicationData?.messageList {
            return mList
        }
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatsCollection.delegate = self
        chatsCollection.dataSource = self
        chatsCollection.backgroundColor = .clear
                
    }
}

extension ViewController2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate?.applicationData?.messageList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChatCell
                
        cell.messageTextView.text = messages[indexPath.item]

        let size = CGSize(width: collectionView.frame.width-30, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: messages[indexPath.item]).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
                
        cell.messageTextView.frame = CGRect(x: 30, y: 0, width: estimatedFrame.width, height: estimatedFrame.height+12)
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 1000)
                
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: messages[indexPath.item]).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
        
        return CGSize(width: collectionView.frame.width, height: estimatedFrame.height+12)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.chatsCollection.reloadData()
    }
    
}


