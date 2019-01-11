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
    public class BlogsController : Controller
    {
        private AspFinalNewEntities db = new AspFinalNewEntities();

        // GET: admin/Blogs
        public ActionResult Index()
        {
            return View(db.Blogs.ToList());
        }

        // GET: admin/Blogs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // GET: admin/Blogs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/Blogs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Exclude = "Img")] Blog blog,HttpPostedFileBase Img)
        {
            if (Extension.CheckImg(Img, Extension.MAxfileSize))
            {
                try
                {
                    blog.Photo = Extension.SaveImg(Img, "~/Public/Blog");

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
                blog.Date = DateTime.Now;
                db.Blogs.Add(blog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(blog);
        }

        // GET: admin/Blogs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // POST: admin/Blogs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Slogan,Date,Text,Photo")] Blog blog,HttpPostedFileBase Photo)
        {
            if (ModelState.IsValid)
            {

                if (Photo != null)
                {

                    if (Extension.CheckImg(Photo, Extension.MAxfileSize))
                    {
                        string filename;
                        try
                        {
                            filename = Extension.SaveImg(Photo, "~/Public/Blog");

                        }
                        catch (Exception)
                        {
                            ModelState.AddModelError("Img", "Dont correct");
                            return RedirectToAction("Index");
                        }

                        Extension.Deletimg("~/Public/Home", blog.Photo);

                        blog.Photo = filename;
                    }
                    else
                    {
                        ModelState.AddModelError("Img", "Dont correct");
                        return RedirectToAction("Index");
                    }
                }
                db.Entry(blog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(blog);
        }

        // GET: admin/Blogs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // POST: admin/Blogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Blog blog = db.Blogs.Find(id);
            try
            {

                Extension.Deletimg("~/Public/Blog", blog.Photo);
            }
            catch
            {

                return RedirectToAction("index");
            }
            db.Blogs.Remove(blog);
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
