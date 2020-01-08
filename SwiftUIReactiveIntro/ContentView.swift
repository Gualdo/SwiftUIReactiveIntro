//
//  ContentView.swift
//  SwiftUIReactiveIntro
//
//  Created by De La Cruz, Eduardo on 08/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var users = [String]()
    
    var isInfoFilled: Bool {
        return firstName.count > 0 && lastName.count > 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        Group {
                            TextField("First Name", text: $firstName).padding(12)
                            TextField("Last Name", text: $lastName).padding(12)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)
                        Group {
                            HStack {
                                Button(action: {
                                    self.users.append("\(self.firstName) \(self.lastName)")
                                    self.firstName = ""
                                    self.lastName = ""
                                }) {
                                    Group {
                                        Text("Create User")
                                            .foregroundColor(.white)
                                            .padding(12)
                                    }
                                    .background(isInfoFilled ? Color.blue : Color.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .shadow(radius: 5)
                                }.disabled(isInfoFilled ? false : true)
                                Button(action: {
                                    self.users = []
                                    self.firstName = ""
                                    self.lastName = ""
                                }) {
                                    Group {
                                        Text("Delete Users")
                                            .foregroundColor(.white)
                                            .padding(12)
                                    }
                                    .background(users.count > 0 ? Color.red : Color.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .shadow(radius: 5)
                                }.disabled(users.count > 0 ? false : true)
                            }
                        }
                    }.padding(12)
                }.background(Color.gray)
                List(users, id: \.self) {
                    Text($0)
                }
            }
            .navigationBarTitle("Credit Card Form")
            .navigationBarItems(leading:
                VStack(alignment: .leading) {
                    Text("Application State").font(.headline)
                    HStack {
                        Text("First Name:")
                        Text(firstName).foregroundColor(.red)
                        Text("Last Name:")
                        Text(lastName).foregroundColor(.red)
                    }
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
