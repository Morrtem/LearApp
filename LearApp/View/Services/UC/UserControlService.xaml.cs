using LearApp.Core;
using LearApp.Data;
using LearApp.View.Services.Pages;
using LearApp.View.Services.Windows;
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

namespace LearApp.View.Services.UC
{
    /// <summary>
    /// Логика взаимодействия для UserControlService.xaml
    /// </summary>
    public partial class UserControlService : UserControl
    {
        private Service _service;

        public UserControlService(Service service)
        {
            InitializeComponent();
            DataContext = service;
            this._service = service;
            ServicePhoto();
            CheckAdmin();
        }
        private void ServicePhoto()
        {
            if (_service.MainImagePath == null || _service.MainImagePath.Length < 1)
                ImageSource.Source = (ImageSource)new ImageSourceConverter().ConvertFromString("Resources/school_logo.png");
            else if (_service.MainImagePath.Length > 1 && _service.MainImagePath != null)
                ImageSource.Source = (ImageSource)new ImageSourceConverter().ConvertFromString(@"Resources\"+_service.MainImagePath);
        }
        private void CheckAdmin()
        {
            if (WindowAuthorization.RoleNow == "Admin")
                DGAdmin.Visibility = Visibility.Visible;
            else
                DGAdmin.Visibility = Visibility.Hidden;
        }
        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.FrameNavigate.Navigate(new PageAddEditService(_service));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedForDelete = _service;
            if (selectedForDelete != null)
            { 
                if (MessageBox.Show($"Вы действительно хотите удалить элемент: {selectedForDelete.Title}", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    try
                    {
                        Manager.GetContext().Service.Remove(selectedForDelete);
                        Manager.GetContext().SaveChanges();
                        MessageBox.Show("Данные удалены");
                        Manager.FrameNavigate.Navigate(new PageServices());
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            } else 
                MessageBox.Show("Для удаления необходимо выбрать элементы");
        }
    }
}
