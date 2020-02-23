//
//  AlbumDetail.swift
//  iTuneParsing
//
//  Created by Xiaoheng Pan on 2/22/20.
//  Copyright © 2020 Xiaoheng Pan. All rights reserved.
//

import UIKit
import Utility
import Model

class AlbumCell: UITableViewCell {
    
    private var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    static var reuseIdentifier: String {
        return String(describing: AlbumCell.self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func configure(_ album: Album) {
        collectionNameLabel.text = album.collectionName ?? "Album title not available"
    }
    
    private func setupView() {
        addSubview(collectionNameLabel)
        addConstraintsWithFormat("H:|-[v0]-|", views: collectionNameLabel)
        addConstraintsWithFormat("V:|-[v0]-|", views: collectionNameLabel)
    }
}
