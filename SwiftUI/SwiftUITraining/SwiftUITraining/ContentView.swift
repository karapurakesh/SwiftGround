//
//  ContentView.swift
//  SwiftUITraining
//
//  Created by rakesh karapu on 14/11/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var placeName = ""
    @State private var selectedFamilyMember = 0

    
    let familyMembers = ["Rakesh","Madhavi","Manas"]
    var body: some View {
        
        
        NavigationView {
            
            Form {
                
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    
                }
                
                Section {
                    TextField("Enter Place", text: $placeName)
                    Text("My place is \(placeName)")
                    
                }
               
                
                Section {
                    ForEach(0 ..< 3 ) { item in
                        Text("\(item)")
                    }
                }
              
                //OTher way of using ForEach displays same result
               /* Section {
                    ForEach(0 ..< 3){
                        Text("\($0)")
                    }
                }
                */
                
                //Picker with Default Style
                Section{
                    Picker(selection: $selectedFamilyMember, label: Text("Select Family Member")) {
                        ForEach(0 ..< familyMembers.count){
                            Text(self.familyMembers[$0])
                        }
                        
                    }
                Text("\(familyMembers[selectedFamilyMember])")
                }
                
                //Picker with Segmented Picker Style
                Section{
                    Picker(selection: $selectedFamilyMember, label: Text("Select Family Member")) {
                        ForEach(0 ..< familyMembers.count){
                            Text(self.familyMembers[$0])
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                
                
            }
            .navigationBarTitle("SwiftUI Basics")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
