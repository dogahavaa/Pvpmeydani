using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class Yorum
    {
        public int ID { get; set; }
        public int UyeID { get; set; }
        public int KonuID { get; set; }
        public string UyeKullaniciAdi { get; set; }
        public string Icerik { get; set; }
        public DateTime EklemeTarihi { get; set; }
        public int BegeniSayisi { get; set; }
        public bool Onayli { get; set; }
    }
}
