//
//  ContentView.swift
//  DesignCode2
//
//  Created by rakesh karapu on 29/06/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView : View {
    
    @State var textAreaState = false
    @State var viewState = CGSize.zero
    @State var imageState = false
    
    var body: some View {
      VStack() {
            
            Text(verbatim: "Title goes here")
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(20)
                .padding(.top,80)
                .foregroundColor(.white)
                .padding(.trailing, 130)
            
            ZStack() {
                
               // if textAreaState {
                    VideoAttachView(textAreaState: self.$textAreaState, text: "Lots of learning from DesignCode course. Right from Stacks, modifiers, animations,assets,colors, code structuring and more. Right place to continue my journy. Thanks Meng!", color: Color("primary"))
                        .scaleEffect(textAreaState ? 1.1 : 1)
                        .animation(.fluidSpring())
                        .offset(x:0, y: textAreaState ? 200 : 0)
                        .padding(.top, 200)
                        .foregroundColor(.black)
                        .tapAction {
                            self.textAreaState.toggle()
                        }
               // }
                
                
                
                TemplateView(textAreaState: self.$textAreaState, viewState: self.$viewState, imageState: self.$imageState)
            }
            
            
            Text("Your Photos are here")
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(20)
                .padding(.top, self.textAreaState ? 220 : 20)
                .animation(.spring())
                .foregroundColor(.white)
                .padding(.trailing, 130)
            
        ScrollView(.horizontal, showsIndicators: false){
                
                HStack {
                    ForEach(0 ..< 4) { (value) in
                        
                        SharedByView()
                            .padding(.leading,10)


                        
                    }
                }.background(Color.clear)
            }
            .padding(.top, 10)
            .animation(.spring())
        
        
        
            Spacer()
            }
            .frame(minWidth: 0, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            //.background(Color("background7"))
            .background(Color.black)
            .cornerRadius(15)
            .shadow(radius: 15)
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
    var title = "Share your photo"
    var body: some View {
        return VStack {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
            }
            .cornerRadius(20)
            .padding(.bottom,680)
    }
}

struct VideoAttachView : View {
    
    @Binding var textAreaState : Bool
    
    var text = "Click to attach from photo library"
    var color = Color.yellow
    var body: some View {
        return Text(text)
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .lineLimit(10)
            .padding(.all)
            .frame(width: 360.0, height:180)
            .background(color)
            .cornerRadius(20)
        //.shadow(color: .red, radius: 8, x: 0, y: 8)
    }
}




struct TemplateView : View {
    
    @Binding var textAreaState : Bool
    @Binding var viewState : CGSize
    @Binding var imageState : Bool
    
    var body: some View {
        return ZStack(alignment: .top){
            Image("mine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, height: 360)
                .animation(.fluidSpring())
                .cornerRadius(20)
                .offset(x:self.viewState.width, y: self.viewState.height)
                .padding(.top,20)
                .shadow(radius: 15)
                .tapAction {
                    
                    self.textAreaState.toggle()
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
            
        }
        
    }
}


struct SharedByView : View {
    
    var body: some View {
        return ZStack(alignment: .top){
            Image("mine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .animation(.fluidSpring())
                .cornerRadius(20)
                //.offset(x:self.viewState.width, y: self.viewState.height)
                //.padding(.top,5)
                //.shadow(radius: 15)
                .tapAction {
                    
                    // self.textAreaState.toggle()
            }
            
        }
        
    }
}
