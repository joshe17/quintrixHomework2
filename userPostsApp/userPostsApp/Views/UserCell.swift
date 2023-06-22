//
//  UserCell.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(user.id)")
                    .font(.system(size: 70)).bold()
                    .padding(.bottom, 10)
                Text("Most Recent Post:")
                    .font(.system(size: 16)).bold()
                VStack {
                    Text(user.posts[0].title)
                        .font(.title)
                        .padding(.horizontal)
                    Text(user.posts[0].body)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding()
                HStack {
                    Spacer()
                    Text("See all posts from user \(user.id)")
                        .font(.system(size: 16)).bold()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)

    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
