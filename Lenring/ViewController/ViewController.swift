//
//  ViewController.swift
//  Lenring
//
//  Created by Huy on 5/10/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Dataservice.shared.isAvtive = false
    }
    

}

