//
//  File.swift
//  MyApp
//
//  Created by Michael Ha on 4/15/22.
//

import SwiftUI
import AVFoundation
import AVKit

struct View4: View{
    @StateObject var viewRouter: ViewRouter
    
    @State var showShark = false
    @State var showPuffer = false
    @State var showCrab = false
    @State var showClownFish = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View{
        ZStack(alignment:.center){
            Image("LastView")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .imageScale(.large)
            
            ShowShark(stateToggle: $showShark)
                .sheet(isPresented: $showShark) {
                    RealShark()
                }.position(x: 550, y: 920)
            ShowPuffer(stateToggle: $showPuffer)
                .sheet(isPresented: $showPuffer) {
                    RealPuffer()
                }.position(x: 250, y: 750)
            
            ShowCrab(stateToggle: $showCrab)
                .sheet(isPresented: $showCrab) {
                    RealCrab()
                }.position(x: 300, y: 200)
            ShowClownFish(stateToggle: $showClownFish)
                .sheet(isPresented: $showClownFish) {
                    RealClownfish()
                }.position(x: 650, y: 200)
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "Sound4", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
    }
}


//struct Preview_View4: PreviewProvider{
//    static var previews: some View{
//        View4(viewRouter: ViewRouter())
//    }
//}

// MARK: Shark
struct ShowShark: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            SharkButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct SharkButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("shark")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? 10 : -10))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}


struct RealShark: View {
    var body: some View {
        ZStack {
            Image("shark-info")
                .resizable()
                .scaledToFill()
        }
    }
}


// MARK: Puffer

struct ShowPuffer: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            PufferButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct PufferButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("puffer")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? -10 : 10))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}

struct RealPuffer: View {
    var body: some View {
        ZStack {
            Image("pufferfish-info")
                .resizable()
                .scaledToFill()
        }
    }
}

// MARK: Crab

struct ShowCrab: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            CrabButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct CrabButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("crab")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? 10 : -10))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}

struct RealCrab: View {
    var body: some View {
        ZStack {
            Image("crab-info")
                .resizable()
                .scaledToFill()
        }
    }
}


// MARK: Clownfish

struct ShowClownFish: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            ClownFishButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct ClownFishButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("clownfish")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? -10 : 10))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}

struct RealClownfish: View {
    var body: some View {
        ZStack {
            Image("clownfish-info")
                .resizable()
                .scaledToFill()
        }
    }
}
