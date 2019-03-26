<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="Starline.WebForm15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function checkEmail() {

            var email = document.getElementById('txtEmail');
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!filter.test(email.value)) {
                alert('Please provide a valid email address');
                email.focus;
                return false;
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1500px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 20px;">NEW CUSTOMER</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="CUSTOMER ID" runat="server" />
                            <asp:TextBox ID="txtcustomeid" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                          
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" ReadOnly="true" Style="width: 325px;" CssClass="form-control" BackColor="Transparent" runat="server" />                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="COMPANY NAME" runat="server" />
                            <asp:TextBox ID="txtcompanyname" Style="width: 325px;" placeholder="Enter companyname" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="CONTACT NAME" runat="server" />
                            <asp:TextBox runat="server"  ID="txtcontactename" Style="width: 325px;" placeholder="Enter contact name" CssClass="form-control" BackColor="Transparent" required="Required" /> 
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="PHONE NUMBER" runat="server" />
                            <asp:TextBox runat="server" ID="txtphonenumber" Style="width: 325px;" placeholder="Enter phone number" CssClass="form-control" BackColor="Transparent" required="Required" />
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="DESIGNATION" runat="server" />
                            <asp:TextBox ID="txtdesignation" Style="width: 325px;" placeholder="Enter designation" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label Text="EMAIL" ID="Label7" runat="server" />
                            <asp:TextBox runat="server" ID="txtemail" Style="width: 325px;" placeholder="Enter EMAIL" BackColor="Transparent" CssClass="form-control" required="Required" />
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="WORKING HOURS" runat="server" />
                            <asp:TextBox ID="txtworkinghours" Style="width: 325px;" placeholder="Enter required address" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="ADDRESS" runat="server" />
                            <asp:TextBox ID="txtaddress" Style="width: 325px;" TextMode="MultiLine" placeholder="Enter required address" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                          
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-6" style="margin-left: 300px">
                    <div class="form-group">
                        <asp:Button ID="btn" Text="Submit" Style="margin-left:115px;" CssClass="btn btn-success col-sm-4" OnClick="btn_Click" runat="server" OnClientClick="checkEmail()" />
                    </div>
                </div>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                sql<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        </section>
    </section>
</asp:Content>
