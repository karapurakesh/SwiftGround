//
//  ContentView.swift
//  DesignCode
//
//  Created by rakesh karapu on 26/06/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var show = false
    var body: some View {
        
        ZStack {
            
            TitleView()
                .blur(radius: 20.0)
            
            BottomView()
                .blur(radius: 20.0)
            
            CardView()
                .offset(x: 0, y: -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.linear(duration: 0.7))
            CardView()
                .offset(x: 0, y: -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(.linear(duration: 0.7))

            
            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
            }
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct CardView : View {
    var body: some View {
        return VStack {
            Text("Card Title")
            }
            .frame(width: 340.0, height: 220.0)
            .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .shadow(radius: 20)
        
    }
}

struct CertificateView : View {
    var body: some View {
        return VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Dream App")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top)
                    
                    Text("First Card").foregroundColor(.white)
                    
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                
                }
                .padding(.horizontal)
            Spacer()
            Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Cerificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
            }
            .padding()
    }
}

struct BottomView : View {
    var body: some View {
        return VStack {
            Rectangle()
                .frame(width: 60.0, height: 6.0)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("Lots of learning from DesignCode course. Right from Stacks, modifiers, animations,assets,colors, code structuring and more. Right place to continue my journy. Thanks Meng!")
                .lineLimit(10)
            Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(y: 600)
    }
}
