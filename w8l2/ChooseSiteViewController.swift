//
//  ChooseSiteViewController.swift
//  w8l2
//
//  Created by Default User on 3/6/24.
//

import UIKit

class ChooseSiteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listData = ["Barca", "Real", "Liverpool", "Man Utd", "Man City"]
    var siteData = ["http://www.bluejays.com",
                    "http://www.torontomapleleafs.com",
                    "http://www.torontoraptors.com",
                    "http://www.marlies.ca",
                    "http://www.torontofc.ca"]
    var imgData = ["fc.png",
                   "jays.jpg",
                   "leafs.png",
                   "marlies.jpeg",
                   "raptors.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        let tableCell: SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        let team = listData[rowNum]
        let site = siteData[rowNum]
        let imageName = UIImage(named: imgData[rowNum])
        
        //tableCell.textLabel?.text = team
        tableCell.primaryLabel.text = team
        tableCell.secondaryLabel.text = site
        tableCell.myImageView.image = imageName
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.selectedURL = siteData[indexPath.row]
        
        performSegue(withIdentifier: "ChooseSegueToView", sender: nil)
    }
    
    @IBAction func unwindToChooseVC(sender: UIStoryboardSegue) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
