//
//  TabItem.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum TabItem: String, CaseIterable {
    case sowftwear = "sowftwear"
    case music = "music"

    
    var viewController: UIViewController {
        switch self {
        case .sowftwear:
            return SearchAssembly.make()
        case .music:
            return UIViewController()
        }
    }
    // these can be your icons
    var icon: UIImage {
        switch self {
        case .sowftwear:
            return UIImage(systemName: "app.fill")!
        case .music:
            return UIImage(systemName: "music.note.list")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
