import UIKit

class GaleriaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var obras: [ObraDeArte] = [] // Lista de obras

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializando as obras de arte
        obras = [
            ObraDeArte(titulo: "Obra 1", artista: "Artista 1", ano: 2000, estilo: "Estilo 1", imagemNome: "Image", descricao: "Descrição da Obra 1"),
            ObraDeArte(titulo: "Obra 2", artista: "Artista 2", ano: 2001, estilo: "Estilo 2", imagemNome: "obra2", descricao: "Descrição da Obra 2")
            // Adicione outras obras conforme necessário
        ]
        
        // Configurar UICollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200) // Ajuste o tamanho conforme necessário
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier: ObraCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }

    // Quantidade de itens na coleção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
    
    // Configuração da célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObraCollectionViewCell.reuseIdentifier, for: indexPath) as! ObraCollectionViewCell
        let obra = obras[indexPath.item]
        cell.configure(with: obra)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let obraSelecionada = obras[indexPath.item]
            print("Selecionou: \(obraSelecionada.titulo)")

            let detalhesVC = DetalhesViewController()
            detalhesVC.obra = obraSelecionada
            
            navigationController?.pushViewController(detalhesVC, animated: true)
        }
}

