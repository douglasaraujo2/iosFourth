//
//  Movie.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 04/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var rating: Double
    var sumary: String
    var duration: String
    var imageName: String
    var categories: [String] = []
    var imageSmall: String { return imageName + "-small.jpg"}
    var imageWide: String { return imageName + "-wide.jpg"}
    var categoriesDescription : String {
        return categories.reduce("",{"\($0) | \($1)"})
    }
    
    
    init(title:String, rating:Double,sumary:String, duration:String,imageName:String) {
        self.title = title
        self.rating = rating
        self.sumary = sumary
        self.duration = duration
        self.imageName = imageName
    }
}
