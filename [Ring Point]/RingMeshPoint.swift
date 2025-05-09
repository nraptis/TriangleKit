//
//  RingMeshPoint.swift
//  Yo Mamma Be Ugly
//
//  Created by Nick Raptis on 11/30/23.
//

import Foundation
import MathKit

class RingMeshPoint: PointProtocol {
    
    typealias Point = Math.Point
    typealias Vector = Math.Vector
    
    var x = Float(0.0)
    var y = Float(0.0)
    
    var index: UInt32 = 0
    
    var point: Point {
        Point(x: x,
              y: y)
    }
    
    func make(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    func make(ringPoint: RingPoint) {
        self.x = ringPoint.x
        self.y = ringPoint.y
    }
}

extension RingMeshPoint: Equatable {
    static func == (lhs: RingMeshPoint, rhs: RingMeshPoint) -> Bool {
        lhs.index == rhs.index
    }
}

extension RingMeshPoint: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
}

extension RingMeshPoint: CustomStringConvertible {
    var description: String {
        let stringX = String(format: "%.2f", x)
        let stringy = String(format: "%.2f", x)
        return "CutPoint(\(stringX), \(stringy))"
    }
}
