//
//  GitPullRequestViewModel.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation




struct GitPullRequestViewModel{
    
    var gitData:[GitPullModel] = []
  
     
    
    mutating func makeRequestForPulls(success:@escaping ((_ gitData:[GitPullModel])->Void), fail:@escaping (_ error:Error,_ errorType:ResponsErrorType)->Void){
        
        let gitPullDataService = GitPullDataService()
        
        gitPullDataService.fetchPullDataFromGitHubWithURL(success: { gitData in
            
                success(gitData)
            
        }) { (error, respType) in
            
            fail(error,ResponsErrorType.apiErrorType)
        }
        
    }
    
    
}
