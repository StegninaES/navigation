//
//  PostBuilder.swift
//  Navigation
//
//  Created by Стегнина Елена on 15.12.2022.
//

import Foundation

class PostBuilder {
    
    static func createPosts() -> [Post] {
        var posts: [Post] = []
       let post1 = Post(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", author: "Author1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: "Image 1", likes: 3, views: 3)
       let post2 = Post(title: "Post2", author: "Author2", description: "Description2", image: "Image 2", likes: 3, views: 3)
       let post3 = Post(title: "Post3", author: "Author3", description: "Description3", image: "Image 3", likes: 3, views: 3)
       let post4 = Post(title: "Post4", author: "Author4", description: "Description4", image: "Image 4", likes: 3, views: 3)
       posts.insert(post1, at: 0)
       posts.insert(post2, at: 1)
       posts.insert(post3, at: 2)
       posts.insert(post4, at: 3)
        
        return posts
   }

}

 
