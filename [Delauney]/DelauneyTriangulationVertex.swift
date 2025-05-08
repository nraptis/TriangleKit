//
//  DelauneyTriangulationVertex.swift
//  Yo Mamma Be Ugly
//
//  Created by Nick Raptis on 2/18/24.
//

import Foundation

class DelauneyTriangulationVertex {
    var point: DelauneyTriangulationPoint
    var edge: DelauneyTriangulationEdge!
    
    init(point: DelauneyTriangulationPoint) {
        self.point = point
        point.vertex = self
    }
    
    func clear() {
        edge = nil
    }
}

extension DelauneyTriangulationVertex: Equatable {
    static func == (lhs: DelauneyTriangulationVertex, rhs: DelauneyTriangulationVertex) -> Bool {
        lhs === rhs
    }
}

extension DelauneyTriangulationVertex: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
