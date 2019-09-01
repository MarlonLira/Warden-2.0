using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;

namespace Warden.Helper {
    public static class Help {

        #region Cryptography
        public static class Crypto {

            public static String Encrypt(String ToEncrypt, byte[] Key, byte[] IV) {
                String DataToEncrypt = "";
                byte[] DataToEncryptByte;
                byte[] DataToEncryptedByte;

                try {
                    DataToEncryptByte = Encoding.UTF8.GetBytes(ToEncrypt);
                    DataToEncryptedByte = Encrypt(DataToEncryptByte, Key, IV);
                    DataToEncrypt = Encoding.UTF8.GetString(DataToEncryptedByte);
                } catch (Exception Err) {
                    throw new Exception(Err.Message + " " + Err.InnerException);
                }

                return DataToEncrypt;
            }

            public static String Decrypt(String ToDecrypt, byte[] Key, byte[] IV) {
                String DataToEncrypt = "";
                byte[] DataToDecryptByte;
                byte[] DataToDecryptedByte;

                try {
                    DataToDecryptByte = Encoding.UTF8.GetBytes(ToDecrypt);
                    DataToDecryptedByte = Decrypt(DataToDecryptByte, Key, IV);
                    DataToEncrypt = Encoding.UTF8.GetString(DataToDecryptedByte);
                } catch (Exception Err) {
                    throw new Exception(Err.Message + " " + Err.InnerException);
                }

                return DataToEncrypt;
            }

            public static byte[] Encrypt(byte[] dataToEncrypt, byte[] key, byte[] IV) {
                using (var des = new DESCryptoServiceProvider()) {
                    des.Mode = CipherMode.CBC;
                    des.Padding = PaddingMode.PKCS7;
                    des.Key = key;
                    des.IV = IV;
                    using (var memoryStream = new MemoryStream()) {
                        var cryptoStream = new CryptoStream(memoryStream,
                        des.CreateEncryptor(), CryptoStreamMode.Write);
                        cryptoStream.Write(dataToEncrypt, 0, dataToEncrypt.Length);
                        cryptoStream.FlushFinalBlock();
                        return memoryStream.ToArray();
                    }
                }
            }
            public static byte[] Decrypt(byte[] dataToDecrypt, byte[] key, byte[] IV) {
                using (var des = new DESCryptoServiceProvider()) {
                    des.Mode = CipherMode.CBC;
                    des.Padding = PaddingMode.PKCS7;
                    des.Key = key;
                    des.IV = IV;
                    using (var memoryStream = new MemoryStream()) {
                        var cryptoStream = new CryptoStream(memoryStream,
                        des.CreateDecryptor(), CryptoStreamMode.Write);
                        cryptoStream.Write(dataToDecrypt, 0, dataToDecrypt.Length);
                        cryptoStream.FlushFinalBlock();
                        return memoryStream.ToArray(); ;
                    }
                }
            }
            public static byte[] GenerateRandomNumber(int i) {
                using (var randomNumberGenerator = new RNGCryptoServiceProvider()) {
                    var randomNumber = new byte[i];
                    randomNumberGenerator.GetBytes(randomNumber);
                    return randomNumber;
                }
            }


        }
        #endregion

        #region Others
        public static String FormatUrl(String Url) {
            String Result = (HttpContext.Current.Request.Url.Authority + @"/" + Url.Replace(@"~/", @"/"));
            while (Result.IndexOf(@"//") > -1) {
                Result = Result.Replace(@"//", @"/");
                Result = Result.Replace("../", "/");
                Result = Result.Replace("./", "/");
            }
            return HttpContext.Current.Request.Url.Scheme + @"://" + Result;
        }

        public static String ConvertToPhoneFormat(String Tel) {
            String FormatedTel = "";
            if (Tel.Length == 11 ) {
                FormatedTel = long.Parse(Tel).ToString(@"(00) 0 0000-0000");
            } else if(Tel.Length == 10) {
                FormatedTel = long.Parse(Tel).ToString(@"(00) 0000-0000");
            } else if (Tel.Length == 8) {
                FormatedTel = long.Parse(Tel).ToString(@"00000-0000");
            } else if (Tel.Length == 9) {
                FormatedTel = long.Parse(Tel).ToString(@"0 0000-0000");
            } else {
                FormatedTel = Tel;
            }
            return FormatedTel;
        }

        public static String WordCheck(String Word) {
            String WordType = "";

            foreach (Char Letter in Word.ToCharArray()) {

                if (Char.IsNumber(Letter)) {
                    if (WordType == "Number" || String.IsNullOrEmpty(WordType)) {
                        WordType = "Number";
                    } else {
                        WordType = "Erro";
                        break;
                    }
                }
                if (Char.IsLetter(Letter) && !Char.IsSymbol(Letter)) {
                    if (WordType == "Letter" || String.IsNullOrEmpty(WordType)) {
                        WordType = "Letter";
                    } else {
                        WordType = "Erro";
                        break;
                    }
                }
            }

            return WordType;
        }

        public static String ConvertToJsArray(String[] Array) {
            String Result = "";
            String Init = "[";
            String End = "]";
            String Comma = ", ";
            Int32 Count = 1;

            if (Array != null) {
                Result = Init;
                foreach (String Item in Array) {
                    Result += "'" + Item + "'";
                    if (Count  < Array.Length) {
                        Result += Comma;
                    }
                    Count++;
                }
                Result += End;
            }
            return Result;
        }

        public static String ConvertToJsArray(List<ListItem> Itens) {
            String Result = "";
            String Init = "[";
            String End = "]";
            String Comma = ", ";
            String Separator = " / ";
            Int32 Count = 1;

            if (Itens != null) {
                Result = Init;
                foreach (ListItem Item in Itens) {
                    Result += "'" + Item.Text + "'";
                    if (Count < Itens.Count) {
                        Result += Comma;
                    }
                    Count++;
                }
                Result += End;
                Count = 1;
                Result += Separator;
                Result += Init;
                foreach (ListItem Item in Itens) {
                    Result += "'" + Item.Value + "'";
                    if (Count < Itens.Count) {
                        Result += Comma;
                    }
                    Count++;
                }

                Result += End;
            }
            return Result;
        }

        public static String MsgFormat(String CreateMsg, String FullName, String Email) {
            String Msg = CreateMsg;
            String[] Name = FullName.Split(' ');
            String SelectName = Name[0];

            Msg = Msg.Replace("{NOME}", RandomTalk(SelectName));
            Msg = Msg.Replace("{RESPONDER_PARA}", Email);
            
            return Msg;
        }

        public static String RandomTalk(String Name) {
            String Talk = "";
            Int32 Num = RandomNumber(1, 13);

            switch (Num) {
                case 1: {
                        Talk = "Bom dia " + Name + " Tudo bem com você ?";
                        break;
                    }
                case 2: {
                        Talk = "Olá tudo bem? " + Name;
                        break;
                    }
                case 3: {
                        Talk = "Como vai? " + Name;
                        break;
                    }
                case 4: {
                        Talk = "Olá " + Name;
                        break;
                    }
                case 5: {
                        Talk = "Oi tudo bem? " + Name;
                        break;
                    }
                case 6: {
                        Talk = "Olá, Como vai? " + Name;
                        break;
                    }
                case 7: {
                        Talk = "Bom dia, Como vai? " + Name;
                        break;
                    }
                case 8: {
                        Talk = "Tudo Bem? " + Name;
                        break;
                    }
                case 9: {
                        Talk = "Olá " + Name + " Como vai?";
                        break;
                    }
                case 10: {
                        Talk = "Olá " + Name + " Tudo bem?";
                        break;
                    }
                case 11: {
                        Talk = Name + " Como vai?";
                        break;
                    }
                case 12: {
                        Talk = "Olá " + Name + " Tudo Bem com você?";
                        break;
                    }
                case 13: {
                        Talk = "Bom dia " + Name + " Como vai? ";
                        break;
                    }
            }

            return Talk;
        }

        public static Int32 RandomNumber(Int32 Min, Int32 Max) {
            Random Random = new Random();
            return Random.Next(Min, Max);
        }

        public static String RandomIdGenerator() {
            String Id = "";
            String Rd = "";

            try {
                Rd = Guid.NewGuid().ToString();

                Id = "msg-" + RandomNumber(0, 99) + "-" + Rd;

                return Id;
            } finally {
                Id = "";
                Rd = "";
            }
        }

        public static String ShortLink(String urlOriginal) {

            XmlDocument xmlDoc = new XmlDocument();        // O documento XML que será usado para tratar a reposta do servidor

            //Faz uma solicitação ao bitly
            WebRequest request = WebRequest.Create("http://api.bitly.com/v3/shorten");
            //passa os dados do usuário, a chave da API e a url original
            byte[] data = Encoding.UTF8.GetBytes(string.Format("login={0}&apiKey={1}&longUrl={2}&format={3}",
                "hiacademia",                                     // seu nome de usuário na bitly
                "R_0aeffa67b9c747eeb20fde762001cee7",                // sua chave para usar a API (API key)
                HttpUtility.UrlEncode(urlOriginal),                 // Aplicar Encode na url que vamos encurtar
                "xml"));                                            // O formato da resposta que desejamos que o servidor responda
                                                                    //envia os dados via POST 
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;
            using (Stream ds = request.GetRequestStream()) {
                ds.Write(data, 0, data.Length);
            }

            //lê o arquivo XML obtido so servidor
            String Result = "";
            using (WebResponse response = request.GetResponse()) {
                using (StreamReader sr = new StreamReader(response.GetResponseStream())) {
                    xmlDoc.LoadXml(sr.ReadToEnd());
                    Result = xmlDoc.GetElementsByTagName("url")[0].InnerText;
                }
            }

            return Result;
        }

        public static Int32 WaitTime(Int32 Contador) {

            Int32 Time = 0;

            if (Contador <= 50) {
                Time = 60000;

            } else {
                Contador = 0;
                Time = 1200000;
            }

            return Time;
        }

        public static Boolean EmailCheck(String Email) {
            Regex Reg = new Regex(@"^[a-zA-Z0-9_+-]+[a-zA-Z0-9._+-]*[a-zA-Z0-9_+-]+@[a-zA-Z0-9_+-]+[a-zA-Z0-9._+-]*[.]{1,1}[a-zA-Z]{2,}$");

            return Reg.IsMatch(Email);
        }

        public static String WhatsLinkGenerator(String Number, String Text) {
            String WhatsLink = "https://api.whatsapp.com/send?phone=" + Number + "&text=" + Text;
            return WhatsLink;
        }

        public static String WhatsMsgFormat(String Text, String Name) {
            String TextFormat = "";
            String[] NomeFormat = Name.Split(' ');
            TextFormat = Text.Replace("{nome}", NomeFormat[0]);
            TextFormat = TextFormat.Replace("{hix}", "Texto fixo Hix");
            TextFormat = TextFormat.Replace("{hi}", "Texto fixo Hi");
            TextFormat = TextFormat.Replace("{comprimento}", RandomTalk(Name));
            TextFormat = TextFormat.Replace("{comprimentoplus}", RandomTalk(NomeFormat[0]));

            return TextFormat;
        }

        #endregion
    }
}