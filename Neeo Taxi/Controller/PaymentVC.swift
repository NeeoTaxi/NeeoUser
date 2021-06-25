//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.

import UIKit

class PaymentVC: BaseVC {
    
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var paymentLabel: UILabel!
    var selected = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFundBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
extension PaymentVC: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
        
        cell.selectionStyle = .none
        cell.loadData(image: UIImage(named: "money\(indexPath.row)"), text: "**** **** **** 3947", index: indexPath.row, selected: selected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        self.tableV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
