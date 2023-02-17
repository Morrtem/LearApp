using LearApp.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace LearApp.Core
{
    internal class Manager
    {
        public static Frame FrameNavigate { get; set; }

        private static SchoolEntities _context;
        public static SchoolEntities GetContext()
        {
            if (_context == null)
                _context = new SchoolEntities();
            return _context;
        }
    }
}
