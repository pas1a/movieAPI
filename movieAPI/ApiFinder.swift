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
        
        
        let movieURL = URL(string: "http://www.omdbapi.com/?t=\(name)&apikey=c24bdcdf")!
        
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            
            if let e = error{
                
                print("ERROR!! \(e)")
                
            }
            
            else{
                
                if let d = data{
                    
                    // Getting Json object from api
                        if let data = data {
                            let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? [String: Any]
                                
                                print(jsonObj)
                                
                                if let jsonObj = jsonObj{
                                if let year = jsonObj["Year"] as? String{
                                    print("Year: \(year)")
                                    DispatchQueue.main.async {
                                        self.cool = "release year: \(year)"
                                        
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
