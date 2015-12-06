using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Models
{
    public class Category
    {
        [Required(ErrorMessage="Category must be selected")]
        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }
    }
}
