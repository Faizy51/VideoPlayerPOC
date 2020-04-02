//
//  ChatCell.swift
//  VideoPlayerApplication
//
//  Created by Faizyy on 03/04/20.
//  Copyright © 2020 faiz. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    var messageTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = "Hell Daryl, How are you?"
        return textView
    }()
    
    override func awakeFromNib() {
        setupViews()
    }
    
    func setupViews() {
        addSubview(messageTextView)
        
        messageTextView.backgroundColor = .lightGray
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        messageTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageTextView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        messageTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        
        
    }
    
}
