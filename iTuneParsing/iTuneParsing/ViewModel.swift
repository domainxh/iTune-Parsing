//
//  ViewModel.swift
//  iTuneParsing
//
//  Created by Xiaoheng Pan on 2/22/20.
//  Copyright © 2020 Xiaoheng Pan. All rights reserved.
//

import Foundation
import Network

// Unlike SwiftUI, UIKit does not have binding out of the box. If I have more time, I would implement binding to allow automatic update of view as opposed to using completion hanlder.

class ViewModel {

    var albums = [Album]()

    func fetch(completion: @escaping () -> ()) {
        Network.shared.fetchAlbum { [weak self] (albums) in
            guard let self = self else { return }
            self.albums = albums
            completion()
        }
    }
    
}
