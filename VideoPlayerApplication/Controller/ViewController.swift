//
//  ViewController.swift
//  VideoPlayerApplication
//
//  Created by Faizyy on 02/04/20.
//  Copyright © 2020 faiz. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var chatsCollection: UICollectionView!
    @IBOutlet weak var defaultProfileImageView: UIImageView!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    fileprivate var profileImagePortraitCornerRadius: CGFloat = 22
    fileprivate var profileImageLandscapeCornerRadius: CGFloat = 15

    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var messages: [String]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let mList = appDelegate.applicationData?.messageList {
            self.messages = mList
        }
        
        chatsCollection.delegate = self
        chatsCollection.dataSource = self
        chatsCollection.backgroundColor = .clear
                
        defaultProfileImageView.layer.masksToBounds = true
        defaultProfileImageView.layer.cornerRadius = profileImagePortraitCornerRadius
        
        let placeHolderTextColor = UIColor.lightText
        chatTextField.attributedPlaceholder = NSAttributedString(string: "Type your message here..", attributes: [NSAttributedString.Key.foregroundColor: placeHolderTextColor])
        
                
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
  
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        defaultProfileImageView.layer.cornerRadius = defaultProfileImageView.layer.cornerRadius == profileImagePortraitCornerRadius ? profileImageLandscapeCornerRadius : profileImagePortraitCornerRadius
    }
    
}


