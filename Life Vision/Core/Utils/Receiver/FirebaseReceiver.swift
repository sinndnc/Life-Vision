//
//  FirebaseReceiver.swift
//  Life Vision
//
//  Created by Sinan Dinç on 11.06.2024.
//

import Foundation
import Combine
import FirebaseFirestore

struct FirestoreSnapshotPublisher<T: Decodable>: Publisher {
    typealias Output = [T]
    typealias Failure = Error
    
    private let query: Query

    init(query: Query) {
        self.query = query
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, FirestoreSnapshotPublisher.Failure == S.Failure, FirestoreSnapshotPublisher.Output == S.Input {
        let subscription = FirestoreSnapshotSubscription(subscriber: subscriber, query: query)
        subscriber.receive(subscription: subscription)
    }
}

final class FirestoreSnapshotSubscription<S: Subscriber, T: Decodable>: Subscription where S.Input == [T], S.Failure == Error {
    private var subscriber: S?
    private var listenerRegistration: ListenerRegistration?
    
    init(subscriber: S, query: Query) {
        self.subscriber = subscriber
        
        listenerRegistration = query.addSnapshotListener { [weak self] snapshot, error in
            if let error = error {
                self?.subscriber?.receive(completion: .failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                self?.subscriber?.receive(completion: .finished)
                return
            }
            
            do {
                let items = try documents.map { try $0.data(as: T.self) }
                _ = self?.subscriber?.receive(items)
            } catch {
                self?.subscriber?.receive(completion: .failure(error))
            }
        }
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        listenerRegistration?.remove()
        listenerRegistration = nil
        subscriber = nil
    }
}
