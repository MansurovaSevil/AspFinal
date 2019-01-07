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
    
    public partial class Place
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Place()
        {
            this.PlaceServices = new HashSet<PlaceService>();
            this.WorkHours = new HashSet<WorkHour>();
        }
    
        public int Id { get; set; }
        public bool Status { get; set; }
        public string Name { get; set; }
        public string Slogan { get; set; }
        public string Desc { get; set; }
        public string Phone { get; set; }
        public string Website { get; set; }
        public int CategoryId { get; set; }
        public int CityId { get; set; }
        public int UserId { get; set; }
        public string Lat { get; set; }
        public string Lng { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual City City { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaceService> PlaceServices { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkHour> WorkHours { get; set; }
    }
}
