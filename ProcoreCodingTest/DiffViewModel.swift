//
//  DiffViewModel.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation
protocol GitDiffProtocol:class{
    
    func didReceiveDiffData(data:[Diff])
    
}


struct DiffViewModel{
    var gitDiffData: [Diff] = []{
        didSet{
            gitDiffProtocol?.didReceiveDiffData(data: self.gitDiffData)
        }
    }
    weak var gitDiffProtocol:GitDiffProtocol?
    
  
    
    mutating func makeRequestForDiffs( fileNumber num: Int, success:@escaping ((_ gitDiffData:[Diff])->Void), fail:@escaping (_ error:Error,_ errorType:ResponsErrorType)->Void){
        
        let gitPullDataService = GitPullDataService()
        
        gitPullDataService.fetchDiffDataFromGitHubWithURL(fileNumber: num, success: { gitDiffData in
            
            success(gitDiffData)
            
        }) { (error, respType) in
            
            fail(error,ResponsErrorType.apiErrorType)
        }
        
    }
    
    
    
}
