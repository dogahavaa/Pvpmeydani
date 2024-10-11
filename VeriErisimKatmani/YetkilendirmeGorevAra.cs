using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class YetkilendirmeGorevAra
    {
        public int GorevID { get; set; }
        public string GorevAdi { get; set; }
        public int YetkilendirmeID { get; set; }
        public string YetkilendirmeIslemi { get; set; }
        public bool Onay { get; set; }
    }
}
