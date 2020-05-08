using SignalRApp.Models;
using SignalRDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace SignalRDemo.Controllers
{
    public class AssignmentController : ApiController
    {
        ApplicationDbContext _context;
        public AssignmentController()
        {
            _context = new ApplicationDbContext();

        }
        // GET api/<controller>
        public IHttpActionResult Get()
        {
            List <Assignment> assignments = new List<Assignment>();
            assignments = _context.Assignments.ToList();
            if(assignments == null)
            {
                return NotFound();
            }
            return Ok(assignments);
        }

        // GET api/<controller>/5
        public IHttpActionResult Get(int id)
        {
            Assignment assignment = _context.Assignments.SingleOrDefault(a => a.Id == id);
            if(assignment == null)
            {
                return NotFound();
            }

            return Ok(assignment);
            
        }

        // POST api/<controller>
        public IHttpActionResult CreateAssignment(Assignment assignment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var tempAssignment = assignment;
            _context.Assignments.Add(tempAssignment);
            _context.SaveChanges();
            return Created(new Uri(Request.RequestUri + "/" + tempAssignment.Id), tempAssignment);
        }

        // PUT api/<controller>/5
        [HttpPut]
        public IHttpActionResult UpdateAssignment(int id, Assignment assignment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var assignmentInDb = _context.Assignments.SingleOrDefault(asgn => asgn.Id == id);
            if(assignmentInDb == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }

            assignmentInDb.Status = assignment.Status;
            assignmentInDb.Title = assignment.Title;
            assignmentInDb.Description = assignment.Description;
            _context.SaveChanges();
            return Ok();
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}