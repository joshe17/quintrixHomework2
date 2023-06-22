//
//  UserPostsCell.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import SwiftUI

struct UserPostsCell: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading)  {
            Text("\(user.id)'s Posts")
                .font(.largeTitle).bold()
            ScrollView(showsIndicators: false) {
                ForEach(user.posts) { post in
                    VStack(alignment: .leading) {
                        Text("Post #\(post.id)")
                            .font(.title).bold()
                            .foregroundColor(.white)
                            .padding()
                        Text(post.title)
                            .font(.title)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        VStack {
                            Text(post.body)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(15)
                        .padding()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [.indigo, .pink, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.7))
                    .cornerRadius(15)
                    .padding(.vertical, 5)
                }
            }
        }
        .padding()

    }
}

struct UserPostsCell_Previews: PreviewProvider {
    static var previews: some View {
        UserPostsCell(user: User(id: 1, posts: [UserPost(id: 1, userId: 1, title: "hi", body: "mom"), UserPost(id: 2, userId: 1, title: "bye", body: "dad")]))
    }
}
