//
//  Logger.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import os.log

public class Logger {
    
    private init() {}
    
    public static var osLog: OSLog = OSLog.default
    
    public static func info(message: String, osLog: OSLog = osLog) {
        doLog(message: message, osLog: osLog, logType: .info)
    }
    
    public static func debug(message: String, osLog: OSLog = osLog) {
        doLog(message: message, osLog: osLog, logType: .debug)
    }
    
    public static func error(message: String, osLog: OSLog = osLog) {
        doLog(message: message, osLog: osLog, logType: .error)
    }
    
    public static func fault(message: String, osLog: OSLog = osLog) {
        doLog(message: message, osLog: osLog, logType: .fault)
    }
    
    public static func `default`(message: String, osLog: OSLog = osLog) {
        doLog(message: message, osLog: osLog)
    }
    
    private static func doLog(message: String, osLog: OSLog, logType: OSLogType = .default) {
        os_log("[%@] %@", log: osLog, type: logType, String(describing: logType), message)
    }
}
