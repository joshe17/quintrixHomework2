//
//  ContentView.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserPostViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: {
                            UserPostsCell(user: user)
                                .navigationBarTitle("", displayMode: .inline)
                        }, label:  {
                            UserCell(user: user)
                                .foregroundColor(.white)
                                .background(LinearGradient(colors: [.indigo, .pink, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.7))
                                .cornerRadius(15)
                                .padding(.vertical, 7)

                        })
                    }
                }
                .navigationTitle("User Posts")
                .padding()
            }
        }
        .onAppear {
            viewModel.getUserPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
