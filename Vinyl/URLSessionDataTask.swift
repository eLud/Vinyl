//
//  URLSessionDataTask.swift
//  Vinyl
//
//  Created by Rui Peres on 16/02/2016.
//  Copyright © 2016 Velhotes. All rights reserved.
//

import Foundation

public class URLSessionDataTask: Foundation.URLSessionDataTask, URLSessionTaskType {
    
    fileprivate let completion: () -> Void
    
    required init(completion: @escaping () -> Void) {
        self.completion = completion
    }
    
   public override func resume() {
        completion()
    }
    
   public override func suspend() {
        // We won't do anything here
    }
    
   public override func cancel() {
        // We won't do anything here
    }

    public override var countOfBytesReceived: Int64 {
        guard super.responds(to: #selector(getter: super.countOfBytesReceived)) else {
            return 0
        }
        return super.countOfBytesReceived
    }

    public override var countOfBytesSent: Int64 {
        guard super.responds(to: #selector(getter: super.countOfBytesSent)) else {
            return 0
        }
        return super.countOfBytesSent
    }
}
