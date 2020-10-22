//
//  Join.swift
//  tutorial
//
//  Created by Nathan Luu on 10/19/20.
//

import SwiftUI

struct Join: View {
    
    @Binding var isOpen: Bool
    @State var joinCode = ""
    @State var newTitle = ""
    @ObservedObject var viewModel = ChatroomsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Join a chatroom")
                        .font(.title)
                    TextField("Enter your join code", text: $joinCode)
                    Button(action: {
                        viewModel.joinChatroom(code: joinCode, handler: {
                            self.isOpen = false
                        })
                    }, label: {
                        Text("Join")
                    })
                }
                .padding(.bottom)
                
                VStack {
                    Text("Create a chatroom")
                        .font(.title)
                    TextField("Enter a new title", text: $newTitle)
                    Button(action: {
                        viewModel.createChatroom(title: newTitle, handler: {
                            self.isOpen = false
                        })
                    }, label: {
                        Text("Create")
                    })
                }
                .padding(.top)
            }
                .navigationBarTitle("Join or create")
        }
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(isOpen: .constant(true))
    }
}
