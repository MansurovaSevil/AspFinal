using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;

namespace ASPFINAL.Controllers
{
    public class HomeController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();
        public ActionResult Index()
        {
            return View();
        }

    }
}