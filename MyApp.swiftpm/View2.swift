//
//  File.swift
//  MyApp
//
//  Created by Michael Ha on 4/12/22.
//
import SwiftUI
import AVFoundation
import AVKit

struct View2: View {
    @StateObject var viewRouter: ViewRouter
    
    @State var shouldHide_1 = false
    @State var shouldHide_2 = false
    @State var shouldHide_3 = false
    @State var shouldHide_4 = false
    @State var shouldHide_5 = false
    @State var shouldHide_6 = false
    @State var shouldHide_7 = false
    @State var shouldHide_8 = false
    @State var shouldHide_9 = false
    @State var shouldHide_10 = false
    
    @State private var object1Wiggle = false
    @State private var object2Wiggle = false
    @State private var object3Wiggle = false
    @State private var object4Wiggle = false
    @State private var object5Wiggle = false
    @State private var object6Wiggle = false
    @State private var object7Wiggle = false
    @State private var object8Wiggle = false
    @State private var object9Wiggle = false
    @State private var object10Wiggle = false

    @State var audioPlayer: AVAudioPlayer!
    
    @State var count: Int = 7
    @State var showMessage = false
    var body: some View {
        
        ZStack{
            
            // background image
            Image("poluted")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .imageScale(.large)
            
            VStack(alignment: .center){
                Group{
                // Object 1
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_1 = true
                        self.count -= 1
                    }, label: {
                        Image("Object-1")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(object1Wiggle ? 5 : -5))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object1Wiggle.toggle()
                            }
                    })
                    .position(x: 200, y: 200)
                    .opacity(shouldHide_1 ? 0 : 1)
                    
                    // Object 2
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_2 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-2")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .rotationEffect(.degrees(object2Wiggle ? 5 : -5))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object2Wiggle.toggle()
                            }
                    })
                    .position(x: 300, y: 500)
                    .opacity(shouldHide_2 ? 0 : 1)
                    
                    
                    // Object 5
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_5 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-5")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(object5Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object5Wiggle.toggle()
                            }
                    })
                    .position(x: 600, y: -500)
                    .opacity(shouldHide_5 ? 0 : 1)
                    
                    // Object 6
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_6 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-6")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(object6Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object6Wiggle.toggle()
                            }
                    })
                    .position(x: 450, y: -200)
                    .opacity(shouldHide_6 ? 0 : 1)
                    
                    // Object 7
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_7 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-7")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .rotationEffect(.degrees(object7Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object7Wiggle.toggle()
                            }
                    })
                    .position(x: 500, y: -100)
                    .opacity(shouldHide_7 ? 0 : 1)
                    
                    // Object 8
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_8 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-8")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .rotationEffect(.degrees(object8Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object8Wiggle.toggle()
                            }
                    })
                    .position(x: 250, y: -300)
                    .opacity(shouldHide_8 ? 0 : 1)
                    
                    // Object 9
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_9 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-9")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .rotationEffect(.degrees(object9Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object9Wiggle.toggle()
                            }
                    })
                    .position(x: 700, y: -300)
                    .opacity(shouldHide_9 ? 0 : 1)
                    
                    // Object 10
                    
                    Button(action: {
                        AudioServicesPlaySystemSound(1334)
                        self.shouldHide_10 = true
                        self.count -= 1

                    }, label: {
                        Image("Object-10")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(object10Wiggle ? 10 : -10))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear() {
                                object10Wiggle.toggle()
                            }
                    })
                    .position(x: 600, y: -200)
                    .opacity(shouldHide_10 ? 0 : 1)
                }
            }
            
            if self.count == 0 {
//                    AudioServicesPlaySystemSound(1321)
                ShowMessage(viewRouter: viewRouter, stateToggle: $showMessage)
//                    AudioServicesPlaySystemSound(1321)
            }
            Button(action: {
                AudioServicesPlaySystemSound(1322)
                viewRouter.currentPage = .page3
            },label: {
                Text("Tap here to explore")
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
            })
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        // add the sound
        .onAppear {
            let sound = Bundle.main.path(forResource: "WaterSound2", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
        
    }
    
}

struct ShowMessage: View{
    @StateObject var viewRouter: ViewRouter
    @Binding var stateToggle: Bool
    @State var showing: Bool = true
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
            AudioServicesPlaySystemSound(1322)
            viewRouter.currentPage = .page3
        }, label: {
            Image("FinalView")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .imageScale(.large)
        }).onTapGesture {
            AudioServicesPlaySystemSound(1322)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewRouter.currentPage = .page3
            }
        }
    }
}



//struct ContentView2_Preview: PreviewProvider {
//    static var previews: some View {
//        View2(viewRouter: ViewRouter())
//    }
//}


/*
 Image(uiImage: UIImage(named: "ww.png")!)
     .resizable()
     .scaledToFit()
     .frame(maxWidth: 200)
     .shadow(radius: 4)
     .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
 */
