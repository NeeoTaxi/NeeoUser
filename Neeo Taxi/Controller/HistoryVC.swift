//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class HistoryVC: BaseVC {

    @IBOutlet weak var tableV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completedBtn(_ sender: Any) {
    }
    
    @IBAction func futureBtn(_ sender: Any) {
    }

}
extension HistoryVC: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.monthLabel.visibility = .visible
        } else {
            cell.monthLabel.visibility = .gone
        }
        
        return cell
    }
}
