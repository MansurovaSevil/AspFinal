using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;
using System.Web.Helpers;

namespace ASPFINAL.Controllers
{
    public class AccountUserController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();

        public static User current_user;
        public static int user_id;
        // GET: AccountUser

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User userrrs)
        {
            if (db.Users.Count(u => u.FullName == userrrs.FullName) == 1 || db.Users.Count(u => u.Email == userrrs.Email) == 1)
            {
                ModelState.AddModelError("SameUser", "We already have a user with such username or email in our database.");
            }
            else
            {
                userrrs.Password = Crypto.HashPassword(userrrs.Password);
                User userr = userrrs;
         
                db.Users.Add(userr);
                db.SaveChanges();


                Session["user2"] = userr;
                Session["loguser"] = true;
                return RedirectToAction("Index", "Home");
            }

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            if (db.Users.Count(u => u.Email == user.Email) == 1)
            {

                if (Crypto.VerifyHashedPassword(db.Users.First(u => u.Email == user.Email).Password, user.Password))
                {
                    current_user = db.Users.First(u => u.Email == user.Email);
                    Session["userLogged"] = true;
                    Session["user"] = db.Users.First(u => u.Email == user.Email);

                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    ModelState.AddModelError("Loginerror", "Username  or  password is wrong");
                }

            }
            else
            {
                ModelState.AddModelError("Loginerror", "Username  or  password is wrong");

            }

            return View(user);

        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Users()
        {
            HomeindexView vm = new HomeindexView();
            vm.users = db.Users.ToList();
            return View(vm);
        }

    }

}