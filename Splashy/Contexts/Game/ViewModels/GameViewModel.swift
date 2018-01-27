//
//  GameViewModel.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

class GameViewModel {
    var hasStarted = false
    let score: Bindable<Int> = Bindable(0)
    
    func incrementScore() {
        score.value += 1
    }
}
