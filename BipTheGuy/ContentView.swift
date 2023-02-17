//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Christopher Kennedy on 2/16/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
//    @State private var scale = 1.0 // 100% scale, og size
    @State private var animateImage = true
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9) //Scale to full size if true, or 90% if false
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false
                    withAnimation (.spring(response: 0.3, dampingFraction: 0.3)){
                        animateImage = true //Changs scale back to 1.0, but with an animation
                    }
                }
//                .animation(.spring(response: 0.3, dampingFraction: 0.3), value: scale)
            
            Spacer()
            
            Button {
                //TODO: button action here
            } label: {
                Label("Photo Libary", systemImage: "photo.fill.on.rectangle.fill")
            }

        }
        .padding()
    }
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😧 Could not read file named \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch{
            print("🤬 ERROR: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
