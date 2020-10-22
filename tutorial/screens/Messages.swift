//
//  Messages.swift
//  tutorial
//
//  Created by Nathan Luu on 10/19/20.
//

import SwiftUI

struct Messages: View {
    
    let chatroom: Chatroom
    @ObservedObject var viewModel = MessagesViewModel()
    @State var messageField = ""
    
    
    init(chatroom: Chatroom) {
        self.chatroom = chatroom
        viewModel.fetchData(docId: chatroom.id)
    }
    
    var body: some View {
        VStack {
            List(viewModel.messages) { message in
                HStack {
                    Text(message.content)
                    Spacer()
                }
            }
            HStack {
                TextField("Enter message...", text: $messageField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.sendMessage(messageContent: messageField, docId: chatroom.id)
                }, label: {
                    Text("Send")
                })
            }
        }
            .navigationBarTitle(chatroom.title)
    }
}

struct Messages_Previews: PreviewProvider {
    
    static var previews: some View {
        Messages(chatroom: Chatroom(id: "10101", title: "Hello!", joinCode: 10))
    }
}
