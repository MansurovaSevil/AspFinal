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
    
    public partial class WorkHour
    {
        public int Id { get; set; }
        public int PlaceId { get; set; }
        public int Weekno { get; set; }
        public System.TimeSpan OpenHour { get; set; }
        public System.TimeSpan CloseHour { get; set; }
    
        public virtual Place Place { get; set; }
    }
}
