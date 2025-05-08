//
//  RingCapOff.swift
//  Yo Mamma Be Ugly
//
//  Created by Nick Raptis on 2/14/24.
//

import Foundation
import MathKit

class RingCapOff: PointProtocol {
    typealias Point = MathKit.Math.Point
    var x: Float = 0.0
    var y: Float = 0.0
    var capOffQuality = RingCapOffQuality()
    var point: Point {
        Point(x: x,
              y: y)
    }
}
