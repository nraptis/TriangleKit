//
//  PossibleMeld.swift
//  Yo Mamma Be Ugly
//
//  Created by Nick Raptis on 1/13/24.
//

import Foundation
import MathKit

class PossibleMeld: MathKit.PointProtocol {
    typealias Point = MathKit.Math.Point
    var x: Float = 0.0
    var y: Float = 0.0
    var point: Point {
        Point(x: x,
              y: y)
    }
}
