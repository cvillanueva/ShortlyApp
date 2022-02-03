// MARK: - Mocks generated from file: ShortlyApp/Data/DataSource/GetShortLinkRemoteDataSource.swift at 2022-02-03 19:31:49 +0000

//
//  GetShortLinkRemoteDataSource.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockGetShortLinkRemoteDataSource: GetShortLinkRemoteDataSource, Cuckoo.ProtocolMock {
    
     typealias MocksType = GetShortLinkRemoteDataSource
    
     typealias Stubbing = __StubbingProxy_GetShortLinkRemoteDataSource
     typealias Verification = __VerificationProxy_GetShortLinkRemoteDataSource

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GetShortLinkRemoteDataSource?

     func enableDefaultImplementation(_ stub: GetShortLinkRemoteDataSource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getShortLink(originalLink: String, onCompletion: @escaping (ApiShortenResponse) -> Void)  {
        
    return cuckoo_manager.call("getShortLink(originalLink: String, onCompletion: @escaping (ApiShortenResponse) -> Void)",
            parameters: (originalLink, onCompletion),
            escapingParameters: (originalLink, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getShortLink(originalLink: originalLink, onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_GetShortLinkRemoteDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getShortLink<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(originalLink: M1, onCompletion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (ApiShortenResponse) -> Void)> where M1.MatchedType == String, M2.MatchedType == (ApiShortenResponse) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (ApiShortenResponse) -> Void)>] = [wrap(matchable: originalLink) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetShortLinkRemoteDataSource.self, method: "getShortLink(originalLink: String, onCompletion: @escaping (ApiShortenResponse) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetShortLinkRemoteDataSource: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getShortLink<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(originalLink: M1, onCompletion: M2) -> Cuckoo.__DoNotUse<(String, (ApiShortenResponse) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (ApiShortenResponse) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (ApiShortenResponse) -> Void)>] = [wrap(matchable: originalLink) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return cuckoo_manager.verify("getShortLink(originalLink: String, onCompletion: @escaping (ApiShortenResponse) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetShortLinkRemoteDataSourceStub: GetShortLinkRemoteDataSource {
    

    

    
     func getShortLink(originalLink: String, onCompletion: @escaping (ApiShortenResponse) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/DataSource/LinkLocalDataSource.swift at 2022-02-03 19:31:49 +0000

//
//  LinkLocalDataSource.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockLinkLocalDataSource: LinkLocalDataSource, Cuckoo.ProtocolMock {
    
     typealias MocksType = LinkLocalDataSource
    
     typealias Stubbing = __StubbingProxy_LinkLocalDataSource
     typealias Verification = __VerificationProxy_LinkLocalDataSource

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LinkLocalDataSource?

     func enableDefaultImplementation(_ stub: LinkLocalDataSource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        
    return cuckoo_manager.call("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool",
            parameters: (linkHistory),
            escapingParameters: (linkHistory),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.saveLinkHistory(linkHistory: linkHistory))
        
    }
    
    
    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)  {
        
    return cuckoo_manager.call("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)",
            parameters: (onCompletion),
            escapingParameters: (onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getLinkHistory(onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_LinkLocalDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.ProtocolStubFunction<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLinkLocalDataSource.self, method: "saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(([HistoricalLinkEntity]) -> Void)> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLinkLocalDataSource.self, method: "getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LinkLocalDataSource: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.__DoNotUse<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return cuckoo_manager.verify("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.__DoNotUse<(([HistoricalLinkEntity]) -> Void), Void> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return cuckoo_manager.verify("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LinkLocalDataSourceStub: LinkLocalDataSource {
    

    

    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Manager/CacheManager.swift at 2022-02-03 19:31:49 +0000

//
//  CacheManager.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockCacheManager: CacheManager, Cuckoo.ProtocolMock {
    
     typealias MocksType = CacheManager
    
     typealias Stubbing = __StubbingProxy_CacheManager
     typealias Verification = __VerificationProxy_CacheManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CacheManager?

     func enableDefaultImplementation(_ stub: CacheManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        
    return cuckoo_manager.call("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool",
            parameters: (linkHistory),
            escapingParameters: (linkHistory),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.saveLinkHistory(linkHistory: linkHistory))
        
    }
    
    
    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)  {
        
    return cuckoo_manager.call("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)",
            parameters: (onCompletion),
            escapingParameters: (onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getLinkHistory(onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_CacheManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.ProtocolStubFunction<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCacheManager.self, method: "saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(([HistoricalLinkEntity]) -> Void)> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCacheManager.self, method: "getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CacheManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.__DoNotUse<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return cuckoo_manager.verify("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.__DoNotUse<(([HistoricalLinkEntity]) -> Void), Void> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return cuckoo_manager.verify("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CacheManagerStub: CacheManager {
    

    

    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Manager/NetworkManager.swift at 2022-02-03 19:31:49 +0000

//
//  NetworkManager.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockNetworkManager: NetworkManager, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkManager
    
     typealias Stubbing = __StubbingProxy_NetworkManager
     typealias Verification = __VerificationProxy_NetworkManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkManager?

     func enableDefaultImplementation(_ stub: NetworkManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<R: Decodable>(url: String, onCompletion: @escaping (R) -> Void)  {
        
    return cuckoo_manager.call("request(url: String, onCompletion: @escaping (R) -> Void)",
            parameters: (url, onCompletion),
            escapingParameters: (url, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(url: url, onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_NetworkManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, R: Decodable>(url: M1, onCompletion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (R) -> Void)> where M1.MatchedType == String, M2.MatchedType == (R) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (R) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkManager.self, method: "request(url: String, onCompletion: @escaping (R) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, R: Decodable>(url: M1, onCompletion: M2) -> Cuckoo.__DoNotUse<(String, (R) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (R) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (R) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return cuckoo_manager.verify("request(url: String, onCompletion: @escaping (R) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkManagerStub: NetworkManager {
    

    

    
     func request<R: Decodable>(url: String, onCompletion: @escaping (R) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Mapper/ShortLinkMapper.swift at 2022-02-03 19:31:49 +0000

//
//  ShortLinkMapper.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockShortLinkMapper: ShortLinkMapper, Cuckoo.ProtocolMock {
    
     typealias MocksType = ShortLinkMapper
    
     typealias Stubbing = __StubbingProxy_ShortLinkMapper
     typealias Verification = __VerificationProxy_ShortLinkMapper

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ShortLinkMapper?

     func enableDefaultImplementation(_ stub: ShortLinkMapper) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func dataToDomain(_ apiShortenResponse: ApiShortenResponse) -> HistoricalLinkEntity {
        
    return cuckoo_manager.call("dataToDomain(_: ApiShortenResponse) -> HistoricalLinkEntity",
            parameters: (apiShortenResponse),
            escapingParameters: (apiShortenResponse),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.dataToDomain(apiShortenResponse))
        
    }
    

	 struct __StubbingProxy_ShortLinkMapper: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func dataToDomain<M1: Cuckoo.Matchable>(_ apiShortenResponse: M1) -> Cuckoo.ProtocolStubFunction<(ApiShortenResponse), HistoricalLinkEntity> where M1.MatchedType == ApiShortenResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(ApiShortenResponse)>] = [wrap(matchable: apiShortenResponse) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockShortLinkMapper.self, method: "dataToDomain(_: ApiShortenResponse) -> HistoricalLinkEntity", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ShortLinkMapper: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func dataToDomain<M1: Cuckoo.Matchable>(_ apiShortenResponse: M1) -> Cuckoo.__DoNotUse<(ApiShortenResponse), HistoricalLinkEntity> where M1.MatchedType == ApiShortenResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(ApiShortenResponse)>] = [wrap(matchable: apiShortenResponse) { $0 }]
	        return cuckoo_manager.verify("dataToDomain(_: ApiShortenResponse) -> HistoricalLinkEntity", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ShortLinkMapperStub: ShortLinkMapper {
    

    

    
     func dataToDomain(_ apiShortenResponse: ApiShortenResponse) -> HistoricalLinkEntity  {
        return DefaultValueRegistry.defaultValue(for: (HistoricalLinkEntity).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Repository/GetLinkHistoryRepository.swift at 2022-02-03 19:31:49 +0000

//
//  GetLinkHistoryRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockGetLinkHistoryRepository: GetLinkHistoryRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = GetLinkHistoryRepository
    
     typealias Stubbing = __StubbingProxy_GetLinkHistoryRepository
     typealias Verification = __VerificationProxy_GetLinkHistoryRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GetLinkHistoryRepository?

     func enableDefaultImplementation(_ stub: GetLinkHistoryRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)  {
        
    return cuckoo_manager.call("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)",
            parameters: (onCompletion),
            escapingParameters: (onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getLinkHistory(onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_GetLinkHistoryRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(([HistoricalLinkEntity]) -> Void)> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetLinkHistoryRepository.self, method: "getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetLinkHistoryRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getLinkHistory<M1: Cuckoo.Matchable>(onCompletion: M1) -> Cuckoo.__DoNotUse<(([HistoricalLinkEntity]) -> Void), Void> where M1.MatchedType == ([HistoricalLinkEntity]) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([HistoricalLinkEntity]) -> Void)>] = [wrap(matchable: onCompletion) { $0 }]
	        return cuckoo_manager.verify("getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetLinkHistoryRepositoryStub: GetLinkHistoryRepository {
    

    

    
     func getLinkHistory(onCompletion: @escaping ([HistoricalLinkEntity]) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Repository/GetShortLinkRepository.swift at 2022-02-03 19:31:49 +0000

//
//  GetShortLinkRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockGetShortLinkRepository: GetShortLinkRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = GetShortLinkRepository
    
     typealias Stubbing = __StubbingProxy_GetShortLinkRepository
     typealias Verification = __VerificationProxy_GetShortLinkRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GetShortLinkRepository?

     func enableDefaultImplementation(_ stub: GetShortLinkRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void)  {
        
    return cuckoo_manager.call("getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void)",
            parameters: (originalLink, onCompletion),
            escapingParameters: (originalLink, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getShortLink(originalLink: originalLink, onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_GetShortLinkRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getShortLink<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(originalLink: M1, onCompletion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (ApiResult, HistoricalLinkEntity) -> Void)> where M1.MatchedType == String, M2.MatchedType == (ApiResult, HistoricalLinkEntity) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (ApiResult, HistoricalLinkEntity) -> Void)>] = [wrap(matchable: originalLink) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetShortLinkRepository.self, method: "getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetShortLinkRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getShortLink<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(originalLink: M1, onCompletion: M2) -> Cuckoo.__DoNotUse<(String, (ApiResult, HistoricalLinkEntity) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (ApiResult, HistoricalLinkEntity) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (ApiResult, HistoricalLinkEntity) -> Void)>] = [wrap(matchable: originalLink) { $0.0 }, wrap(matchable: onCompletion) { $0.1 }]
	        return cuckoo_manager.verify("getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetShortLinkRepositoryStub: GetShortLinkRepository {
    

    

    
     func getShortLink(originalLink: String, onCompletion: @escaping (ApiResult, HistoricalLinkEntity) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: ShortlyApp/Data/Repository/SaveLinkHistoryRepository.swift at 2022-02-03 19:31:49 +0000

//
//  SaveLinkHistoryRepository.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Cuckoo
@testable import ShortlyApp

import Foundation


 class MockSaveLinkHistoryRepository: SaveLinkHistoryRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = SaveLinkHistoryRepository
    
     typealias Stubbing = __StubbingProxy_SaveLinkHistoryRepository
     typealias Verification = __VerificationProxy_SaveLinkHistoryRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SaveLinkHistoryRepository?

     func enableDefaultImplementation(_ stub: SaveLinkHistoryRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool {
        
    return cuckoo_manager.call("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool",
            parameters: (linkHistory),
            escapingParameters: (linkHistory),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.saveLinkHistory(linkHistory: linkHistory))
        
    }
    

	 struct __StubbingProxy_SaveLinkHistoryRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.ProtocolStubFunction<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSaveLinkHistoryRepository.self, method: "saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SaveLinkHistoryRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func saveLinkHistory<M1: Cuckoo.Matchable>(linkHistory: M1) -> Cuckoo.__DoNotUse<([HistoricalLinkEntity]), Bool> where M1.MatchedType == [HistoricalLinkEntity] {
	        let matchers: [Cuckoo.ParameterMatcher<([HistoricalLinkEntity])>] = [wrap(matchable: linkHistory) { $0 }]
	        return cuckoo_manager.verify("saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SaveLinkHistoryRepositoryStub: SaveLinkHistoryRepository {
    

    

    
     func saveLinkHistory(linkHistory: [HistoricalLinkEntity]) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
}

