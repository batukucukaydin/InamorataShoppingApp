//
//  ARViewController.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 11.06.2024.
//
/*
import UIKit
import ARKit

class ARViewController: UIViewController {
    var modelName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let arView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(arView)

        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)

        if let modelName = modelName, let modelUrl = Bundle.main.url(forResource: modelName, withExtension: "obj") {
            let referenceNode = SCNReferenceNode(url: modelUrl)
            referenceNode?.load()

            if let node = referenceNode {
                arView.scene.rootNode.addChildNode(node)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let arView = self.view as? ARSCNView {
            arView.session.pause()
        }
    }
}
*/
