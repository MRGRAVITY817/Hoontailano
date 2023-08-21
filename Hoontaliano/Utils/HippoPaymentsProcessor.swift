//
//  HippoPaymentsProcessor.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

class HippoPaymentsProcessor {
    init(apiKey: String) {}
    
    func processPayment(
        payload: [String : Any],
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (HippoPaymentsError) -> Void
    ) {}
}

struct HippoPaymentsError: Error {}
