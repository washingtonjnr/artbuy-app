// class AppMasks {
//   static MaskTextInputFormatter get cnpj => MaskTextInputFormatter(
//         mask: '##.###.###/####-##',
//         filter: {"#": RegExp(r'[0-9]')},
//       );

//   static MaskTextInputFormatter get cpf => MaskTextInputFormatter(
//         mask: '###.###.###-##',
//         filter: {"#": RegExp(r'[0-9]')},
//       );

//   static MaskTextInputFormatter get phone => MaskTextInputFormatter(
//         mask: '(##) #####-####',
//         filter: {"#": RegExp(r'[0-9]')},
//       );

//   static MaskTextInputFormatter get cep => MaskTextInputFormatter(
//         mask: '#####-###',
//         filter: {"#": RegExp(r'[0-9]')},
//       );

//   static String mask(MaskTextInputFormatter mask, String text) {
//     return mask.maskText(text);
//   }

//   static String maskCpfCnpj(String text) {
//     if (text.isEmpty) {
//       String value = text.replaceAll(RegExp(r"[\./\-]+"), "");
//       if (value.length == 11) {
//         return AppMasks.cpf.maskText(value);
//       } else if (value.length == 14) {
//         return AppMasks.cnpj.maskText(value);
//       }
//     }

//     return text;
//   }
// }
