<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="SupplierMaster.aspx.cs" Inherits="Starline.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">SUPPLIER DETAILS</h3>
                </div>
                <div class="row" style="margin-top:25px; margin-left:-15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="SUPPLIER ID" runat="server" />
                            <asp:TextBox ID="txtsupplierid" Style="width:325px;" CssClass="form-control" ReadOnly="true" BackColor="Transparent"  required="Required" runat="server" />
                        </div>
                   </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="txtdate" ReadOnly="true" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUPPLIER NAME" runat="server" />
                            <asp:TextBox ID="txtsuppliername" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required"  runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="CONTACT NAME" runat="server" />
                            <asp:TextBox ID="txtcontactname" Style="width:325px;" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="PHONE NUMBER" runat="server" />
                            <asp:TextBox ID="txtphonenumber" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="ADDRESS" runat="server" />
                            <asp:TextBox ID="txtaddress" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="EAMIL ID" runat="server" />
                            <asp:TextBox ID="txtemailid" Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                        </div>
                    <div class="col-sm-6">
                         <div class="form-group">
                            <asp:Label ID="Label9" Text="TAX" runat="server" />
                             <asp:DropDownList runat="server" ID="ddltax"  Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required">
                                <asp:ListItem>--Select TAX--</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                             </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                         <div class="form-group">
                            <asp:Label ID="Label5" Text="HSN CODE" runat="server" />
                             <asp:DropDownList ID="ddlhsncode" runat="server"  Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required">
                              <asp:ListItem>--Select HSN--</asp:ListItem>
                                                    <asp:ListItem>48081000</asp:ListItem>
                                                    <asp:ListItem>44151000</asp:ListItem>
                                                    <asp:ListItem>39201019</asp:ListItem>
                                                    <asp:ListItem>84671900</asp:ListItem>
                                                    <asp:ListItem>84671110</asp:ListItem>
                                                    <asp:ListItem>39239090</asp:ListItem>
                                                    <asp:ListItem>7326</asp:ListItem>
                                                    <asp:ListItem>3920</asp:ListItem>
                                                    <asp:ListItem>8207</asp:ListItem>
                                                    <asp:ListItem>39199090</asp:ListItem>
                                                    <asp:ListItem>9967</asp:ListItem>
                                                    <asp:ListItem>38249025</asp:ListItem>
                                                    <asp:ListItem>39209939</asp:ListItem>
                                                    <asp:ListItem>39201012</asp:ListItem>
                                                    <asp:ListItem>28272000</asp:ListItem>
                                                    <asp:ListItem>3811</asp:ListItem>
                                                    <asp:ListItem>39269099</asp:ListItem>  
                             </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                         <div class="form-group">
                            <asp:Label ID="Label10" Text="PRODUCTS" runat="server" />
                             <asp:DropDownList ID="ddlproduct" runat="server"  Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required">
                                <asp:ListItem>--Select Craft--</asp:ListItem>
                                                    <asp:ListItem>Carton boxes &amp; Corrugated sheets</asp:ListItem>
                                                    <asp:ListItem>Wood &amp; Plywood boxes</asp:ListItem>
                                                    <asp:ListItem>Carton box with pallet</asp:ListItem>
                                                    <asp:ListItem>Wooden box with pallet &amp; 
                                                Packing materials</asp:ListItem>
                                                    <asp:ListItem>Foam,Instapack foam</asp:ListItem>
                                                    <asp:ListItem>Polythene Cover</asp:ListItem>
                                                    <asp:ListItem>Pneumatic stapling machine</asp:ListItem>
                                                    <asp:ListItem>Pnuematic screw driver</asp:ListItem>
                                                    <asp:ListItem>Edge protector/L-corner clips</asp:ListItem>
                                                    <asp:ListItem>Lashing Blet</asp:ListItem>
                                                    <asp:ListItem>Bale Patti</asp:ListItem>
                                                    <asp:ListItem>Die Charges</asp:ListItem>
                                                    <asp:ListItem>4 corrugation gum tape</asp:ListItem>
                                                    <asp:ListItem>Separate Transportation Charges</asp:ListItem>
                                                    <asp:ListItem>Silica Gel</asp:ListItem>
                                                    <asp:ListItem>Alu Foil Cover</asp:ListItem>
                                                    <asp:ListItem>Container Dry</asp:ListItem>
                                                    <asp:ListItem>VCI Pouches</asp:ListItem>
                                                    <asp:ListItem>HDPE Cover</asp:ListItem>
                             </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit"  CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>                        
                    </div>
                </div>
            </div>
              <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
            <div class="container-fluid">

                <div class="row" >
                    <div class="col-lg-12" style="overflow-x: auto">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [vendor] WHERE [id] = @id" InsertCommand="INSERT INTO [vendor] ([suplierid], [supliername], [phoneno], [products], [tax], [date], [contactperson], [emailid], [hsncode], [address]) VALUES (@suplierid, @supliername, @phoneno, @products, @tax, @date, @contactperson, @emailid, @hsncode, @address)" SelectCommand="SELECT * FROM [vendor]" UpdateCommand="UPDATE [vendor] SET [suplierid] = @suplierid, [supliername] = @supliername, [phoneno] = @phoneno, [products] = @products, [tax] = @tax, [date] = @date, [contactperson] = @contactperson, [emailid] = @emailid, [hsncode] = @hsncode, [address] = @address WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="suplierid" Type="String" />
                                <asp:Parameter Name="supliername" Type="String" />
                                <asp:Parameter Name="phoneno" Type="String" />
                                <asp:Parameter Name="products" Type="String" />
                                <asp:Parameter Name="tax" Type="String" />
                                <asp:Parameter Name="date" Type="String" />
                                <asp:Parameter Name="contactperson" Type="String" />
                                <asp:Parameter Name="emailid" Type="String" />
                                <asp:Parameter Name="hsncode" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="suplierid" Type="String" />
                                <asp:Parameter Name="supliername" Type="String" />
                                <asp:Parameter Name="phoneno" Type="String" />
                                <asp:Parameter Name="products" Type="String" />
                                <asp:Parameter Name="tax" Type="String" />
                                <asp:Parameter Name="date" Type="String" />
                                <asp:Parameter Name="contactperson" Type="String" />
                                <asp:Parameter Name="emailid" Type="String" />
                                <asp:Parameter Name="hsncode" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="id" HeaderStyle-Height="40px" HeaderStyle-Width="20px" HeaderStyle-HorizontalAlign="Center" RowStyle-Height="40px" RowStyle-Width="20px" RowStyle-HorizontalAlign="Center" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="suplierid" HeaderText="suplierid" SortExpression="suplierid" />
                                <asp:BoundField DataField="supliername" HeaderText="supliername" SortExpression="supliername" />
                                <asp:BoundField DataField="phoneno" HeaderText="phoneno" SortExpression="phoneno" />
                                <asp:TemplateField HeaderText="products" SortExpression="products">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="products" DataValueField="products" SelectedValue='<%# Bind("products", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [products] FROM [vendor]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("products") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="tax" SortExpression="tax">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="tax" DataValueField="tax" SelectedValue='<%# Bind("tax", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [tax] FROM [vendor]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("tax") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                <asp:BoundField DataField="contactperson" HeaderText="contactperson" SortExpression="contactperson" />
                                <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                                <asp:TemplateField HeaderText="hsncode" SortExpression="hsncode">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="hsncode" DataValueField="hsncode" SelectedValue='<%# Bind("hsncode", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [hsncode] FROM [vendor]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("hsncode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
                        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
                        <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
                        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            $(function () {
                                $('[id*=GridView1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
                    </div>
                </div>
                </div>
            <div>
                <br />
                 <br /> <br /> <br /> <br />
            </div>
        </section>
    </section>
</asp:Content>
