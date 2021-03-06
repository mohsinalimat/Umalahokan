//
//  RecentChatTopBar.swift
//  Umalahokan
//
//  Created by Mounir Ybanez on 31/01/2017.
//  Copyright © 2017 Ner. All rights reserved.
//

import UIKit

protocol RecentChatTopBarDelegate: class {
    
    func didTapLeft()
    func didTapRight()
}

class RecentChatTopBar: UIView {
    
    weak var delegate: RecentChatTopBarDelegate?
    
    var titleLabel: UILabel!
    var leftItem: UIButton!
    var rightItem: UIImageView!
    var onlineStatusIndicator: UIView!
    
    convenience init() {
        var rect = CGRect.zero
        rect.size.height = 55
        self.init(frame: rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetup()
    }
    
    override func layoutSubviews() {
        let spacing: CGFloat = 8
        var rect = CGRect.zero
        
        titleLabel.sizeToFit()
        rect = titleLabel.frame
        rect.origin.x = (frame.width - rect.width) / 2
        rect.origin.y = (frame.height - rect.height) / 2
        titleLabel.frame = rect
        
        leftItem.sizeToFit()
        rect = leftItem.frame
        rect.origin.x = spacing * 2
        rect.origin.y = (frame.height - rect.height) / 2
        leftItem.frame = rect
        
        rect.size.width = titleLabel.frame.height
        rect.size.height = rect.size.width
        rect.origin.x = frame.width - rect.width - (spacing * 2)
        rect.origin.y = (frame.height - rect.height) / 2
        rightItem.layer.cornerRadius = rect.width / 2
        rightItem.frame = rect
        
        rect.size.width = 10
        rect.size.height = rect.width
        onlineStatusIndicator.layer.cornerRadius = rect.width / 2
        onlineStatusIndicator.frame = rect
    }
    
    private func initSetup() {
        backgroundColor = UIColor(red: 57/255, green: 59/255, blue: 88/255, alpha: 1.0)
        
        titleLabel = UILabel()
        titleLabel.text = "CHAT"
        titleLabel.font = UIFont(name: "AvenirNext-Medium", size: 13)
        titleLabel.textColor = UIColor.white
        
        leftItem = UIButton()
        leftItem.addTarget(self, action: #selector(didTapLeft), for: .touchUpInside)
        leftItem.setImage(#imageLiteral(resourceName: "icon-contact-list"), for: .normal)
        
        rightItem = UIImageView()
        rightItem.backgroundColor = UIColor.white
        rightItem.clipsToBounds = true

        onlineStatusIndicator = UIView()
        onlineStatusIndicator.backgroundColor = UIColor.clear
        onlineStatusIndicator.clipsToBounds = true
        onlineStatusIndicator.layer.borderWidth = 3.0
        onlineStatusIndicator.layer.borderColor = UIColor(
            red: 42/255,
            green: 198/255,
            blue: 173/255,
            alpha: 1.0).cgColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapRight))
        tap.numberOfTapsRequired = 1
        rightItem.isUserInteractionEnabled = true
        rightItem.addGestureRecognizer(tap)
        
        addSubview(titleLabel)
        addSubview(leftItem)
        addSubview(rightItem)
        addSubview(onlineStatusIndicator)
    }
    
    func didTapLeft() {
        delegate?.didTapLeft()
    }
    
    func didTapRight() {
        delegate?.didTapRight()
    }
}
