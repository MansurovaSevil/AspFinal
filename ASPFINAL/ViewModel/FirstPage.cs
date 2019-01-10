using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASPFINAL.Models;

namespace ASPFINAL.ViewModel
{
    public class FirstPage
    {
        public List<Category> categories { get; set; }
        public List<Place> places { get; set; }
        public Place place2 { get; set; }
        public List<Photo> prohots { get; set; }
        public Photo photos2 { get; set; }
        public List<City> cites { get; set; }
        public List<Blog> blogs { get; set; }
        public Blog blogs2 { get; set; }
        public List<PlaceService> servicplace { get; set; }


    }
}