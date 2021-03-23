import Foundation
import Model

public struct Network {

    public static let shared = Network()
    
    public func fetchAlbum(completion: @escaping ((Result<[Album], NetworkError>) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/lookup"
        components.queryItems = [
            URLQueryItem(name: "id", value: "909253"),
            URLQueryItem(name: "entity", value: "album")
        ]
        
        guard let url = components.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
                }
                return
            }

            do {
                let collection = try JSONDecoder().decode(AlbumCollection.self, from: data)
                completion(.success(collection.results))
            } catch {
                completion(.failure(.decodingError))
            }

        }.resume()
    }
        
//    https://itunes.apple.com/lookup?id=909253&entity=album
//    https://itunes.apple.com/lookup?id=909253&entity=song
    
    
}


