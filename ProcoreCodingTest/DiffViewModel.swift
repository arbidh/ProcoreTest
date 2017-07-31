//
//  DiffViewModel.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation
import UIKit
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
    
   /**
     makes Request For Diff Files by FileNumber
    */
    mutating func makeRequestForDiffs( fileNumber num: Int, success:@escaping ((_ gitDiffData:[Diff])->Void), fail:@escaping (_ error:Error,_ errorType:ResponsErrorType)->Void){
        let gitPullDataService = GitPullDataService()
        
        DispatchQueue.global().async {
            
        
        gitPullDataService.fetchDiffDataFromGitHubWithURL(fileNumber: num, success: { gitDiffData in
            
            DispatchQueue.main.async {
                
            success(gitDiffData)
            }
            
        }) { (error, respType) in
            if let error = error{
            fail(error,ResponsErrorType.apiErrorType)
            }
        }
      }
    }
    /**
     Uses regexPattern to determine which strings to highlight
     Negative highlights strings starting with /n-
     Positive highlights string starting with /n+
    */
    func getModifiedStringFromRegex(diffText:String, patternType:regExPattern, color:UIColor) -> NSMutableAttributedString
    {
        
        
        let attributedString = NSMutableAttributedString(string:diffText)
        var pattern = ""
        
        if patternType == .negativePattern{
            pattern = regExPattern.negativePattern.rawValue
        }
        else{
            pattern = regExPattern.positivePattern.rawValue
        }
        let newrange =  matchRegEx(pattern: pattern, inputString: diffText)
        for val in newrange{
            
            attributedString.addAttributes([NSBackgroundColorAttributeName: color], range:val)
        }
        return attributedString
    }
    /**
     matches regex patterns returns array of ranges that match the pattern
     */
    
    func matchRegEx(pattern:String, inputString:String)-> [NSRange]{
        var listOfRanges:[NSRange] = []
        do{
            let regEx = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            
            let matches = regEx.matches(in: inputString, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, inputString.utf16.count))
            let count = 0
            for val in matches as [NSTextCheckingResult]{
                if count < matches.count{
                    let index = matches.index(matches.startIndex, offsetBy: matches.index(count, offsetBy: count))
                    
                    listOfRanges.append(val.rangeAt(index))
                    
                }
                
            }
            return listOfRanges
        }catch{
            
        }
        return [NSMakeRange(0, 0)]
    }
    
    /**
     Description: Gets the ranges of the pages from string
    */
    func getCountsFromString(inString:String) ->(String,String){
        let input = inString.components(separatedBy: "@@")[1].components(separatedBy: "+")
        let negativeCount = input.first?.components(separatedBy: ",").first
        let positiveCount = input[1].components(separatedBy: ",").first
        
        if let negativeCount = negativeCount , let positiveCount = positiveCount{
            return (negativeCount,positiveCount)
        }
        
        return ("","")
        
    }
    
}
