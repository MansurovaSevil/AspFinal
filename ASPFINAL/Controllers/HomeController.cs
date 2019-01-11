using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;

namespace ASPFINAL.Controllers
{
    public class HomeController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();
        public ActionResult Index()
        {
            FirstPage bnm = new FirstPage();
            bnm.categories = db.Categories.ToList();
            bnm.places = db.Places.Take(3).ToList();
            bnm.prohots = db.Photos.ToList();
            bnm.cites = db.Cities.ToList();
            bnm.blogs = db.Blogs.Take(4).ToList();
            bnm.blogs = db.Blogs.Take(4).ToList();

            return View(bnm);
        }

    }
}