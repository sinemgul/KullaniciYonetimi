import 'package:deneme/database.dart';
import 'package:flutter/material.dart';


class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();

  Kullanici  user1= Kullanici();
  String _userCode = '';
  String _username = '';
  String _tcNo = '';
  String _phoneNumber = '';
  String _address = '';
  String _password = '';
  String _confirmPassword = '';
  String _editPermission = 'Evet';
  String _cancelPermission = 'Evet';
  String _dailyTransaction = 'Evet';
  String _loginPermission = 'Evet';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password == _confirmPassword)
       {
        user1.userCode = _userCode;
        user1.username = _username;
        user1.tcNo = _tcNo;
        user1.phoneNumber = _phoneNumber;
        user1.address = _address;
        user1.password = _password;
        user1.cancelPermission = _cancelPermission as bool;
        user1.dailyTransaction = _dailyTransaction as bool;
        user1.editPermission = _editPermission as bool;
      
        Map<String, dynamic> user = {
          'userCode': _userCode,
          'username': _username,
          'tcNo': _tcNo,
          'phoneNumber': _phoneNumber,
          'address': _address,
          'password': _password,
          'editPermission': _editPermission,
          'cancelPermission': _cancelPermission,
          'dailyTransaction': _dailyTransaction,
          'loginPermission': _loginPermission,
        };
        try {
          await DatabaseHelper.instance.insertUser(user1 as Map<String, Kullanici>);
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text('Kullanıcı başarıyla eklendi!')),
          );
          Navigator.pop(context as BuildContext);
        } catch (e) {
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text('Kullanıcı eklenirken bir hata oluştu!')),
          );
        }
      } else {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(content: Text('Şifreler eşleşmiyor!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Kullanıcı Kodu',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          _userCode = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen kullanıcı kodunu giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Kullanıcı Adı',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          _username = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen kullanıcı adını giriniz';
                          }
                          return null;
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
                                labelText: 'TC Kimlik No',
                                border: OutlineInputBorder(),
                              ),
                              onSaved: (value) {
                                _tcNo = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen TC kimlik numaranızı giriniz';
                                } else if (value.length != 11) {
                                  return 'TC kimlik numarası 11 haneli olmalıdır';
                                }
                                return null;
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
                                labelText: 'Cep Telefonu',
                                border: OutlineInputBorder(),
                              ),
                              onSaved: (value) {
                                _phoneNumber = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen cep telefonunuzu giriniz';
                                }
                                return null;
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
                              labelText: 'TC Kimlik No',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              _tcNo = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen TC kimlik numaranızı giriniz';
                              } else if (value.length != 11) {
                                return 'TC kimlik numarası 11 haneli olmalıdır';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Cep Telefonu',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              _phoneNumber = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen cep telefonunuzu giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Adres',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          _address = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen adresinizi giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Şifre',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen şifrenizi giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Şifre Tekrar',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          _confirmPassword = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen şifrenizi tekrar giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                    MediaQuery.of(context).size.width > 600
                        ? Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Düzeltme Yetki',
                                border: OutlineInputBorder(),
                              ),
                              value: _editPermission,
                              items: ['Evet', 'Hayır'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _editPermission = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'İptal Yetki',
                                border: OutlineInputBorder(),
                              ),
                              value: _cancelPermission,
                              items: ['Evet', 'Hayır'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _cancelPermission = value!;
                                });
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
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Düzeltme Yetki',
                              border: OutlineInputBorder(),
                            ),
                            value: _editPermission,
                            items: ['Evet', 'Hayır'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _editPermission = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'İptal Yetki',
                              border: OutlineInputBorder(),
                            ),
                            value: _cancelPermission,
                            items: ['Evet', 'Hayır'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _cancelPermission = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Günlük İşlem',
                          border: OutlineInputBorder(),
                        ),
                        value: _dailyTransaction,
                        items: ['Evet', 'Hayır'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _dailyTransaction = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Yetki Giriş',
                          border: OutlineInputBorder(),
                        ),
                        value: _loginPermission,
                        items: ['Evet', 'Hayır'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _loginPermission = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('İptal'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
