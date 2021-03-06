//
//  MovieController.swift
//  Movie List
//
//  Created by Samantha Gatt on 7/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    var movies: [Movie] = []
    
    // Function to add a movie
    func addMovie(title: String, isSeen: Bool) {
        let movie = Movie(title: title, isSeen: isSeen)
        movies.append(movie)
        
        // Stores the alphabetical version of the array
        let alphabeticalMovies = movies.sorted { $0.title < $1.title }
        // Reassigns movies to be alphabetical
        movies = alphabeticalMovies
    }
    
    // Function to delete a movie
    func deleteMovie(movie: Movie) {
        
        guard let movieIndex = movies.index(of: movie) else { return }
        
        movies.remove(at: movieIndex)
    }
    
    // Function to change the value for isSeen attribute of an instance of Movie
    func toggleIsSeen(forMovie: Movie) {
        
        // forMovie is a let constant since Movie model is a struct
        var movie = forMovie
        movie.isSeen = !movie.isSeen
        
        // Now I have to replace forMovie in movies array with movie
        if let indexOfForMovie = movies.index(of: forMovie) {
            movies[indexOfForMovie] = movie
        }
    }
}
