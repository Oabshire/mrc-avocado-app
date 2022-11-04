//
//  NetworkReachability.swift
//  MCRAvocado
//
//  Created by Onie on 03.11.2022.
//

import Foundation
import Network

final class NetworkReachability: ObservableObject {
	public let queue = DispatchQueue(label: "NetworkMonitor")
	public let monitor = NWPathMonitor()

	@Published private(set) var isConnected: Bool

	init() {
		self.isConnected = true
		monitor.start(queue: queue)
		monitor.pathUpdateHandler = { path in
			if path.status == .satisfied {
				OperationQueue.main.addOperation {
					self.isConnected = true
				}
			} else {
				OperationQueue.main.addOperation {
					self.isConnected = false
				}
			}
		}
	}
}
