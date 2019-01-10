using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASPFINAL.Models;

namespace ASPFINAL.ViewModel
{
    public class HomeindexView
    {
        public List<User> users { get; set; }
        public List<Place> places { get; set; }
        public List<Category> categories { get; set; }
        public List<City> cities { get; set; }
        public List<Service> service { get; set; }
        public List<Photo> photos { get; set; }
        public Photo prop1 { get; set; }
        public Place prop2 { get; set; }
    }
}