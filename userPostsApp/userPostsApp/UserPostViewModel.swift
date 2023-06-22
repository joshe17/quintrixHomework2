//
//  UserPostViewModel.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import Foundation
import Combine

struct User: Identifiable {
    let id: Int
    let posts: [UserPost]
}

class UserPostViewModel: ObservableObject {
    var userPosts: [UserPost] = []
    @Published var users: [User] = []
    var cancellables = Set<AnyCancellable>()
    
    let service = UserPostService()
    
    func getUserPosts() {
        service.fetchPosts()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            } receiveValue: { [weak self] userPost in
                DispatchQueue.main.async {
                    self?.userPosts = userPost
                    self?.sortPostsByUser()
                }
            }
            .store(in: &cancellables)
    }

    func sortPostsByUser() {
        var currId = 1
        var postsArr: [UserPost] = []
        
        if self.userPosts.isEmpty {
            return
        }
        else {
            for post in self.userPosts {
                if post.userId == currId {
                    postsArr.append(post)
                }
                else {
                    self.users.append(User(id: currId, posts: postsArr ))
                    currId = post.userId
                    postsArr = []
                    postsArr.append(post)
                }
            }
        }
    }
}
