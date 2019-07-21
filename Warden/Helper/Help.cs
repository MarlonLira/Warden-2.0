using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

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
        #endregion
    }
}