using LearApp.Core;
using LearApp.Data;
using LearApp.View.Services.UC;
using LearApp.View.Services.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LearApp.View.Services.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageServices.xaml
    /// </summary>
    public partial class PageServices : Page
    {
        private SchoolEntities data = Manager.GetContext(); 
        public PageServices()
        {
            InitializeComponent();
            CheckAdmin();
            UpdateList(data.Service.ToList());
        }
        private void UpdateList(List<Service> services)
        {
            List<UserControlService> uc = new List<UserControlService>();
            foreach (Service service in services)
                UCList.Items.Add(new UserControlService(service));
            tbSearchResults.Text = UCList.Items.Count.ToString();
        }
        private void CheckAdmin()
        {
            if (WindowAuthorization.RoleNow == "Admin")
                DGAdmin.Visibility = Visibility.Visible;
            else 
                DGAdmin.Visibility = Visibility.Hidden;
        }
        private void TbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UCList.Items.Clear();
            var searchService = data.Service.ToList();
            searchService = searchService.Where(p => p.Title.ToLower().Contains(TbSearch.Text.ToLower())).ToList();
            UpdateList(searchService);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.FrameNavigate.Navigate(new PageAddEditService(null));
        }
    }
}
