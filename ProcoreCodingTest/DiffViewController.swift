//
//  DiffViewController.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit


enum regExPattern:String{
    
    case negativePattern = "[a-zA-Z 0-9\\s](-\\s\\W[^\\d])[a-zA-Z 0-9]([^\\+]).{1,85}"
    case positivePattern = "(\\n)(\\+)[^(\\n)(-)]+(\\s\\W\\D)*.{1,30}"
    
}

//This View Controllser is for getting all the diffs for a pull requests
//It also uses regex to highlight the diffs for - and +
//It also populates the line numbers( I populated all the linenumbers starting from 1 instead of the lines actually for pull request. I didn't have time to finish that part)


class DiffViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var rightTableView: UITableView!
    
    let reuseID  = "diffReuseID"
    let rightReuseID = "diffReuseIDRight"
    var viewModelDiff = DiffViewModel()
    var fileNumber = 0
    /**
     Goes through the characters and adds line numbers
     and offsets the y
     
    */
    
    func populateLineNumbers(inputString:String,typeOfCell:UITableViewCell)->UITableViewCell{
    
        let newchar = inputString.characters
   
        
        var count = 0
        var yvalue:CGFloat = 0
        var xvalue:CGFloat = 0
        
       var cell:UITableViewCell?
        
        for _ in newchar
        {
            //get the range from start to
            count += 1
            let label = UILabel()
            label.textColor = UIColor.black
            label.textAlignment = NSTextAlignment.center
            label.font = UIFont(name: "HelveticaNeue", size: 8)
          
            
            if typeOfCell is DiffTableViewCell{
            
               if let diffLeftCell = typeOfCell as? DiffTableViewCell
               {
                    yvalue = diffLeftCell.LineNumberBar.frame.origin.y + CGFloat(count) * 11
                    xvalue = diffLeftCell.LineNumberBar.frame.origin.x - 3
                    label.frame = CGRect(x: xvalue , y: yvalue, width: 29, height: 27)
                    label.text = "\(count)"
                    diffLeftCell.LineNumberBar.addSubview(label)
                    cell = diffLeftCell
                }
            }
            else{
                
                    if let diffRightCell = typeOfCell as? DiffRightTableViewCell{
                        yvalue = diffRightCell.lineNumberView.frame.origin.y + CGFloat(count) * 11
                        xvalue = diffRightCell.lineNumberView.frame.origin.x - 3
                        label.frame = CGRect(x: xvalue , y: yvalue, width: 29, height: 27)
                        label.text = "\(count)"
                        diffRightCell.lineNumberView.addSubview(label)
                        cell = diffRightCell
                }
            }
            
        }
        if let cell = cell{
            return cell
        }
        return UITableViewCell()
        
    }
    
    func setupDelegate(){
        
        tableView.delegate = self
        tableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.dataSource = self
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableViewAutomaticDimension
        rightTableView.estimatedRowHeight = 1000
        rightTableView.rowHeight = UITableViewAutomaticDimension
        viewModelDiff.gitDiffProtocol = self
        
    }
    func registerDiffCell(){
        
        let nib = UINib(nibName: "DiffTableViewCell", bundle: nil)
        let nib_right = UINib(nibName: "DiffRightTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseID)
        rightTableView.register(nib_right, forCellReuseIdentifier: rightReuseID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDiffs(number: self.fileNumber)
        
    }

    /**
       calls viewModel to fetch the diffs
     
    */
    func fetchDiffs(number:Int){
        SwiftSpinner.show("LOADING")
        DispatchQueue.global().async {[weak self] in
        self?.viewModelDiff.makeRequestForDiffs(fileNumber: number, success: {[weak self] gitdiffData in
            SwiftSpinner.hide()
            if (gitdiffData.count > 0)
            {
                self?.viewModelDiff.gitDiffData = gitdiffData
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDiffCell()
        setupDelegate()
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .beginFromCurrentState, animations: {
            
            self.view.center.x -= 500
            
        }) { valid in
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension DiffViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModelDiff.gitDiffData.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == self.tableView{
            return String(fileNumber)
        }
        if tableView == self.rightTableView{
            return ""
        }
        return ""
    }
    
    
    

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let diffText = viewModelDiff.gitDiffData[indexPath.row].patch else{
        return UITableViewCell()
    }
    
    
    //we are checking which tableView we are dealing with
    if self.tableView == tableView{
        if let diffCell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as?
            DiffTableViewCell{
            let redColor = UIColor(red: 1.00, green: 0.93, blue: 0.94, alpha: 1.0)
            diffCell.txtViewDiff.attributedText = viewModelDiff.getModifiedStringFromRegex(diffText: diffText, patternType: .negativePattern, color:redColor)
            
            return  populateLineNumbers(inputString: diffText, typeOfCell: diffCell)
            
        }
    } else{
        if let diffRightCell =   rightTableView.dequeueReusableCell(withIdentifier: rightReuseID, for: indexPath) as? DiffRightTableViewCell{
            let yellowColor = UIColor(red:0.90, green:1.00, blue:0.93, alpha:1.0)
            diffRightCell.label.attributedText = viewModelDiff.getModifiedStringFromRegex(diffText: diffText, patternType: .positivePattern, color: yellowColor)
            return  populateLineNumbers(inputString: diffText, typeOfCell: diffRightCell)
            
        }
    }
    return UITableViewCell()
 
  }
}
extension DiffViewController:UIScrollViewDelegate{
    
    /**
      allow scrolling to happen on both TableViews simultaeously
     
    */
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
    
        if (scrollView == self.tableView) {
            self.rightTableView.contentOffset = scrollView.contentOffset;
        } else {
            self.tableView.contentOffset = scrollView.contentOffset
        }
    }
    
    
}
extension DiffViewController: GitDiffProtocol{
    
    func didReceiveDiffData(data: [Diff]) {
        
        tableView.reloadData()
        rightTableView.reloadData()
    }
    
}

