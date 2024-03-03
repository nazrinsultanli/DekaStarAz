//
//  Coordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func start()

}
