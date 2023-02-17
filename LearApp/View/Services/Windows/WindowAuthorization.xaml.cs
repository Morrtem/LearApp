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
    /// Логика взаимодействия для WindowAuthorization.xaml
    /// </summary>
    public partial class WindowAuthorization : Window
    {
        public static string RoleNow;
        public WindowAuthorization()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            string codeAdmin = "0000";

            if (PbPassword.Password == codeAdmin)
            {
                RoleNow = "Admin";
                Window windowMain = new WindowSchool();
                windowMain.Show();
                this.Close();
            }
            else 
                MessageBox.Show("Код введен неверно", "Внимание", MessageBoxButton.OK);
        }
    }
}
