//
//  ApiFinder.swift
//  movieAPI
//
//  Created by JOHN GARIEPY on 1/17/25.
//

import Foundation



class FindMovie{
    
    var cool: String = ""

    
    func getMovie(name:String){
        
//      var movieName = "Cars"
        let session = URLSession.shared
        
        
        let movieURL = URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=c24bdcdf")!
        
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            
            if let e = error{
                
                print("ERROR!! \(e)")
                
            }
            
            else{
                
                if let d = data{
                    
                    // Getting Json object from api
                        if let data = data {
                            if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary{
                                
                                print(jsonObj)
                                
                    
                            if let search = jsonObj.value(forKey: "Search") as? [NSDictionary]{
                                print(search)
                                DispatchQueue.main.async {
                                    Movie.movies = search
                                    self.cool = "\(Movie.movies)"
                                    print("Search: \(search)")
                                    
                                    
                                }
                                    
                                
                            }
                                
                            }
                                
                            
                            }
                            
                        }
                        
                        
                        
                    }
                }
        
        dataTask.resume()
            }
}
