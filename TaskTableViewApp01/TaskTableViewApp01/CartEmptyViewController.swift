//
//  CartEmptyViewController.swift
//  TaskTableViewApp01
//
//  Created by 福島悠樹 on 2020/06/09.
//  Copyright © 2020 福島悠樹. All rights reserved.
//

import UIKit

class CartEmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tappedReturnBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
