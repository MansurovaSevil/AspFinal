using ASPFINAL.Extino;
using ASPFINAL.Models;
using ASPFINAL.ViewModel;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASPFINAL.Controllers
{
    public class AddlistingController : Controller
    {
        AspFinalNewEntities db = new AspFinalNewEntities();
        // GET: Addlisting
        public ActionResult Index()
        {
            HomeindexView bnm = new HomeindexView();
            bnm.categories = db.Categories.ToList();
            bnm.cities = db.Cities.ToList();
            bnm.service = db.Services.ToList();
            return View(bnm);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Place plic,List<int>  h,int CategoryId, IEnumerable<HttpPostedFileBase> Img)
        {
            
            User user = Session["user"] as User;
            User users = Session["user2"] as User;
            HomeindexView bnm = new HomeindexView();
            if (user != null || users != null)
            {

                if (user == null)
                {
                    plic.UserId = users.Id;
                }
                else
                {
                    plic.UserId = user.Id;
                }


                
               
                db.Places.Add(plic);
                db.SaveChanges();

                foreach (var item in h)
                {
                    PlaceService das = new PlaceService
                    {
                        PlaceId=plic.Id,
                        SeviceId=item


                    };
                    db.PlaceServices.Add(das);
                    db.SaveChanges();
                }

                foreach (var item in h)
                {
                    CategoryService pas = new CategoryService
                    {
                        CategoryId=CategoryId,
                        ServiceId=item
                    };
                    db.CategoryServices.Add(pas);
                    db.SaveChanges();
                }
                Photo cv = new Photo();
                foreach (var item in Img)
                {
                    if (Extension.CheckImg(item, Extension.MAxfileSize))
                    {
                        try
                        {
                           cv.Image  = Extension.SaveImg(item, "~/Public/Listing");
                        }
                        catch
                        {

                            ModelState.AddModelError("Img", "Img is not correct");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("Img", "Img is not correct");
                    }

                    Photo con = new Photo
                    {

                        PlaceId=plic.Id,
                       Image=cv.Image,
                    };
                    db.Photos.Add(con);
                    db.SaveChanges();
                }

            }


            return RedirectToAction("Index","Home");

        }
    }
}