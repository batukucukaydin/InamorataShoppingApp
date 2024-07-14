//
//  ArViewContainer.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 2.06.2024.
//
import SwiftUI
import ARKit
import SceneKit

struct ARViewContainer: UIViewRepresentable {
    let modelName: String

    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        arView.delegate = context.coordinator

        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGestureRecognizer)
        
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(modelName: modelName)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        let modelName: String
        
        init(modelName: String) {
            self.modelName = modelName
        }

        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let arView = gestureRecognizer.view as? ARSCNView else { return }
            let touchLocation = gestureRecognizer.location(in: arView)
            let hitTestResults = arView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = hitTestResults.first {
                addModel(at: hitResult, to: arView)
            }
        }

        func addModel(at hitResult: ARHitTestResult, to arView: ARSCNView) {
            if let scene = SCNScene(named: "\(modelName).obj"), let node = scene.rootNode.childNodes.first {
                node.position = SCNVector3(
                    hitResult.worldTransform.columns.3.x,
                    hitResult.worldTransform.columns.3.y,
                    hitResult.worldTransform.columns.3.z
                )
                node.scale = SCNVector3(0.7, 0.7, 0.7) // Adjust scale as necessary
                
                // Ensure the node's material is loaded
                if let material = node.geometry?.firstMaterial {
                    material.diffuse.contents = UIColor.white // Or load the actual texture if any
                }
                
                arView.scene.rootNode.addChildNode(node)
            } else {
                print("Error: Unable to load the .obj file or find the node")
            }
        }
    }
}

struct ARView: View {
    let modelName: String

    var body: some View {
        ARViewContainer(modelName: modelName)
            .edgesIgnoringSafeArea(.all)
    }
}
