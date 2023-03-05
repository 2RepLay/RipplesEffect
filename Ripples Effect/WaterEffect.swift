//
//  WaterEffect.swift
//  Ripples Effect
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI
import SpriteKit

struct WaterEffect<Content: View>: View {
	
	@Environment(\.displayScale) var displayScale
	
	@State private var scene = WaterScene()
	
	var speed: Double
	var strength: Double 
	var frequency: Double
	
	@ViewBuilder var content: () -> Content
	
    var body: some View {
        let renderer = ImageRenderer(content: content())
		renderer.scale = displayScale
		let image = renderer.uiImage
		let size = image?.size ?? .zero
		
		scene.waterShader.uniforms = [
			SKUniform(name: "u_speed", float: Float(speed)),
			SKUniform(name: "u_strength", float: Float(strength) / 20),
			SKUniform(name: "u_frequency", float: Float(frequency)),
		]
		
		scene.image = image
		scene.updateTexture()
		
		return SpriteView(scene: scene, options: .allowsTransparency)
			.frame(width: size.width, height: size.height)
    }
	
}
