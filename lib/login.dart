import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _login() {
    String userName = _nameController.text;
    // Faça o que desejar com o nome do usuário, como enviar para uma API ou armazenar localmente.

    // Exemplo: exibir o nome do usuário em um Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bem-vindo, $userName!')),
    );

    // Navegar para a próxima tela
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color.fromARGB(255, 230, 124, 3),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/lanche.png',
                width: 300.0,
                height: 300.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'FoodPlus+',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome do usuário',
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodPlus+'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 230, 124, 3),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Promoções e Informações',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categorias',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ver tudo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 124, 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  CategoryCard(
                    icon: Icons.fastfood,
                    label: 'Fast Food',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListScreen(category: 'Fast Food'),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.local_pizza,
                    label: 'Pizzas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListScreen(category: 'Pizzas'),
                        ),
                      );
                      // Lógica para mostrar a lista de itens da Categoria 2
                    },
                  ),
                  CategoryCard(
                    icon: Icons.cake,
                    label: 'Bolos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListScreen(category: 'Bolos'),
                        ),
                      );
                      // Lógica para mostrar a lista de itens da Categoria 3
                    },
                  ),
                  CategoryCard(
                    icon: Icons.local_dining,
                    label: 'Outros',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListScreen(category: 'Outros'),
                        ),
                      );
                      // Lógica para mostrar a lista de itens da Categoria 3
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Mais Populares',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ItemCard(
                    image: 'images/fastfood.png',
                    name: 'Combo lanche + batata frita + refrigerante',
                    price: 'R\$ 9,99',
                    onTap: () {
                      // Lógica para mostrar detalhes do Item 1
                    },
                  ),
                  SizedBox(height: 8.0),
                  ItemCard(
                    image: 'images/pizza.png',
                    name: 'Pizza de Calabresa Grande',
                    price: 'R\$ 14,99',
                    onTap: () {
                      // Lógica para mostrar detalhes do Item 2
                    },
                  ),
                  SizedBox(height: 8.0),
                  ItemCard(
                    image: 'images/bolo.png',
                    name: 'Bolo de chocolate com cobertura',
                    price: 'R\$ 19,99',
                    onTap: () {
                      // Lógica para mostrar detalhes do Item 3
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  final String category;

  const ItemListScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> items;

    if (category == 'Fast Food') {
      items = [
        Item(name: 'Hambúrguer', price: 'R\$ 9,99', image: 'images/lanche.png'),
        Item(name: 'Batata Frita', price: 'R\$ 4,99', image: 'images/batata_frita.png'),
        Item(name: 'Refrigerante', price: 'R\$ 3,99', image: 'images/refrigerante.png'),
      ];
    } else if (category == 'Pizzas') {
      items = [
        Item(name: 'Pizza de Calabresa', price: 'R\$ 19,99', image: 'images/pizza_calabresa.png'),
        Item(name: 'Pizza de Mussarela', price: 'R\$ 18,99', image: 'images/pizza_mussarela.png'),
        Item(name: 'Pizza de Frango', price: 'R\$ 17,99', image: 'images/pizza_frango.png'),
      ];
    } else if (category == 'Bolos') {
      items = [
        Item(name: 'Bolo de Chocolate', price: 'R\$ 24,99', image: 'images/bolo_chocolate.png'),
        Item(name: 'Bolo de Morango', price: 'R\$ 22,99', image: 'images/bolo_morango.png'),
        Item(name: 'Bolo de Cenoura', price: 'R\$ 20,99', image: 'images/bolo_cenoura.png'),
      ];
    } else if (category == 'Outros') {
      items = [
        Item(name: 'Salada Mista', price: 'R\$ 12,99', image: 'images/salada_mista.png'),
        Item(name: 'Sopa de Legumes', price: 'R\$ 9,99', image: 'images/sopa_legumes.png'),
        Item(name: 'Sanduíche Natural', price: 'R\$ 8,99', image: 'images/sanduiche_natural.png'),
      ];
    } else {
      items = []; // Caso a categoria não seja encontrada, uma lista vazia será exibida
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Itens - $category'),
        backgroundColor: Color.fromARGB(255, 230, 124, 3),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Item item = items[index];
          return ListTile(
            leading: Image.asset(
              item.image,
              width: 40.0,
              height: 40.0,
            ),
            title: Text(item.name),
            subtitle: Text(item.price),
            onTap: () {
              // Lógica para mostrar detalhes do item
            },
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  final String price;
  final String image;
  // Outras propriedades do item, como imagem, descrição, etc.

  Item({required this.name, required this.price, required this.image});
}



class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: 120.0,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(height: 8.0),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final VoidCallback onTap;

  const ItemCard({
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Image.asset(
              image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/item.png',
              fit: BoxFit.cover,
              height: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome do Produto',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'R\$ 9,99',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Descrição do produto',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Adicionar ao Favorito'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 230, 124, 3),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Comprar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


