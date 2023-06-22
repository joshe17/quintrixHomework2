//
//  UserPostService.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import Foundation
import Combine

//https://jsonplaceholder.typicode.com/posts

class UserPostService {
    var cancellable = Set<AnyCancellable>()
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPosts() -> Future<[UserPost], Error> {
        return Future {[weak self] promise in
            guard let self = self else { return }
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [UserPost].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink {completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: { response in
                    promise(.success(response))
                }
                    .store(in: &self.cancellable)
        }
        
    }
}
