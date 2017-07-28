//
//  DiffViewController.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class DiffViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseID  = "diffReuseID"
    var viewModelDiff = DiffViewModel()
    
    func setupDelegate(){
        
        tableView.delegate = self
        tableView.dataSource = self
        viewModelDiff.gitDiffProtocol = self
        
    }
    func registerDiffCell(){
        
        let nib = UINib(nibName: "DifflTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseID)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        registerDiffCell()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DiffViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDiff.gitDiffData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let diffCell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as?
        DiffTableViewCell
        
        diffCell?.txtViewDiff.text = viewModelDiff.gitDiffData[indexPath.row].patch
        
        if let diffCell = diffCell{
            return diffCell
        }
        else
        {
            return UITableViewCell()
        }
        
    }
    
    
}
extension DiffViewController: GitDiffProtocol{
    
    func didReceiveDiffData(data: [Diff]) {
        
        tableView.reloadData()
        
    }
    
    
}

