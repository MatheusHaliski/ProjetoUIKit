import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var obras: [ObraDeArte] = [] // Lista de obras de arte
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializando algumas obras de arte de artistas de Curitiba
                obras = [
                    ObraDeArte(titulo: "Mural da Universidade Federal do Paraná", artista: "Poty Lazzarotto", ano: 1973, estilo: "Arte Figurativa", imagemNome: "Image", descricao: "Mural na Universidade Federal do Paraná, obra monumental de Poty Lazzarotto com elementos da cultura popular."),
                    ObraDeArte(titulo: "Poema Visual", artista: "Paulo Leminski", ano: 1985, estilo: "Poesia Visual", imagemNome: "Image2", descricao: "Desenho gráfico que combina poesia e arte visual, característico do trabalho de Paulo Leminski."),
                    ObraDeArte(titulo: "Abaporu", artista: "Tarsila do Amaral", ano: 1928, estilo: "Modernismo", imagemNome: "Image3", descricao: "Uma das obras mais famosas do modernismo brasileiro, representando uma crítica ao colonizador e à construção de uma identidade nacional."),
                    ObraDeArte(titulo: "Cidade", artista: "Claudio Tozzi", ano: 1980, estilo: "Figurativo", imagemNome: "Image4", descricao: "Uma das séries de Tozzi que descrevem a natureza dos tucanos, focando na beleza da vida selvagem."),
                    // Adicione mais obras conforme necessário
                ]
        
        // Configurar a coleção
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200) 
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        // Registro de células
        collectionView.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier: ObraCollectionViewCell.reuseIdentifier)
    }

    // Quantidade de itens na coleção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
    
    // Configuração da célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObraCollectionViewCell.reuseIdentifier, for: indexPath) as! ObraCollectionViewCell
        let obra = obras[indexPath.item]
        cell.configure(with: obra) // Configura a célula com os dados da obra
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obraSelecionada = obras[indexPath.item]
        print("Selecionou: \(obraSelecionada.titulo)")

        // Criar uma instância do DetalhesViewController
        let detalhesVC = DetalhesViewController()
        detalhesVC.obra = obraSelecionada  // Passar a obra selecionada

        // Apresentar o DetalhesViewController como um modal
        detalhesVC.modalPresentationStyle = .overCurrentContext
        detalhesVC.modalTransitionStyle = .crossDissolve  // Você pode escolher uma animação de transição
        present(detalhesVC, animated: true, completion: nil)
    }


}

