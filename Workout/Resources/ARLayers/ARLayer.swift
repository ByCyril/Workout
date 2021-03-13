//
//  ARLayer.swift
//  Workout
//
//  Created by Cyril Garcia on 3/13/21.
//

import Foundation
import RealityKit
import ARKit

extension Float {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

final class ARLayer: NSObject, ARSessionDelegate {
    
    private var arView: ARView
    private var workout: Workout
    
    private var bodySkeleton: BodySkeleton?
    private var bodySkeletonAnchor = AnchorEntity()
    
    init(arView: ARView, workout: Workout) {
        self.arView = arView
        self.workout = workout
        super.init()
    }
    
    func beginTracking() {
        
        arView.session.delegate = self
        
        let config = ARBodyTrackingConfiguration()
        arView.session.run(config, options: [])
        arView.scene.addAnchor(bodySkeletonAnchor)
        
    }

    func drawDot(_ centerX: CGFloat,_ centerY: CGFloat) {
        let circleWidth: CGFloat = 10
        let circleHeight: CGFloat = 10
        let rect = CGRect(origin: CGPoint(x: centerX - circleWidth/2, y: centerY - circleHeight/2), size: CGSize(width: circleWidth, height: circleHeight))
        let circleLayer = CAShapeLayer()
        
        circleLayer.fillColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        circleLayer.path = UIBezierPath(ovalIn: rect).cgPath
        
        arView.layer.addSublayer(circleLayer)
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }

            if let skeleton = bodySkeleton {
                skeleton.update(with: bodyAnchor)
            } else {
                let skeleton = BodySkeleton(for: bodyAnchor)
                bodySkeleton = skeleton
                bodySkeletonAnchor.addChild(skeleton)
            }

        }
    }

}
