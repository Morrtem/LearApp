using LearApp.View.Services.Pages;
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
using System.Windows.Shapes;

namespace LearApp.View.Services.Windows
{
    /// <summary>
    /// Логика взаимодействия для WindowSchool.xaml
    /// </summary>
    public partial class WindowSchool : Window
    {
        public WindowSchool()
        {
            InitializeComponent();
            ContextLoad();
        }

        private void ContextLoad()
        {
            FrameMain.Navigate(new PageMenu());
            Core.Manager.FrameNavigate = FrameMain;
            ImageMain.Source = (ImageSource)new ImageSourceConverter().ConvertFromString("Resources/school_logo.png");
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Core.Manager.FrameNavigate.GoBack();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            Window windowMain = new WindowAuthorization();
            windowMain.Show();
            this.Close();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите закрыть программу?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }

        private void FrameMain_ContentRendered(object sender, EventArgs e)
        {
            if (FrameMain.CanGoBack)
                BtnBack.Visibility = Visibility.Visible;
            else
                BtnBack.Visibility = Visibility.Hidden;
        }
    }
}
