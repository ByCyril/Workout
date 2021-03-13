//
//  BodySkeleton.swift
//  Workout
//
//  Created by Cyril Garcia on 3/13/21.
//

import Foundation
import RealityKit
import ARKit

final class BodySkeleton: Entity {
    
    private var joints: [String: Entity] = [:]
    
    init(for bodyAnchor: ARBodyAnchor) {
        super.init()
        
        for jointName in ARSkeletonDefinition.defaultBody3D.jointNames {
            
            let jointEntity = makeJoint(radius: 0.03, color: .green)
            joints[jointName] = jointEntity
            
            addChild(jointEntity)
        }
        
        update(with: bodyAnchor)
    }
    
    func makeJoint(radius: Float, color: UIColor) -> Entity {
        let mesh = MeshResource.generateSphere(radius: radius)
        let material = SimpleMaterial(color: color, roughness: 0.5, isMetallic: false)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        
        return modelEntity
    }
    
    func update(with bodyAnchor: ARBodyAnchor) {
        let rootPosition = simd_make_float3(bodyAnchor.transform.columns.3)
        
        for jointName in ARSkeletonDefinition.defaultBody3D.jointNames {
            guard let jointEntity = joints[jointName],
                  let jointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: jointName)) else { continue }
            
            let jointOffset = simd_make_float3(jointTransform.columns.3)
            jointEntity.position = rootPosition + jointOffset
            jointEntity.orientation = Transform(matrix: jointTransform).rotation
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
}
