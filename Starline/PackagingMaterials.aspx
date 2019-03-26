<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="PackagingMaterials.aspx.cs" Inherits="Starline.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">PACKAGING MATERIAL</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="pakagematerialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="SUB-CATEGORY" runat="server" />
                            <asp:TextBox ID="packagescategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Enter subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="packagelength" Style="width: 325px;" CssClass="form-control" AutoPostBack="true" placeholder="Enter length" BackColor="Transparent" required="Required" runat="server" OnTextChanged="packagelength_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="packagewidth" Style="width: 325px;" CssClass="form-control" AutoPostBack="true" placeholder="Enter width" BackColor="Transparent" runat="server" required="Required" OnTextChanged="packagewidth_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SPECIFICATIONS" runat="server" />
                            <asp:TextBox ID="packagespecification" Style="width: 325px;" placeholder="Enter specifications" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM STOCK" runat="server" />
                            <asp:TextBox ID="packageministck" Style="width: 325px;" placeholder="Enter minimumstock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="packagecategory" Style="width: 325px;" placeholder="Enter category" ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="packagmaterial" Style="width: 325px;" placeholder="Enter uom" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="UOM" runat="server" />
                            <asp:DropDownList ID="ddluom" Style="width: 325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server">
                                <asp:ListItem>Select Craft</asp:ListItem>
                                <asp:ListItem>KG</asp:ListItem>
                                <asp:ListItem>Feet</asp:ListItem>
                                <asp:ListItem>Inch</asp:ListItem>
                                <asp:ListItem>Grams</asp:ListItem>
                                <asp:ListItem>Bottle</asp:ListItem>
                                <asp:ListItem>Number</asp:ListItem>
                                <asp:ListItem>MM</asp:ListItem>
                                <asp:ListItem>Kilogram</asp:ListItem>
                                <asp:ListItem>Ply</asp:ListItem>
                                <asp:ListItem>Meter</asp:ListItem>
                                <asp:ListItem>GSM</asp:ListItem>
                                <asp:ListItem>BS</asp:ListItem>
                                <asp:ListItem>Box</asp:ListItem>
                                <asp:ListItem>Roll</asp:ListItem>
                                <asp:ListItem>Pockets</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="packagesize" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="packageavailable" Style="width: 325px;" placeholder="Enter available stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                            <div class="form-group">
                                <asp:Label ID="Label12" Text="HEIGHT" runat="server" />
                                <asp:TextBox ID="packageheight" Style="width: 325px;" placeholder="Enter available stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="packageheight_TextChanged" />
                            </div>
                        </div>

                    </div>

                </div>

                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>
                    </div>
                </div>
            </div>
             
            <%--<asp:GridView ID="gvr" runat="server"></asp:GridView>--%>
            <div class="container-fluid">

                <div class="row" >
                    <div class="col-lg-12" style="overflow-x: auto">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [mpackingmaterial] WHERE [pacid] = @pacid" InsertCommand="INSERT INTO [mpackingmaterial] ([pacmaterialcode], [pacsubcategory], [paclength], [pacheight], [pacwidth], [pacspecifications], [pacminimum], [paccategory], [pacmaterial], [pacluom], [pacsize], [pactotalqty]) VALUES (@pacmaterialcode, @pacsubcategory, @paclength, @pacheight, @pacwidth, @pacspecifications, @pacminimum, @paccategory, @pacmaterial, @pacluom, @pacsize, @pactotalqty)" SelectCommand="SELECT * FROM [mpackingmaterial]" UpdateCommand="UPDATE [mpackingmaterial] SET [pacmaterialcode] = @pacmaterialcode, [pacsubcategory] = @pacsubcategory, [paclength] = @paclength, [pacheight] = @pacheight, [pacwidth] = @pacwidth, [pacspecifications] = @pacspecifications, [pacminimum] = @pacminimum, [paccategory] = @paccategory, [pacmaterial] = @pacmaterial, [pacluom] = @pacluom, [pacsize] = @pacsize, [pactotalqty] = @pactotalqty WHERE [pacid] = @pacid">
                            <DeleteParameters>
                                <asp:Parameter Name="pacid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="pacmaterialcode" Type="String" />
                                <asp:Parameter Name="pacsubcategory" Type="String" />
                                <asp:Parameter Name="paclength" Type="String" />
                                <asp:Parameter Name="pacheight" Type="String" />
                                <asp:Parameter Name="pacwidth" Type="String" />
                                <asp:Parameter Name="pacspecifications" Type="String" />
                                <asp:Parameter Name="pacminimum" Type="Decimal" />
                                <asp:Parameter Name="paccategory" Type="String" />
                                <asp:Parameter Name="pacmaterial" Type="String" />
                                <asp:Parameter Name="pacluom" Type="String" />
                                <asp:Parameter Name="pacsize" Type="String" />
                                <asp:Parameter Name="pactotalqty" Type="Decimal" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="pacmaterialcode" Type="String" />
                                <asp:Parameter Name="pacsubcategory" Type="String" />
                                <asp:Parameter Name="paclength" Type="String" />
                                <asp:Parameter Name="pacheight" Type="String" />
                                <asp:Parameter Name="pacwidth" Type="String" />
                                <asp:Parameter Name="pacspecifications" Type="String" />
                                <asp:Parameter Name="pacminimum" Type="Decimal" />
                                <asp:Parameter Name="paccategory" Type="String" />
                                <asp:Parameter Name="pacmaterial" Type="String" />
                                <asp:Parameter Name="pacluom" Type="String" />
                                <asp:Parameter Name="pacsize" Type="String" />
                                <asp:Parameter Name="pactotalqty" Type="Decimal" />
                                <asp:Parameter Name="pacid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="pacid" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="pacid" HeaderText="pacid" InsertVisible="False" ReadOnly="True" SortExpression="pacid" />
                                <asp:BoundField DataField="pacmaterialcode" HeaderText="pacmaterialcode" SortExpression="pacmaterialcode" />
                                <asp:BoundField DataField="pacsubcategory" HeaderText="pacsubcategory" SortExpression="pacsubcategory" />
                                <asp:BoundField DataField="paclength" HeaderText="paclength" SortExpression="paclength" />
                                <asp:BoundField DataField="pacheight" HeaderText="pacheight" SortExpression="pacheight" />
                                <asp:BoundField DataField="pacwidth" HeaderText="pacwidth" SortExpression="pacwidth" />
                                <asp:BoundField DataField="pacspecifications" HeaderText="pacspecifications" SortExpression="pacspecifications" />
                                <asp:BoundField DataField="pacminimum" HeaderText="pacminimum" SortExpression="pacminimum" />
                                <asp:BoundField DataField="paccategory" HeaderText="paccategory" SortExpression="paccategory" />
                                <asp:BoundField DataField="pacmaterial" HeaderText="pacmaterial" SortExpression="pacmaterial" />
                                <asp:TemplateField HeaderText="pacluom" SortExpression="pacluom">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="pacluom" DataValueField="pacluom" SelectedValue='<%# Bind("pacluom", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [pacluom] FROM [mpackingmaterial]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("pacluom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="pacsize" HeaderText="pacsize" SortExpression="pacsize" />
                                <asp:BoundField DataField="pactotalqty" HeaderText="pactotalqty" SortExpression="pactotalqty" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        </div>
                    </div>
                </div>
            <div>
                <br />
                <br />
                <br />
                <br />
            </div>
       </section>
    </section>
</asp:Content>
