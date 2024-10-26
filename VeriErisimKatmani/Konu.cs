using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class Konu
    {
        public int ID { get; set; }
        public int TurID { get; set; }
        public string TurAdi { get; set; }
        public int ZorlukID { get; set; }
        public string Zorluk { get; set; }
        public int UyeID { get; set; }
        public string UyeKullaniciAdi { get; set; }
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string ServerAdi { get; set; }
        public string Website { get; set; }
        public DateTime AcilisTarihi { get; set; }
        public bool ServerDurumu { get; set; }
        public bool VipKonu { get; set; }
        public DateTime EklenmeTarihi { get; set; }
        public DateTime GuncellenmeTarihi { get; set; }
        public int GoruntulemeSayisi { get; set; }
        public int BegeniSayisi { get; set; }
        public int YorumSayisi { get; set; }
        public bool Onayli { get; set; }
        public DateTime SonYorumTarihi { get; set; }
        public string SonYorumKAdi { get; set; }
        public bool Durum { get; set; }
    }
}