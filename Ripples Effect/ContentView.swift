//
//  ContentView.swift
//  Ripples Effect
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State private var text = "Hello"
	@State private var speed = 0.5
	@State private var strength = 0.5
	@State private var frequency = 5.0
	
    var body: some View {
        VStack {
			WaterEffect(speed: speed, strength: strength, frequency: frequency) { 
				
				Circle()
					.fill(.red)
					.frame(width: 150, height: 150)
					.padding()
					.overlay(content: { 
						Circle().stroke(.red, lineWidth: 3)
					})
					.padding()
					.overlay(content: { 
						Circle().stroke(.pink, lineWidth: 2)
					})
					.padding()
					.overlay(content: { 
						Circle().stroke(.orange, lineWidth: 1)
					})
					.padding()
			}
			
			TextField("Enter a message", text: $text)
				.textFieldStyle(.roundedBorder)
			
			LabeledContent("Speed") {
				Slider(value: $speed)
			}
			
			LabeledContent("Strength") {
				Slider(value: $strength)
			}
			
			LabeledContent("Frequency") {
				Slider(value: $frequency, in: 5...25)
			}
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
