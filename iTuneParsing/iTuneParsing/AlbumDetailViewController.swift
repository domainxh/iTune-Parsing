//
//  Album.swift
//  iTuneParsing
//
//  Created by Xiaoheng Pan on 2/23/20.
//  Copyright © 2020 Xiaoheng Pan. All rights reserved.
//

import UIKit
import Model

class AlbumDetailViewController: UIViewController {
    
    private let padding: CGFloat = 8
    private var artistTypeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - padding
        return label
    }()

    private var artistNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var artistLinkUrlLabel: UILabel = {
        let label = UILabel()
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - padding
        return label
    }()
    
    private var artistIdLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var trackCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var collectionPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        sv.delegate = self
        sv.alwaysBounceVertical = true
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = NSLocalizedString("Album Details", comment: "")
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubviews(views: artistTypeLabel, collectionNameLabel, artistNameLabel, artistLinkUrlLabel, artistIdLabel, trackCountLabel, collectionPriceLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: artistTypeLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: collectionNameLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: artistNameLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: artistLinkUrlLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: artistIdLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: trackCountLabel)
        scrollView.addConstraintsWithFormat("H:|-[v0]-|", views: collectionPriceLabel)
        scrollView.addConstraintsWithFormat("V:|[v0(40)][v1(40)][v2(40)][v3(40)][v4(40)][v5(40)][v6(40)]", views: artistTypeLabel, collectionNameLabel, artistNameLabel, artistLinkUrlLabel, artistIdLabel, trackCountLabel, collectionPriceLabel)
    }
    
    init(_ album: Album) {
        super.init(nibName: nil, bundle: nil)
        artistTypeLabel.text = "Artist Type: \(album.artistType ?? "Not Available")"
        collectionNameLabel.text = "Collection Name: \(album.collectionName ?? "Not Available")"
        artistNameLabel.text = "Artist Name: \(album.artistName)"
        artistLinkUrlLabel.text = "Artist Link Url: \(album.artistLinkUrl ?? "Not Available")"
        artistIdLabel.text = "Artist ID: \(String(describing: album.artistId))"
        if let trackCount = album.trackCount {
            trackCountLabel.text = "Track Count: \(trackCount)"
        }
        if let collectionPrice = album.collectionPrice {
            collectionPriceLabel.text = "Collection Price: \(collectionPrice)"
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
