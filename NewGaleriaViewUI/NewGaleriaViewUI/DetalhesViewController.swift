import UIKit

class DetalhesViewController: UIViewController {

    var obra: ObraDeArte?  // Propriedade para armazenar a obra selecionada

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Definir o fundo do modal com cor semitransparente
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        // Adicionar uma view que fará a exibição do conteúdo
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        // Adicionar uma imagem (agora em tamanho maior)
        let imagemView = UIImageView()
        imagemView.image = UIImage(named: obra?.imagemNome ?? "")
        imagemView.contentMode = .scaleAspectFit
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imagemView)

        // Título da obra
        let tituloLabel = UILabel()
        tituloLabel.text = obra?.titulo
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 24)
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tituloLabel)

        // Descrição da obra
        let descricaoLabel = UILabel()
        descricaoLabel.text = obra?.descricao
        descricaoLabel.numberOfLines = 0
        descricaoLabel.font = UIFont.systemFont(ofSize: 18)
        descricaoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descricaoLabel)
        
        // Ano da obra
        let anoLabel = UILabel()
        anoLabel.text = "Ano: \(obra?.ano ?? 0)"
        anoLabel.font = UIFont.systemFont(ofSize: 18)
        anoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(anoLabel)
        
        // Definir as constraints do conteúdo para centralizar e ajustar o layout
        NSLayoutConstraint.activate([
            // ContentView
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            
            // Imagem
            imagemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imagemView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagemView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            imagemView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            
            // Título
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 20),
            tituloLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Descrição
            descricaoLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 10),
            descricaoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descricaoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Ano
            anoLabel.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 10),
            anoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            anoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        // Adicionar gesto para fechar o modal ao tocar fora do conteúdo
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModal))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Função para fechar o modal quando tocar fora do conteúdo
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}

