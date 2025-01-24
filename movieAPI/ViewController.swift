//
//  ViewController.swift
//  movieAPI
//
//  Created by JOHN GARIEPY on 1/14/25.
//
//hello world

import UIKit

struct Movie: Codable{
    var movies = [Store]
    var Name: String
    
}

struct Store: Codable{
    var Source: String
    var Value: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
            
    @IBAction func buttonAction(_ sender: UIButton) {
        FindMovie().getMovie(name: inputTextField.text!)
        DispatchQueue.main.async{
            print("hi")
            self.textView.text = " \(ViewController().getMovie(name: self.inputTextField.text!)) "

        }
    }
    
    
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
                                
                    //get Movie object with JSONDecoder
                                if let movieObj = try? JSONDecoder().decode(Movie.self, from: data){
                                    print(movieObj.Name)
                                    for r in movieObj.Store{
                                    print("Rating \(r.Source): \(r.Value)")
                                    }
                                    
                                }else{
                                    print("error decoding to movie object")
                                                        }
                                
                    
//                            if let search = jsonObj.value(forKey: "Search") as? [NSDictionary]{
//                                print(search)
//                                DispatchQueue.main.async {
//                                    Movie.movies = search
//                                    print("Search: \(search)")
//                                    
//                                    
//                                }
//                                    
//                                
//                            }
                                
                            }
                                
                            
                            }
                            
                        }
                        
                        
                        
                    }
                }
        
        dataTask.resume()
            }

        }
    
    
    //Making the get process continue
    
   

    

    

