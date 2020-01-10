//
//  MediaCell.swift
//  iTunesMediaDemo
//
//  Created by Rave's Macbook on 1/9/20.
//  Copyright © 2020 Ashutosh's Macbook. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    var imgViewMedia:UIImageView = UIImageView()
    var lblTitle:UILabel = UILabel()
    var lblMediaType:UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add image view
        let imgSize:CGFloat = 60
        imgViewMedia = UIImageView.init(frame: CGRect.init(x: 10, y: 0, width: imgSize, height: imgSize))
        self.contentView.addSubview(imgViewMedia)
        imgViewMedia.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Add Title
        lblTitle.font = UIFont(name: "Helvetica", size: 18)
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        lblTitle.textAlignment = .center
        lblTitle.backgroundColor = UIColor.white
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lblTitle)
        
        // Add Title
        lblMediaType.font = UIFont(name: "Helvetica", size: 15)
        lblMediaType.numberOfLines = 0
        lblMediaType.sizeToFit()
        lblMediaType.textAlignment = .center
        lblMediaType.backgroundColor = UIColor.white
        lblMediaType.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lblMediaType)
        
        // set constraints
        NSLayoutConstraint.activate([
            imgViewMedia.widthAnchor.constraint(equalToConstant: imgSize),
            imgViewMedia.heightAnchor.constraint(equalToConstant: imgSize),
            imgViewMedia.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgViewMedia.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            lblTitle.leadingAnchor.constraint(equalTo: imgViewMedia.leadingAnchor, constant: imgViewMedia.frame.maxX+5.0),
            lblTitle.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -25),

            lblMediaType.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblMediaType.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5),

        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
