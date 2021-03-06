//
//  ViewController.swift
//  iTuneParsing
//
//  Created by Xiaoheng Pan on 2/21/20.
//  Copyright © 2020 Xiaoheng Pan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var viewModel: ViewModel
    private let cellHeight: CGFloat = 60
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.reuseIdentifier)
        title = NSLocalizedString("Albums", comment: "")
        setupViewModelBinding()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as? AlbumCell else { return UITableViewCell() }
        let album = viewModel.albums.value[indexPath.item]
        cell.configure(album)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.value.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = viewModel.albums.value[indexPath.item]
        let albumDetailViewController = AlbumDetailViewController(album)
        navigationController?.pushViewController(albumDetailViewController, animated: true)
    }
    
    private func setupViewModelBinding() {
        viewModel.fetchAlbum()
        viewModel.albums.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

