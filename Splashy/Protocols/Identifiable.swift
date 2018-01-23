//
//  Identifiable.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol Identifiable {}

extension Identifiable {
    static var name: String { return String(describing: self) }
}
