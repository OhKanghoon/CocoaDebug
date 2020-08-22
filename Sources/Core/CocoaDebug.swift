//
//  Example
//  man.li
//
//  Created by man.li on 11/11/2018.
//  Copyright © 2020 man.li. All rights reserved.
//

import Foundation
import UIKit

@objc public class CocoaDebug : NSObject {
    
    ///if the captured URLs contain server URL ,set these URLs bold font to be marked. not mark when this value is nil. default value is `nil`.
    @objc public static var serverURL: String? = nil
    ///set the URLs which should not been captured, ignoring case, crawl all URLs when the value is nil. default value is `nil`.
    @objc public static var ignoredURLs: [String]? = nil
    ///set the URLs which are only been captured, ignoring case, crawl all URLs when the value is nil. default value is `nil`.
    @objc public static var onlyURLs: [String]? = nil
    ///add an additional UIViewController as child controller of CocoaDebug's main UITabBarController. default value is `nil`.
    @objc public static var additionalController: UIViewController? = nil
    ///the maximum count of logs which CocoaDebug display. default value is `1000`.
    @objc public static var logMaxCount: Int = 1000
    ///set the initial recipients to include in the email’s “To” field when share via email. default value is `nil`.
    @objc public static var emailToRecipients: [String]? = nil
    ///set the initial recipients to include in the email’s “Cc” field when share via email. default value is `nil`.
    @objc public static var emailCcRecipients: [String]? = nil
    ///set CocoaDebug's main color with hexadecimal format. default value is `#42d459`.
    @objc public static var mainColor: String = "#42d459"
    ///protobuf url and response class transfer map. default value is `nil`.
    @objc public static var protobufTransferMap: [String: [String]]? = nil
    
    //MARK: - CocoaDebug enable
    @objc public static func enable() {
        initializationMethod(serverURL: serverURL, ignoredURLs: ignoredURLs, onlyURLs: onlyURLs, additionalController: additionalController, emailToRecipients: emailToRecipients, emailCcRecipients: emailCcRecipients, mainColor: mainColor, protobufTransferMap: protobufTransferMap)
    }
    
    //MARK: - CocoaDebug disable
    @objc public static func disable() {
        deinitializationMethod()
    }

    //MARK: - hide Bubble
    @objc public static func hideBubble() {
        CocoaDebugSettings.shared.showBubbleAndWindow = false
    }
    
    //MARK: - show Bubble
    @objc public static func showBubble() {
        CocoaDebugSettings.shared.showBubbleAndWindow = true
    }
}


//MARK: - override Swift `print` method
public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .white) {
    Swift.print(message)
    _LogHelper.shared.handleLog(file: file, function: function, line: line, message: message, color: color)
}
