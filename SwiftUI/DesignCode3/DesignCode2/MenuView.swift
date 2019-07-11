//
//  MenuView.swift
//  DesignCode2
//
//  Created by rakesh karapu on 07/07/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import SwiftUI

struct MenuView : View {
 
    @State var show = false
    @State var image = "list.dash"
    @State var backImage = "arrow.left.circle"
    var body: some View {
        ZStack {
            
            ContentView()
            
            MenuSideButton(show: $show, image: $image)
            
            MenuViewComponent(show: $show)
            
        }
    }
    
}

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif

struct ManuItem : View {
    var image = "creditcard"
    var text = "My Profile"
    var body: some View {
        
        return HStack {
            Image(systemName: image)
                .frame(width: 32, height: 32)
                .imageScale(.large)
                .foregroundColor(Color.black)
            
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}


struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon : String
    
}

let menuData = [
    
    Menu(title: "My Profile", icon: "person.crop.circle"),
    Menu(title: "Groups", icon: "g.circle"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
]

struct MenuViewComponent : View {
    @Binding var show : Bool
    var menuItems = ["My Profile","Gropus","Sign out"]
    var menu = menuData

    var body: some View {
        
        
        return VStack(alignment: .leading, spacing:20) {
          
          HStack() {
            Spacer()
              VStack {
                  Image("93634")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .foregroundColor(Color.black)
                    .tapAction {
                        self.show.toggle()
                }

              }
            
          }
            ForEach(menu) { item in
                ManuItem(image: item.icon, text: item.title)
                
            }
          Spacer()
        }
        .padding(.top, 0)
        .padding(30)
        .frame(minWidth: 0, maxWidth :.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .animation(.fluidSpring())
        .tapAction {
           // self.show.toggle()
            
        }

    }
}


struct MenuSideButton : View {
    @Binding var show : Bool
    @Binding var image : String

    var body: some View {
        return ZStack(alignment: .topTrailing) {
            Button(action: {self.show.toggle()}) {
                HStack {
                    Image(systemName: image)
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                
                
            }
            Spacer()
        }
        .offset(x: show ? 90 : 30)
        .animation(.basic())
}
}

struct MenuBackButton : View {
    @Binding var show : Bool
    @Binding var image : String
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            Button(action: {self.show.toggle()}) {
                HStack {
                    Image(systemName: image)
                        .foregroundColor(.black)
                }
                .padding(.leading, 20)
                    .frame(width: 90, height: 60)
                    .background(Color.blue)
                    .cornerRadius(30)
                   // .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                
                
            }
            Spacer()
        }
        .offset(x: show ? 250 : -90)
            .animation(.basic())
    }
}
