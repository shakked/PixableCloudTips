//
//  Dispatch.swift
//  Pixable
//
//  Created by pixable on 6/2/15.
//
//

import Foundation

func dispatch_after(delay: NSTimeInterval, queue: dispatch_queue_t = dispatch_get_main_queue(), block: dispatch_block_t) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        queue, block)
}