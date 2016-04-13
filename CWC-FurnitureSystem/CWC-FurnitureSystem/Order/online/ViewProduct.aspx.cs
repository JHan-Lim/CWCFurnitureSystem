using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace CWC_FurnitureSystem.Order.online
{
    public partial class ViewProduct : System.Web.UI.Page
    {

        DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                bindDataList(dc.products);
                bindCategory();
                bindWarranty();
            }
        }

        void bindCategory()
        {

            ddlCategory.DataSource = (from p in dc.products
                                      where p.productStatus == "available"
                                      select p.category).Distinct().OrderBy(category => category);
            ddlCategory.DataBind();

            ddlCategory.Items.Insert(0, new ListItem("All", "All"));
        }

        void bindWarranty()
        {
            ddlWarranty.DataSource = (from p in dc.products
                                      where p.productStatus == "available"
                                      select p.warranty).Distinct().OrderBy(warranty => warranty);

            ddlWarranty.DataBind();

            ddlWarranty.Items.Insert(0, new ListItem("All", "All"));
        }

        void bindDataList(IQueryable<product> pro)
        {
            DataList1.DataSource = from p in pro
                                   where p.productStatus == "available"
                                   where p.qtyOnHand > 0
                                   let partial = (p.sellingPrice / 2)
                                   select new { p.productName, p.sellingPrice, p.url, p.productId, partial };
            DataList1.DataBind();
        }

        protected void dl_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myDropDownList = e.Item.FindControl("ddlQty") as DropDownList;
                int currentItemID = int.Parse(this.DataList1.DataKeys[e.Item.ItemIndex].ToString());

                myDropDownList.DataSource = GetDDLDataSource(currentItemID);
                myDropDownList.DataBind();
            }
        }

        List<int> GetDDLDataSource(int id)
        {
            int qty = (from p in dc.products where p.productId == id select p.qtyOnHand).First();
            List<int> number = new List<int>();
            for (int i = 1; i <= qty; i++)
            {
                number.Add(i);
            }

            return number;
        }

        protected void ddlQtySelectedIndex(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            DataListItem item = (DataListItem)ddl.NamingContainer;
            if (item != null)
            {
                int itemIndex = item.ItemIndex;
                ScriptManager.RegisterStartupScript(this, GetType(), "setQty",
                "setQty(" + ddl.Text + "," + itemIndex + ");", true);
            }
        }

        protected void imgBtnClick(object sender, EventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            DataListItem item = (DataListItem)imgBtn.NamingContainer;
            if (item != null)
            {
                int currentItemID = int.Parse(this.DataList1.DataKeys[item.ItemIndex].ToString());
                ModalPopupExtender ex = item.FindControl("mp1") as ModalPopupExtender;
                Label lblName = item.FindControl("txtName") as Label;
                Label lblPrice = item.FindControl("txtPrice") as Label;
                Label lblCategory = item.FindControl("txtCategory") as Label;
                Label lblWarranty = item.FindControl("txtWarranty") as Label;
                Label lblDesc = item.FindControl("txtDesc") as Label;
                Image img = item.FindControl("Image2") as Image;

                product pro = (from p in dc.products
                           where p.productId == currentItemID
                           select p).Single();

                lblName.Text = pro.productName;
                lblPrice.Text = pro.sellingPrice.ToString("0.00");
                lblCategory.Text = pro.category;
                lblWarranty.Text = pro.warranty.ToString();
                lblDesc.Text = "<pre>" + pro.description + "</pre>";
                img.ImageUrl = pro.url;

                ex.Show();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtProductName.Text = "";
            txtDescSearch.Text = "";
            txtMin.Text = "";
            txtMax.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlWarranty.SelectedIndex = 0;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtProductName.Text;
            string desc = txtDescSearch.Text;
            string category = ddlCategory.Text;
            string warranty = ddlWarranty.Text;
            string min = txtMin.Text;
            string max = txtMax.Text;

            IQueryable<product> p = dc.products;
            p = p.Where(s => s.productStatus == "available");
            int num1;

            if (!string.IsNullOrEmpty(name))
            {
                p = p.Where(s => s.productName.Contains(name));
            }
            if (!string.IsNullOrEmpty(desc))
            {
                p = p.Where(s => s.description.Contains(desc));
            }
            if (!string.IsNullOrEmpty(min))
            {
                decimal minD = decimal.Parse(min);
                p = p.Where(s => s.sellingPrice >= minD);
            }
            if (!string.IsNullOrEmpty(max))
            {
                decimal maxD = decimal.Parse(max);
                p = p.Where(s => s.sellingPrice <= maxD);
            }
            if (!category.Equals("All", StringComparison.OrdinalIgnoreCase))
            {
                p = p
                    .Where(s => s.category.Equals(category));
            }

            if (int.TryParse(warranty,out num1))
            {
                int n = int.Parse(warranty);
                p = p
                    .Where(s => s.warranty == n);
            }

            bindDataList(p);
        }
    }
}