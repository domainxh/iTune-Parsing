//
//  ViewModel.swift
//  iTuneParsing
//
//  Created by Xiaoheng Pan on 2/22/20.
//  Copyright © 2020 Xiaoheng Pan. All rights reserved.
//

import Foundation
import Network
import Model
import Utility

class ViewModel {

    var albums: Box<[Album]> = Box([])
    
    func fetchAlbum() {
        Network.shared.fetchAlbum { result in
            switch result {
            case .success(let albums):
                self.albums.value = albums
            case .failure:
                print("Album fetch failed")
            }
        }
    }
}
