//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ASPFINAL.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlaceService
    {
        public int Id { get; set; }
        public int PlaceId { get; set; }
        public int SeviceId { get; set; }
    
        public virtual Place Place { get; set; }
        public virtual Service Service { get; set; }
    }
}
