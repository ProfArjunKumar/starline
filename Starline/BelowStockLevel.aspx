<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="BelowStockLevel.aspx.cs" Inherits="Starline.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">BELOW STOCK LEVEL</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CATEGORY" runat="server" />
                            <asp:TextBox ID="bslmaterialcategory" Style="width: 325px;" Autopostback="true" placeholder="Enter materialcategory" CssClass="form-control"  BackColor="Transparent" required="Required" runat="server" />
                            
                        </div>
                    </div>
                    <%--<div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="bsldate" Style="width: 325px;" CssClass="form-control" TextMode="Date"  PLACEHOLDER="Enter date" BackColor="Transparent" required="Required" runat="server" />
                           
                        </div>
                    </div>--%>
                    </div>
              
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" />
                            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
