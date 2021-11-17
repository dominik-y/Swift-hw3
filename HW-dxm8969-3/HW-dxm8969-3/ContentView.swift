//
//  ContentView.swift
//  HW-dxm8969-3
//
//  Created by Dominik Maric on 15.11.2021..
//

import SwiftUI


struct ContentView: View {
    
    @State var selection: String = "Home Screen"
    var options: [String] = [ "Navigate to Message Screen", "Alert" ]
    let disabled = ["Navigate to Message Screen"]
    @State private var message: String = "Enter message"
    @State private var trigger: String = "Trigger"
    @State public var isAlertPressed = false
    @State private var navigate = false
    @State private var picker = 0
    
     
    var color: Color {
        if message.lowercased().contains("blue") {
            return .blue
        } else if message.lowercased().contains("green") {
            return .green
        } else if message.lowercased().contains("red") {
            return .red
        } else if message.lowercased().contains("purple") {
            return .purple
        } else {
            return .gray
        }
    }
    
    

    var body: some View {
        NavigationView {
            VStack {
                Picker(
                    selection: $picker,
                    label: Text("Home Screen"),
                    content: {
                        ForEach(options.indices) { index in
                            Text(options[index])
                                .tag(options[index])
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding()
       
                Spacer()
                //TEXT
                TextField("Enter message", text: $message)
                    .padding()
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.4).cornerRadius(10))
                    .padding()
                                
                //TRIGER BUTTON
                Button(action: {
                    if(self.picker == 0) {
                        self.isAlertPressed = false
                    }
                    if(self.picker == 1) {
                        self.isAlertPressed = true
                    }
                },
                    label: {
                    Text("Trigger")
                        .font(Font.system(size: 28, design: .rounded).weight(.heavy))
                        .foregroundColor(.gray)
                        .padding(.bottom, 200)
                })
                    .alert(isPresented: $isAlertPressed) {
                    Alert(
                          title: Text("\(message)"),
                          dismissButton: .default(Text("Close"),
                    action: {
                        self.message = ""
                    }))
                }
                Circle()
                    .fill(color)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 150)
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: NavigationLink(
                destination: Text("Created by dxm8969")) {
                    Text("About")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//INDICES PART IS TAKEN FROM INTERNET, I TOOK EXAMPLE AS A REFERENCE AND APPLY IT TO MY CODE BECAUSE UNFORTUNATELY I MISSED THAT PART IN CLASS AND NEEDED HELP UNDERSTANDING IT
