import Foundation

public struct Network {

    public static let shared = Network()
    
    public func fetchAlbum(completion: @escaping ([Album]) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/lookup"
        components.queryItems = [
            URLQueryItem(name: "id", value: "909253"),
            URLQueryItem(name: "entity", value: "album")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let collection = try JSONDecoder().decode(AlbumCollection.self, from: data)
                completion(collection.results)
            } catch let jsonErr {
                print("jsonError: \(jsonErr)")
            }

        }.resume()
    }
        
//    https://itunes.apple.com/lookup?id=909253&entity=album
    
}


