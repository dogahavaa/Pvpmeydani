using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class Yonetici
    {
        public int ID { get; set; }
        public int GorevID { get; set; }
        public string Gorev { get; set; }
        public string ProfilFotografi { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string KullaniciAdi { get; set; }
        public string Mail { get; set; }
        public string Sifre { get; set; }
        public bool Durum { get; set; }
        public bool Silinmis { get; set; }
    }
}
