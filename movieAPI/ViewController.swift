//
//  ViewController.swift
//  movieAPI
//
//  Created by JOHN GARIEPY on 1/14/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getMovie(){
        let session = URLSession.shared
        
        let movieURL = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=c24bdcdf")!
        
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            
            if let e = error{
                
                print("ERROR!! \(e)")
                
            }
            
            else{
                
                if let d = data{
                    
                    // Getting Json object from api
                    
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary{
                        
                        print(jsonObj)
                        
                        if let mainDictionary = jsonObj.value(forKey: "main") as? NSDictionary{
                            
                            print(mainDictionary)
                            
                            if let theMovie = mainDictionary.value(forKey: "movie"){
                                
                                // Makes it show up on the main thread
                                
                                DispatchQueue.main.async{
                                    
                                    self.textView.text = "\(theMovie)"
                                    
                                }
                                
                                
                                
                                
                                
                            }
                            
                            if let movieDictionary = jsonObj.value(forKey: "sys") as? NSDictionary{
                                
                                print(movieDictionary)
                                
                                if let relase = movieDictionary.value(forKey: "release") as? Int{
                                    
                                    let timeInterval2 = TimeInterval(relase)
                                    
                                    let date2 = Date(timeIntervalSince1970: timeInterval2)
                                    
                                    let formatter2 = DateFormatter()
                                    
                                    formatter2.dateStyle = .none
                                    
                                    formatter2.timeStyle = .short
                                    
                                    let formatterDate2 = formatter2.string(from: date2)
                                    
                                    print(formatterDate2)
                                    
                                    self.textView.text = formatterDate2
                                    
                                    
                                    
                                }
                            }
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                else{
                    
                    print("Can not convert to json")
                    
                }
                
            }
            
            
            
        }
        dataTask.resume()
    }
    
    //Making the get process continue
    
   

    }

    

