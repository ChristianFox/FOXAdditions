
import Foundation

public extension Encodable {
    
    func fox_dictionary(_ encoder:JSONEncoder = JSONEncoder()) -> [String:Any]? {
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

public extension Decodable {
    
    init(dictionary: [String:Any], options:JSONSerialization.WritingOptions = [], decoder:JSONDecoder = JSONDecoder()) throws {
      let data = try JSONSerialization.data(withJSONObject: dictionary, options:options)
      self = try decoder.decode(Self.self, from: data)
    }
}
