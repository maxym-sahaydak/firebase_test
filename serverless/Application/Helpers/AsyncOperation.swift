//
//  AsyncOperation.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

open class AsyncOperation: Operation {

    //MARK: - Private

    private let queue = DispatchQueue(label: "com.serverless.async.queu", attributes: .concurrent)
    private var rawState = OperationState.ready
    @objc private dynamic var state: OperationState {
        set {
            willChangeValue(forKey: "state")
            queue.sync(flags: .barrier, execute: {rawState = newValue})
            didChangeValue(forKey: "state")
        }
        get {
            return queue.sync(execute: {rawState})
        }
    }

    public final override var isAsynchronous: Bool {
        return true
    }

    public final override var isExecuting: Bool {
        return state == .executing
    }

    public final override var isFinished: Bool {
        return state == .finished
    }

    public final override var isReady: Bool {
        return  state == .ready && super.isReady
    }
    @objc fileprivate(set) var isFailed: Bool = false
    //MARK: - Public

    public final override func start() {
        super.start()
        if isCancelled {
            finish()
            return
        }

        state = .executing
        execute()
    }

    open func execute() {
        fatalError("should be overridden in subclass")
    }

    @objc final func finish(withIsFailed failed: Bool = false) {
        isFailed = failed
        state = .finished
    }

    @objc private enum OperationState: Int {
        case ready
        case executing
        case finished
    }


}
