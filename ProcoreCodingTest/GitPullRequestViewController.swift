//
//  GitPullRequestViewController.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class GitPullRequestViewController: UIViewController {
    
    let reuseID = "gitPullCell"
    var gitPullRequestViewModel:GitPullRequestViewModel = GitPullRequestViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    
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
    
    
    func getPullDataFromGit(){
        
        gitPullRequestViewModel.makeRequestForPulls(success: { gitData in
            if (gitData.count > 1){
                self.gitPullRequestViewModel.gitData = gitData
                self.didReceiveData = true
            }
            else
            {
                self.didReceiveData = false
            }
            
        }) { (error, type) in
            
            if type == ResponsErrorType.apiErrorType{
                print(error)
            }
            else
            {
               print("something went wrong")
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
        
       if  let number = gitPullRequestViewModel.gitData[indexPath.row].number
        {
          fetchDiffs(number:number )
        }
        
    }
    
    func fetchDiffs(number:Int){
        
        var viewModelDiff = DiffViewModel()
        

        
        
        viewModelDiff.makeRequestForDiffs(fileNumber: number, success: { gitdiffData in
            
            print(gitdiffData[0].patch ?? "bad")
            
            if (gitdiffData.count > 0)
            {
                viewModelDiff.gitDiffData = gitdiffData
                var tview:DiffViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiffViewController") as! DiffViewController
                
                
                self.view.addSubview((tview.view)!)
                tview.view.frame.origin.x = 0
                UIView.animate(withDuration: 0.5, animations: {
                    
                    tview.view.frame.origin.x = 300
                    
                }) { valid in
                    
                }
            }
            
        }) { (error, type) in
            
            if type == ResponsErrorType.apiErrorType{
                print(error)
            }
            else
            {
                print("something went wrong")
            }
            
        }
    }
    
    
}
