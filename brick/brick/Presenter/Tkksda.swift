//
//  Tkksda.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let tokenAddress, tokenID, ownerOf, blockNumber: String
    let blockNumberMinted, tokenHash, amount, contractType: String
    let name, symbol, tokenURI, metadata: String
    let lastTokenURISync, lastMetadataSync: String

    enum CodingKeys: String, CodingKey {
        case tokenAddress = "token_address"
        case tokenID = "token_id"
        case ownerOf = "owner_of"
        case blockNumber = "block_number"
        case blockNumberMinted = "block_number_minted"
        case tokenHash = "token_hash"
        case amount
        case contractType = "contract_type"
        case name, symbol
        case tokenURI = "token_uri"
        case metadata
        case lastTokenURISync = "last_token_uri_sync"
        case lastMetadataSync = "last_metadata_sync"
    }
}
