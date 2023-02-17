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
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound(soundName: "punchSound")
                }
            
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
