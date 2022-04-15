import SwiftUI
import AVFoundation
import AVKit



struct View1: View {
    @State var showingWhale = false
    @State var showStingRay = false
    @State var showOctopus = false
    @State var audioPlayer: AVAudioPlayer!
    
    @State var willMoveToNextScreen = false
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        

        ZStack{
            Image("WWDC-1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .imageScale(.large)
            
        
            Spacer()
            ShowWhale(stateToggle: $showingWhale)
                .sheet(isPresented: $showingWhale) {
                    RealWhale()
                }.position(x: 450, y: 800)
            

            ShowStingRay(stateToggle: $showStingRay)
                .sheet(isPresented: $showStingRay){
                    RealStingRay()
                }
            
            ShowOctopus(stateToggle: $showOctopus).sheet(isPresented: $showOctopus){
                    RealOctopus()
                }
            VStack(alignment: .center) {
                Text("Hi, my name is Michael. I'm from Nha Trang, VietNam. My childhood attach with sea so I want to save the ocean")
                    .font(.system(size: 22, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .frame(width: 650, height: 60, alignment: .leading)
                    .multilineTextAlignment(.center)
                    
                Text("\"Save the Ocean\"")
                    .font(.system(size: 40, weight: .medium, design:.default))
                    .foregroundColor(.white)
                Text("WWDC 2022")
                    .font(.system(size: 20, weight: .medium, design:.default))
                    .foregroundColor(.white)
                Text("You can click to the animal to see real picture")
                    .font(.system(size: 17, weight: .light, design:.default))
                    .foregroundColor(.white)
                Spacer().frame(height: 20)
            }
            
            Button(action: {
                AudioServicesPlaySystemSound(1322)
                viewRouter.currentPage = .page2
            },label: {
                Text("Tap here to explore")
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
            })
            .frame(maxHeight: .infinity, alignment: .bottom)

        }
// uncomment this
        .onAppear {
            let sound = Bundle.main.path(forResource: "DeepWaterSound1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
        
        // go to view2
        .onTapGesture {
            AudioServicesPlaySystemSound(1322)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewRouter.currentPage = .page2
            }
        }
    
    }
}

//struct ContentView1Preview: PreviewProvider {
//    static var previews: some View {
//        View1(viewRouter: ViewRouter())
//    }
//}

// MARK: show Whale
struct ShowWhale: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            WhaleButton()
        })
        .padding(.horizontal, 50)
//        .padding(.top, 300)
    }
}

// Strcuct meant to be used as an image button
struct WhaleButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("whale")
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
                .rotationEffect(.degrees(imageWiggles ? 4 : -4))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}


struct RealWhale: View {
    var body: some View {
        ZStack {
            Image("whale-info-1")
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

// MARK: StingRay
struct ShowStingRay: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            StingRayButton() // fix this
        })
        .padding(.horizontal, 300)
        .padding(.top, 150)
        .position(x: 650, y: 100)
    }
        
}

struct StingRayButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("pic2")
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
                .rotationEffect(.degrees(imageWiggles ? -4 : 4))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}

struct RealStingRay: View {
    var body: some View {
        ZStack {
            Image("stingray-info")
                .resizable()
                .scaledToFill()
//            Text("This is a real StingRay")
//                .font(.system(size: 18, weight: .light, design: .rounded))
//                .foregroundColor(Color.black)
//                .padding()
//                .background(
//                    Capsule()
//                        .fill(Color.white)
//                        .shadow(radius: 10)
//                )
//                .padding(.bottom, 200)
//                .position(x: 550, y: 1100)
        }
    }
}

// MARK: Octopus
struct ShowOctopus: View {
    @Binding var stateToggle: Bool
    
    var body: some View {
        Button(action: {
            self.stateToggle.toggle()
        }, label: {
            OctopusButton() // fix this
        })
        .padding(.horizontal, 300)
        .padding(.top, 150)
        .position(x: 300, y: 150)
    }
        
}

struct OctopusButton: View {
    @State private var imageWiggles = false
    
    var body: some View {
        VStack {
            Image("pic1")
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
                .rotationEffect(.degrees(imageWiggles ? 5 : -5))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    imageWiggles.toggle()
                }
            }
        }
}

struct RealOctopus: View {
    var body: some View {
        ZStack {
            Image("octopus-info")
                .resizable()
                .scaledToFill()
//            Text("This is a real StingRay")
//                .font(.system(size: 18, weight: .light, design: .rounded))
//                .foregroundColor(Color.black)
//                .padding()
//                .background(
//                    Capsule()
//                        .fill(Color.white)
//                        .shadow(radius: 10)
//                )
//                .padding(.bottom, 200)
//                .position(x: 500, y: 1100)
        }
    }
}




