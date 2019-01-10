using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ASPFINAL.Models;

namespace ASPFINAL.Areas.admin.Controllers
{
    public class WorkHoursController : Controller
    {
        private AspFinalNewEntities db = new AspFinalNewEntities();

        // GET: admin/WorkHours
        public ActionResult Index()
        {
            var workHours = db.WorkHours.Include(w => w.Place);
            return View(workHours.ToList());
        }

        // GET: admin/WorkHours/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkHour workHour = db.WorkHours.Find(id);
            if (workHour == null)
            {
                return HttpNotFound();
            }
            return View(workHour);
        }

        // GET: admin/WorkHours/Create
        public ActionResult Create()
        {
            ViewBag.PlaceId = new SelectList(db.Places, "Id", "Name");
            return View();
        }

        // POST: admin/WorkHours/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,PlaceId,Weekno,OpenHour,CloseHour")] WorkHour workHour)
        {
            if (ModelState.IsValid)
            {
                db.WorkHours.Add(workHour);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PlaceId = new SelectList(db.Places, "Id", "Name", workHour.PlaceId);
            return View(workHour);
        }

        // GET: admin/WorkHours/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkHour workHour = db.WorkHours.Find(id);
            if (workHour == null)
            {
                return HttpNotFound();
            }
            ViewBag.PlaceId = new SelectList(db.Places, "Id", "Name", workHour.PlaceId);
            return View(workHour);
        }

        // POST: admin/WorkHours/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,PlaceId,Weekno,OpenHour,CloseHour")] WorkHour workHour)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workHour).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PlaceId = new SelectList(db.Places, "Id", "Name", workHour.PlaceId);
            return View(workHour);
        }

        // GET: admin/WorkHours/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkHour workHour = db.WorkHours.Find(id);
            if (workHour == null)
            {
                return HttpNotFound();
            }
            return View(workHour);
        }

        // POST: admin/WorkHours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkHour workHour = db.WorkHours.Find(id);
            db.WorkHours.Remove(workHour);
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
