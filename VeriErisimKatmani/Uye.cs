using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class Uye
    {
        public int ID { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string KullaniciAdi { get; set; }
        public string Mail { get; set; }
        public string Sifre { get; set; }
        public string ProfilFotografi { get; set; }
        public bool Onayli { get; set; }
        public bool Donmus { get; set; }
        public bool Silinmis { get; set; }
        public int MesajSayisi { get; set; }
        public int KonuSayisi { get; set; }
        public int ReaksiyonSkoru { get; set; }
        public DateTime UyelikTarihi { get; set; }
    }
}
