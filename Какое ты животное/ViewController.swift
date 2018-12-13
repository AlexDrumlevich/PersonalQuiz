//
//  ViewController.swift
//  Какое ты животное
//
//  Created by Друмлевич on 05.12.2018.
//  Copyright © 2018 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageFirst: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }
    @IBAction func unwind(sender: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

