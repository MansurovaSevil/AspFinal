using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;

namespace ASPFINAL.Controllers
{
    public class AddlistingController : Controller
    {
        // GET: Addlisting
        public ActionResult Index()
        {
            return View();
        }
    }
}