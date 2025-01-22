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
    
    
            
    @IBAction func buttonAction(_ sender: UIButton) {
        FindMovie().getMovie(name: inputTextField.text!)
        DispatchQueue.main.async{
            print("hi")
            self.textView.text = "\(FindMovie().cool)"

        }
    }
    

        }
    
    
    //Making the get process continue
    
   

    

    

