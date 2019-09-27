//
//  ViewController.swift
//  PageViewController2
//
//  Created by aluno on 13/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func actionContiune(_ sender: Any) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.nextPageWithIndex(index: 1)
        pageViewController.pageControl.currentPage = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

