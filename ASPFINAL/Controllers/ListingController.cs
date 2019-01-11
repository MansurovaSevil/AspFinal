using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;

namespace ASPFINAL.Controllers
{
    public class ListingController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();
        // GET: Listing
        public ActionResult Index()
        {
            FirstPage bnm = new FirstPage();
            bnm.places = db.Places.ToList();
            bnm.prohots = db.Photos.ToList();
            bnm.cites = db.Cities.ToList();

            return View(bnm);
        }
        public ActionResult Read(int id)
        {
            FirstPage bnm = new FirstPage();
            bnm.place2 = db.Places.Find(id);
            bnm.prohots = db.Photos.ToList();
            bnm.servicplace = db.PlaceServices.ToList();
            
            return View(bnm);
        }
    }
}