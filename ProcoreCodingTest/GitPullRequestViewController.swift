//
//  GitPullRequestViewController.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class GitPullRequestViewController: UIViewController {
    
    let reuseID = "gitPullCell"
    var gitPullRequestViewModel:GitPullRequestViewModel = GitPullRequestViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    var indexOfSelected:Int = 0
    var fileNumber = 0
    
    
    var didReceiveData:Bool?{
        
        didSet{
            
            tableView.reloadData()
        }
        
    }
    func setupDelegate(){
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func registerGitPullCell(){
        
        let nib = UINib(nibName: "GitPullTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseID)
    }
    
    @IBAction func startDiff(_ sender: UIBarButtonItem) {
       self.dismiss(animated: true, completion: nil)
        
    }
    
    func getPullDataFromGit(){
         SwiftSpinner.show("LOADING")
        
        gitPullRequestViewModel.makeRequestForPulls(success: { gitData in
            if (gitData.count > 1){
                self.gitPullRequestViewModel.gitData = gitData
                self.didReceiveData = true
                SwiftSpinner.hide()
            }
            else
            {
                self.didReceiveData = false
            }
            
        }) { (error, type) in
            
            if type == ResponsErrorType.apiErrorType{
                SwiftSpinner.show(error as! String).addTapHandler({
                    SwiftSpinner.hide()
                })
                
            }
            else
            {
                SwiftSpinner.show("Something went wrong").addTapHandler({
                    SwiftSpinner.hide()
                })

            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getPullDataFromGit()
        setupDelegate()
        registerGitPullCell()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension GitPullRequestViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitPullRequestViewModel.gitData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gitPullCell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? GitPullTableViewCell
        
        gitPullCell?.pullReqTitleLabel.text = gitPullRequestViewModel.gitData[indexPath.row].title
        gitPullCell?.dateOpenedByOwnerLabel.text = gitPullRequestViewModel.gitData[indexPath.row].user?.login
        if let gitPullCell = gitPullCell{
            return gitPullCell
        }
        return UITableViewCell()

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        indexOfSelected = indexPath.row
        if let fileNumber =  gitPullRequestViewModel.gitData[indexOfSelected].number{
            self.fileNumber = fileNumber
        }
        self.performSegue(withIdentifier: "segueDiff", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let diffViewController = segue.destination as? DiffViewController
        
        diffViewController?.fileNumber = self.fileNumber
        
        diffViewController?.viewModelDiff.gitDiffProtocol = diffViewController
    }
    
    
}
