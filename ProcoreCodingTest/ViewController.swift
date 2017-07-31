//
//  ViewController.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/26/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView(){
        
        btnEnter.layer.borderWidth = 1
        btnEnter.layer.cornerRadius = btnEnter.frame.height / 2
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        activityIndicator.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicator.stopAnimating()
    }

}

