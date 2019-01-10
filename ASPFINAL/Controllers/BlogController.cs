using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;

namespace ASPFINAL.Controllers
{
    public class BlogController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();
        // GET: Blog
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Read(int id)
        {
            FirstPage bnm = new FirstPage();

            bnm.blogs2 = db.Blogs.Find(id);
            return View(bnm);
        }


        public ActionResult AllBlog()
        {
            FirstPage bnm = new FirstPage();

            bnm.blogs = db.Blogs.ToList();
            return View(bnm);
        }
    }
}