using LearApp.Core;
using LearApp.Data;
using LearApp.View.Services.UC;
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
    /// Логика взаимодействия для PageAddEditService.xaml
    /// </summary>
    public partial class PageAddEditService : Page
    {
        private Service _service;
        private SchoolEntities data = Manager.GetContext();

        public PageAddEditService(Service service)
        {
            InitializeComponent();
            this._service = service;
            DataContext = _service;
            if (_service == null)
            {
                _service = new Service(); 
                _service.MainImagePath = null;
            } 
            ServicePhoto();
        }

        private void ServicePhoto()
        {
            if (_service.MainImagePath == null || _service.MainImagePath.Length < 1)
                ImageSource.Source = (ImageSource)new ImageSourceConverter().ConvertFromString("Resources/school_logo.png");
            else if (_service.MainImagePath.Length > 1 && _service.MainImagePath != null)
                ImageSource.Source = (ImageSource)new ImageSourceConverter().ConvertFromString(@"Resources\" + _service.MainImagePath);
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        { 
            try
            {
            _service.Title = TbTitle.Text;
            _service.Description = TbDescription.Text;
            _service.Cost = Convert.ToDecimal(TbCost.Text.Replace(".", ",").Trim());
            _service.Discount = Convert.ToDouble(TbDicount.Text);
            _service.DurationInSeconds = Convert.ToInt32(TbDurationSeconds.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Заполните все поля");
            }
           
            if (_service.ID == 0)
                data.Service.Add(_service);
            try
            {
                Manager.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Manager.FrameNavigate.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка" + ex.Message.ToString());
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.FrameNavigate.GoBack();
        }
    }
}
