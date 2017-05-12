//
//  Int+Extension.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/11/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

extension Int {
    init(_ range: CountableClosedRange<Int> ) {
        let delta = range.lowerBound < 0 ? abs(range.lowerBound) : 0
        let min = UInt32(range.lowerBound + delta)
        let max = UInt32(range.upperBound   + delta)
        self.init(Int(min + arc4random_uniform(max - min)) - delta)
    }
}
