import 'package:flutter/material.dart';

class CariTanitimPage extends StatefulWidget {
  @override
  _CariTanitimPageState createState() => _CariTanitimPageState();
}

class _CariTanitimPageState extends State<CariTanitimPage> {
  final _formKey = GlobalKey<FormState>();

  String cariKodu = '';
  String cariUnvani = '';
  String grupKodu = '';
  String telefon1 = '';
  String telefon2 = '';
  String cepTelefon = '';
  String ePosta = '';
  String vergiDairesi = '';
  String vknTckn = '';
  String adres = '';
  String ilce = '';
  String il = '';
  String lisansFirmaKodu = '';
  String lisansCihaz = '';
  String gibDurum = 'Yok'; // Varsayılan değer
  String gibWsFirmaKodu = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Kaydetme işlemleri burada yapılabilir
      print('Form submitted');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Tanıtımı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cari Kodu',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    cariKodu = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cari Unvanı',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    cariUnvani = value!;
                  },
                ),
              ),
              MediaQuery.of(context).size.width > 600
                  ? Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Grup Kodu',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          grupKodu = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Telefon I',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          telefon1 = value!;
                        },
                      ),
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Grup Kodu',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        grupKodu = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Telefon I',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        telefon1 = value!;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Telefon II',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    telefon2 = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cep Telefon',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    cepTelefon = value!;
                  },
                ),
              ),
              MediaQuery.of(context).size.width > 600
                  ? Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'e-Posta',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          ePosta = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Vergi Dairesi',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          vergiDairesi = value!;
                        },
                      ),
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'e-Posta',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        ePosta = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Vergi Dairesi',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        vergiDairesi = value!;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Vkn - Tckn',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    vknTckn = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adres',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    adres = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'İlçe',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    ilce = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'İl',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    il = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lisans Firma Kodu',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    lisansFirmaKodu = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lisans Cihaz',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    lisansCihaz = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gib Durum',
                    border: OutlineInputBorder(),
                  ),
                  value: gibDurum,
                  items: ['Yok', 'Var'].map((gibDurum) {
                    return DropdownMenuItem(
                      value: gibDurum,
                      child: Text(gibDurum),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      gibDurum = value!;
                    });
                  },
                  onSaved: (value) {
                    gibDurum = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'GİB Ws Firma Kodu',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    gibWsFirmaKodu = value!;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Kaydet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('İptal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
