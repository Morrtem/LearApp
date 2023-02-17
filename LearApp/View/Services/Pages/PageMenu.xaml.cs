using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LearApp.View.Services.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageMenu.xaml
    /// </summary>
    public partial class PageMenu : Page
    {
        public PageMenu()
        {
            InitializeComponent();
        }

        private void BtnProduct_Click(object sender, RoutedEventArgs e)
        {
            // Продуктов в базе данных нет
        }

        private void BtnServices_Click(object sender, RoutedEventArgs e)
        {
            Core.Manager.FrameNavigate.Navigate(new PageServices());
        }
    }
}
