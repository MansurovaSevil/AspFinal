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
    
    public partial class CommentPhoto
    {
        public int Id { get; set; }
        public int CommentId { get; set; }
        public string Photo { get; set; }
    
        public virtual Comment Comment { get; set; }
    }
}