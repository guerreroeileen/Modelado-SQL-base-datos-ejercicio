//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace map
{
    using System;
    using System.Collections.Generic;
    
    public partial class Multa
    {
        public int Id { get; set; }
        public decimal Valor { get; set; }
        public Nullable<System.DateTime> FechaCanc { get; set; }
    
        public virtual Detalle Detalle { get; set; }
    }
}
