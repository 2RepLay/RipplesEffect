//
//  WaterScene.swift
//  Ripples Effect
//
//  Created by nikita on 05.03.2023.
//

import SpriteKit

class WaterScene: SKScene {
	
	private let spriteNode = SKSpriteNode()
	
	var image: UIImage?
	
	let waterShader = SKShader(source: """
	void main() {
		float speed = u_time * u_speed;
		v_tex_coord.x += cos((v_tex_coord.x + speed) * u_frequency) * u_strength;
		v_tex_coord.y += sin((v_tex_coord.y + speed) * u_frequency) * u_strength;
		gl_FragColor = texture2D(u_texture, v_tex_coord);
	}
	""")
	
	override func sceneDidLoad() {
		backgroundColor = .clear
		scaleMode = .resizeFill
		spriteNode.shader = waterShader
		addChild(spriteNode)
	}
	
	func updateTexture() {
		guard view != nil else { return }
		guard let image else { return }
		
		let texture = SKTexture(image: image)
		spriteNode.texture = texture
		spriteNode.size = texture.size()
		spriteNode.position.x = frame.midX
		spriteNode.position.y = frame.midY
	}
	
	override func didMove(to view: SKView) {
		updateTexture()
	}
	
}
