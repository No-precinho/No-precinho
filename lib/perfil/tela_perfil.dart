import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? 'Usuário';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, $displayName!',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 220),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(user: user),
                    ),
                  );
                },
                child: Text('Editar Perfil'),
              ),
              SizedBox(width: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordPage(user: user),
                    ),
                  );
                },
                child: Text('Alterar Senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final User? user;

  EditProfilePage({required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _displayNameController.text = widget.user?.displayName ?? '';
    _emailController.text = widget.user?.email ?? '';
  }

  Future<void> _updateProfile() async {
    try {
      await widget.user?.updateDisplayName(_displayNameController.text);
      await widget.user?.updateEmail(_emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao atualizar perfil!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _displayNameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            if (_errorMessage != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20.0), // Adiciona espaço antes do botão
            Align(
              alignment: Alignment.center, // Centraliza o botão
              child: SizedBox(
                width: 200, // Define a largura máxima do botão
                child: ElevatedButton(
                  onPressed: _updateProfile,
                  child: Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0), // Aumenta a altura do botão
                    textStyle:
                        TextStyle(fontSize: 18.0), // Aumenta o tamanho do texto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  final User? user;

  ChangePasswordPage({this.user});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newConfirmPasswordController =
      TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_updateState);
    _newConfirmPasswordController.addListener(_updateState);
  }

  @override
  void dispose() {
    _newPasswordController.removeListener(_updateState);
    _newConfirmPasswordController.removeListener(_updateState);
    _newPasswordController.dispose();
    _newConfirmPasswordController.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  Future<void> _changePassword() async {
    if (_newPasswordController.text != _newConfirmPasswordController.text) {
      setState(() {
        _errorMessage = "As senhas não coincidem!";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });

      try {
        await widget.user?.updatePassword(_newPasswordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Senha alterada com sucesso')),
        );
        Navigator.pop(context);
      } catch (error) {
        setState(() {
          _errorMessage = "Erro ao alterar senha!";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: 'Nova senha'),
              obscureText: true,
            ),
            TextField(
              controller: _newConfirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirmar senha'),
              obscureText: true,
            ),
            if (_errorMessage != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20.0), // Adiciona espaço antes do botão
            Align(
              alignment: Alignment.center, // Centraliza o botão
              child: SizedBox(
                width: 200, // Define a largura máxima do botão
                child: ElevatedButton(
                  onPressed: _newPasswordController.text.isNotEmpty &&
                          _newPasswordController.text ==
                              _newConfirmPasswordController.text
                      ? _changePassword
                      : null,
                  child: Text('Alterar Senha'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0), // Aumenta a altura do botão
                    textStyle:
                        TextStyle(fontSize: 18.0), // Aumenta o tamanho do texto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
