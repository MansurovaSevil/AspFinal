using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;
using ASPFINAL.Extino;

namespace ASPFINAL.Areas.admin.Controllers
{
    public class CitiesController : Controller
    {
        private AspFinalNewEntities db = new AspFinalNewEntities();

        // GET: admin/Cities
        public ActionResult Index()
        {
            return View(db.Cities.ToList());
        }

        // GET: admin/Cities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // GET: admin/Cities/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/Cities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Exclude = "Img")] City city,HttpPostedFileBase Img)
        {
            if (Extension.CheckImg(Img, Extension.MAxfileSize))
            {
                try
                {
                    city.Photo = Extension.SaveImg(Img, "~/Public/Home");

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

            if (ModelState.IsValid)
            {
                db.Cities.Add(city);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(city);
        }

        // GET: admin/Cities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: admin/Cities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Photo,Img")] City city,HttpPostedFileBase Photo)
        {

            if (Photo != null)
            {

                if (Extension.CheckImg(Photo, Extension.MAxfileSize))
                {
                    string filename;
                    try
                    {
                        filename = Extension.SaveImg(Photo, "~/Public/Home");

                    }
                    catch (Exception)
                    {
                        ModelState.AddModelError("Img", "Dont correct");
                        return RedirectToAction("Index");
                    }

                    Extension.Deletimg("~/Public/Home", city.Photo);

                    city.Photo = filename;
                }
                else
                {
                    ModelState.AddModelError("Img", "Dont correct");
                    return RedirectToAction("Index");
                }
            }

            if (ModelState.IsValid)
            {
                db.Entry(city).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(city);
        }

        // GET: admin/Cities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: admin/Cities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

          
            City city = db.Cities.Find(id);
            try
            {

                Extension.Deletimg("~/Public/Home", city.Photo);
            }
            catch
            {

                return RedirectToAction("index");
            }
            db.Cities.Remove(city);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
