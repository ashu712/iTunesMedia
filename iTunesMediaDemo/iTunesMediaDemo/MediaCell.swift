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
        let imgSize:CGFloat = 80
        imgViewMedia = UIImageView.init(frame: CGRect.init(x: 10, y: 0, width: imgSize, height: imgSize))
        imgViewMedia.contentMode = .scaleAspectFit
        self.contentView.addSubview(imgViewMedia)
        imgViewMedia.translatesAutoresizingMaskIntoConstraints = false
        
        // Add Title
        lblTitle.font = UIFont(name: "Helvetica", size: 17)
        lblTitle.numberOfLines = 3
        lblTitle.sizeToFit()
        lblTitle.textAlignment = .left
        lblTitle.backgroundColor = UIColor.white
        lblTitle.adjustsFontSizeToFitWidth = true
        
        // Add Title
        lblMediaType.font = UIFont(name: "Helvetica", size: 15)
        lblMediaType.numberOfLines = 1
        lblMediaType.sizeToFit()
        lblMediaType.textAlignment = .left
        lblMediaType.backgroundColor = UIColor.white
        lblMediaType.textColor = UIColor.darkGray
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 5
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(lblMediaType)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stackView)

        // set constraints
        NSLayoutConstraint.activate([
            imgViewMedia.widthAnchor.constraint(equalToConstant: imgSize),
            imgViewMedia.heightAnchor.constraint(equalToConstant: imgSize),
            imgViewMedia.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgViewMedia.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            stackView.leadingAnchor.constraint(equalTo: imgViewMedia.leadingAnchor, constant: imgViewMedia.frame.maxX+5.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
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
