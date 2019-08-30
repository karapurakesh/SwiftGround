//
//  ContentView.swift
//  DesignCode2
//
//  Created by rakesh karapu on 29/06/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var textAreaState = false
    @State private var viewState = CGSize.zero
    @State private var imageState = false
    @State private var showTextArea = false
    
    var body: some View {
        
        ZStack {
            
            ShareMemoryTitleView()
                .foregroundColor(.white)
                .padding(.trailing, 180)
                .padding(.top,50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 4) { item in
                        TemplateView(viewState: self.$viewState, textAreaState: self.$textAreaState, imageState: self.$imageState)
                    }
                }
                
                }
                .padding(.top,180)
            Spacer()
            
            }
            .frame(minWidth: 0, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 0, idealHeight: UIScreen.main.bounds.height, maxHeight: .infinity, alignment: .center)
            .background(Color.black)
            .cornerRadius(15)
            .shadow(radius: 15)
            .offset(x: 0, y: 0)
            .padding(.bottom, 0)
            .edgesIgnoringSafeArea(.all)
        
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


struct ShareMemoryTitleView : View {
    var body: some View {
        return VStack {
            Text("DesignCode")
                .font(.title)
                .fontWeight(.heavy)
            
            }
            .cornerRadius(20)
            .padding(.bottom,700)
    }
}

struct VideoAttachView : View {
    var text = "Click to attach from photo library"
    var color = Color.yellow
    var body: some View {
        return Text(text)
            .font(.subheadline)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .lineLimit(10)
            .padding(.all)
            .frame(width: 280.0, height: 280.0)
            .background(color)
            .cornerRadius(20)
    }
}


struct TemplateView : View {
    
    @Binding var viewState : CGSize
    @Binding var textAreaState : Bool
    @Binding var imageState : Bool
    
    var body: some View {
        return ZStack(alignment: .top){
            
            
            Image("samplebg")
                .resizable()
                .scaledToFit()
                //.scaleEffect(imageState ? 1.39 : 1)
                .frame(width: 280, height: 280)
                .animation(.spring())
                .cornerRadius(20)
                .offset(x: 0, y: 0)
                .offset(x:self.viewState.width, y: self.viewState.height)
                .padding(.top,10)
                .shadow(radius: 15)
                .onTapGesture {
                    
                    
                    self.imageState.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({(value) in
                            self.viewState = value.translation
                            
                        })
                        .onEnded({(value) in
                            self.viewState = CGSize.zero
                            
                        })
            )
            Spacer()
            
            
            Text("Write About DesignCode")
                .frame(width: 260, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .font(.headline)
                .offset(x: 0, y: 300)
                .padding(.top,0)
                .onTapGesture {
                    
                    self.textAreaState.toggle()
            }
            }
            .frame(width: 300, height: 360, alignment: .top)
            .background(Color.red)
            .padding(.top,0)
            .cornerRadius(20)
            //.offset(x:self.viewState.width, y: self.viewState.height)
            .animation(.spring())
    }
}
