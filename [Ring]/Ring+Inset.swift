//
//  Ring+SexyTriangulate.swift
//  Yo Mamma Be Ugly
//
//  Created by Nick Raptis on 12/31/23.
//

import Foundation

extension Ring {

    //@Precondition: attemptCalculateBasicsAndDetermineSafetyPartA passed check
    //@Precondition: attemptCalculateBasicsAndDetermineSafetyPartB passed check
    //@Precondition: buildRingPointInsidePolygonBucket
    //@Precondition: buildLineSegmentBucket
    
    func attemptInset(needsContentions: Bool) -> Bool {
    
        calculateLineSegmentThreats(needsContentions: needsContentions)
        
        calculateProbeSegmentsForInitialInset()
        calculatePointCornerOutliers()
        
        calculateProbePointsFromColliders()
        
        calculateProbeSegmentsUsingProbePoints()
        buildRingProbeSegmentBucket()
        
        if !attemptMeldAndRelax() {
            return false
        }
        
        /*
        //applyProbePointTriangulation()
        if POLY_MESH_INSET_ENABLED {
            purgeSubrings()
            if (depth < POLY_MESH_INSET_LEVEL) || (POLY_MESH_INSET_LEVEL < 0) {
                if ringProbePointCount > 0 {
                    let subring = PolyMeshPartsFactory.shared.withdrawRing(polyMesh: polyMesh)
                    
                    subring.addPointsBegin(depth: depth + 1)
                    for ringProbePointIndex in 0..<ringProbePointCount {
                        let ringProbePoint = ringProbePoints[ringProbePointIndex]
                        
                        subring.addPoint(ringProbePoint.x, ringProbePoint.y)
                    }
                    
                    if !subring.attemptCalculateBasicsAndDetermineSafetyPartA(test: false) {
                        PolyMeshPartsFactory.shared.depositRing(subring)
                        return false
                    }
                    
                    if !subring.attemptCalculateBasicsAndDetermineSafetyPartB(needsPointInsidePolygonBucket: true,
                                                                              needsLineSegmentBucket: true,
                                                                              test: false) {
                        PolyMeshPartsFactory.shared.depositRing(subring)
                        return false
                    }
                    
                    calculateInsetTriangulation()
                    
                    PolyMeshPartsFactory.shared.depositRingContent(self)

                    addSubring(subring)
                    return true
                }
            }
        }
        */

        purgeSubrings()
        if ringProbePointCount > 0 {
            if let triangleData {
                let subring = PolyMeshPartsFactory.shared.withdrawRing(triangleData: triangleData)
                
                subring.addPointsBegin(depth: depth + 1)
                for ringProbePointIndex in 0..<ringProbePointCount {
                    let ringProbePoint = ringProbePoints[ringProbePointIndex]
                    subring.addPoint(x: ringProbePoint.x, y: ringProbePoint.y, controlIndex: -1)
                }
                if !subring.attemptCalculateBasicsAndDetermineSafetyPartA(test: false) {
                    PolyMeshPartsFactory.shared.depositRing(subring)
                    return false
                }
                if !subring.attemptCalculateBasicsAndDetermineSafetyPartB(needsPointInsidePolygonBucket: true,
                                                                          needsLineSegmentBucket: true,
                                                                          test: false) {
                    PolyMeshPartsFactory.shared.depositRing(subring)
                    return false
                }
                calculateInsetTriangulation()
                PolyMeshPartsFactory.shared.depositRingContent(self)
                addSubring(subring)
                return true
            } else {
                return false
            }
        }
        return false
    }
}
