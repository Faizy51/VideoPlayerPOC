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
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = true
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.text = "Hell Daryl, How are you?"
        return textView
    }()
    
    var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12.5
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "icon")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override func awakeFromNib() {
        setupViews()
    }
    
    func setupViews() {
        addSubview(messageTextView)
        
        messageTextView.backgroundColor = .init(white: 0.9, alpha: 1)

        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        userImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        userImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let portraitColor = UIColor.init(white: 0.9, alpha: 1)
        let landscapeColor = UIColor.init(white: 0.9, alpha: 0.8)
        self.messageTextView.backgroundColor = self.messageTextView.backgroundColor == portraitColor ? landscapeColor : portraitColor
    }
    
}
