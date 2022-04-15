//
//  File.swift
//  MyApp
//
//  Created by Michael Ha on 4/13/22.
//

import SwiftUI
import AVFoundation
import AVKit

struct View3: View {
    @StateObject var viewRouter: ViewRouter
    
    @State var showDolphin = false
    @State var showTurtle = false
    @State var showSeaHorse = false
    @State var showJellyFish = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    
    var body: some View{
        ZStack(alignment:.center){
            Image("WWDC-1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .imageScale(.large)
            ShowDolphin(stateToggle: $showDolphin)
                .sheet(isPresented: $showDolphin) {
                    RealDolphin()
                }.position(x: 550, y: 920)
            
            ShowTurtle(stateToggle: $showTurtle).sheet(isPresented: $showTurtle){
                RealTurtle()
            }.position(x: 600, y: 150)
            
            ShowSeaHorse(stateToggle: $showSeaHorse).sheet(isPresented: $showSeaHorse){
                RealSeahorse()
            }.position(x: 300, y: 900)
            
            ShowJellyFish(stateToggle: $showJellyFish).sheet(isPresented: $showJellyFish){
                RealJellyFish()
            }.position(x: 300, y: 150)
            // 600, 150
            VStack(alignment: .center){
                Text("Oceanic pollution is the process where harmful or potentially harmful substances get into the ocean where they affect the existence of the sea organisms. Most of the harmful materials such as industrial, agricultural wastes as well as air pollution come from land. Pollutants get into the ocean through rivers from urban centers sewage and drainage systems. In the land runoffs, the pollutants include soil from farms, agricultural chemicals such as fertilizers, constructions as well as mining fields that are carried into the ocean by the rain or river water. All these pollutants are consumed by fish and other sea animals and eventually ending up in the fish we eat. The accumulation of these chemicals in the bodies of human beings can cause serious health issues. In order to reduce ocean pollution, tighter regulations should be placed on industries and sewage to ensure that the wastes of the industries are treated before being let into the rivers. \n #Save the Ocean \n -You can tab to animals to read information-")
                    .font(.system(size: 23, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .frame(width: 650, height: 700, alignment: .leading)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                AudioServicesPlaySystemSound(1322)
                viewRouter.currentPage = .page4
            },label: {
                Text("Tap here to continue")
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
            })
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "Sound3", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
        .onTapGesture {
            AudioServicesPlaySystemSound(1322)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewRouter.currentPage = .page3
            }
        }
    }
}

//struct Preview_View3: PreviewProvider {
//    static var previews: some View{
//        View3(viewRouter: ViewRouter())
//    }
//}


// MARK: Dolphin
struct ShowDolphin: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            DolphinButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct DolphinButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("dolphin")
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


struct RealDolphin: View {
    var body: some View {
        ZStack {
            Image("dolphin-info")
                .resizable()
                .scaledToFill()
        }
    }
}

// MARK: Turtle

struct ShowTurtle: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            TurtleButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct TurtleButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("turtle")
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


struct RealTurtle: View {
    var body: some View {
        ZStack {
            Image("turtle-info")
                .resizable()
                .scaledToFill()
//            Text("This is a real Whale🐋")
//                .font(.system(size: 18, weight: .light, design: .rounded))
//                .foregroundColor(Color.black)
//                .padding()
//                .background(
//                    Capsule()
//                        .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
//                        .shadow(radius: 10)
//                )
//                .padding(.bottom, 200)
//                .position(x: 500, y: 1000)
        }
    }
}

// MARK: Sea Horse
struct ShowSeaHorse: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            SeaHorseButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct SeaHorseButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("seahorse")
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


struct RealSeahorse: View {
    var body: some View {
        ZStack {
            Image("seahorse-info")
                .resizable()
                .scaledToFill()
//            Text("This is a real Whale🐋")
//                .font(.system(size: 18, weight: .light, design: .rounded))
//                .foregroundColor(Color.black)
//                .padding()
//                .background(
//                    Capsule()
//                        .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
//                        .shadow(radius: 10)
//                )
//                .padding(.bottom, 200)
//                .position(x: 500, y: 1000)
        }
    }
}

// MARK: Jellyfish

struct ShowJellyFish: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            JellyFishButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

struct JellyFishButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("jellyfish")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? 10 : -10))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}


struct RealJellyFish: View {
    var body: some View {
        ZStack {
            Image("jellyfish-info")
                .resizable()
                .scaledToFill()
//            Text("This is a real Whale🐋")
//                .font(.system(size: 18, weight: .light, design: .rounded))
//                .foregroundColor(Color.black)
//                .padding()
//                .background(
//                    Capsule()
//                        .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
//                        .shadow(radius: 10)
//                )
//                .padding(.bottom, 200)
//                .position(x: 500, y: 1000)
        }
    }
}


