import UIKit

class ObraCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ObraCollectionViewCell"
    
    // Views
    var imagemView: UIImageView!
    var tituloLabel: UILabel!
    var artistaLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Inicializando as views
        imagemView = UIImageView()
        imagemView.contentMode = .scaleAspectFill
        imagemView.clipsToBounds = true
        addSubview(imagemView)
        
        tituloLabel = UILabel()
        tituloLabel.textAlignment = .center
        addSubview(tituloLabel)
        
        artistaLabel = UILabel()
        artistaLabel.textAlignment = .center
        artistaLabel.font = .systemFont(ofSize: 12)
        addSubview(artistaLabel)
        
        // Layout com Auto Layout
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        artistaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: topAnchor),
            imagemView.leftAnchor.constraint(equalTo: leftAnchor),
            imagemView.rightAnchor.constraint(equalTo: rightAnchor),
            imagemView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor),
            tituloLabel.leftAnchor.constraint(equalTo: leftAnchor),
            tituloLabel.rightAnchor.constraint(equalTo: rightAnchor),
            
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor),
            artistaLabel.leftAnchor.constraint(equalTo: leftAnchor),
            artistaLabel.rightAnchor.constraint(equalTo: rightAnchor),
            artistaLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with obra: ObraDeArte) {
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
    }
}
