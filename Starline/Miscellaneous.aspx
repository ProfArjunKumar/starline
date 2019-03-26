<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Miscellaneous.aspx.cs" Inherits="Starline.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">MISCELLANEOUS</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="mismaterialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="miscategory" Style="width: 325px;" CssClass="form-control"  PLACEHOLDER="Enter category" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUB-CATEGORY" runat="server" />
                            <asp:TextBox ID="missubcategory" Style="width: 325px;" CssClass="form-control" placeholder="Enter subcategory" BackColor="Transparent" required="Required" runat="server" />
                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="mismaterial" Style="width: 325px;" CssClass="form-control"  placeholder="Enter material" BackColor="Transparent" required="Required" runat="server" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="mislength" Style="width: 325px;" AutoPostBack="true" placeholder="Enter length" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="mislength_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="miswidth" Style="width: 325px;" placeholder="Enter width" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="miswidth_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="HEIGHT" runat="server" />
                            <asp:TextBox ID="misheight" Style="width: 325px;" placeholder="Enter height" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="misheight_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="missize" Style="width: 325px;" BackColor="Transparent" placeholder="Enter size" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="UOM" runat="server" />
                            <%--<asp:TextBox ID="misuom" Style="width: 325px;" placeholder="Enter uom" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />--%>
                            <asp:DropDownList runat="server" ID="muom"  Style="width:325px;" BackColor="Transparent" CssClass="form-control" required="Required">
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
                            <asp:Label ID="Label10" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="misavailablestock" Style="width: 325px;" placeholder="Enter availablestock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server"/> 
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="MIN QTY LEVEL" runat="server" />
                            <asp:TextBox ID="misminqtylevel" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    
                    </div>
              
                <br />
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" style="left: 0px; top: 0px" />
                        </div>
                    </div>
                </div>
            </div>
             <div class="container-fluid">

                <div class="row" style="overflow-x: auto">
                    <div class="col-lg-12">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [miscelltab] WHERE [materialid] = @materialid" InsertCommand="INSERT INTO [miscelltab] ([category], [subc], [material], [length], [width], [height], [size], [umo], [availables], [minlevel], [misid]) VALUES (@category, @subc, @material, @length, @width, @height, @size, @umo, @availables, @minlevel, @misid)" SelectCommand="SELECT * FROM [miscelltab]" UpdateCommand="UPDATE [miscelltab] SET [category] = @category, [subc] = @subc, [material] = @material, [length] = @length, [width] = @width, [height] = @height, [size] = @size, [umo] = @umo, [availables] = @availables, [minlevel] = @minlevel, [misid] = @misid WHERE [materialid] = @materialid">
                            <DeleteParameters>
                                <asp:Parameter Name="materialid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="category" Type="String" />
                                <asp:Parameter Name="subc" Type="String" />
                                <asp:Parameter Name="material" Type="String" />
                                <asp:Parameter Name="length" Type="String" />
                                <asp:Parameter Name="width" Type="String" />
                                <asp:Parameter Name="height" Type="String" />
                                <asp:Parameter Name="size" Type="String" />
                                <asp:Parameter Name="umo" Type="String" />
                                <asp:Parameter Name="availables" Type="String" />
                                <asp:Parameter Name="minlevel" Type="String" />
                                <asp:Parameter Name="misid" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="category" Type="String" />
                                <asp:Parameter Name="subc" Type="String" />
                                <asp:Parameter Name="material" Type="String" />
                                <asp:Parameter Name="length" Type="String" />
                                <asp:Parameter Name="width" Type="String" />
                                <asp:Parameter Name="height" Type="String" />
                                <asp:Parameter Name="size" Type="String" />
                                <asp:Parameter Name="umo" Type="String" />
                                <asp:Parameter Name="availables" Type="String" />
                                <asp:Parameter Name="minlevel" Type="String" />
                                <asp:Parameter Name="misid" Type="String" />
                                <asp:Parameter Name="materialid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="materialid" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="materialid" HeaderText="materialid" InsertVisible="False" ReadOnly="True" SortExpression="materialid" />
                                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                                <asp:BoundField DataField="subc" HeaderText="subc" SortExpression="subc" />
                                <asp:BoundField DataField="material" HeaderText="material" SortExpression="material" />
                                <asp:BoundField DataField="length" HeaderText="length" SortExpression="length" />
                                <asp:BoundField DataField="width" HeaderText="width" SortExpression="width" />
                                <asp:BoundField DataField="height" HeaderText="height" SortExpression="height" />
                                <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
                                <asp:TemplateField HeaderText="umo" SortExpression="umo">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="umo" DataValueField="umo" SelectedValue='<%# Bind("umo", "{0}") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [umo] FROM [miscelltab]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("umo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="availables" HeaderText="availables" SortExpression="availables" />
                                <asp:BoundField DataField="minlevel" HeaderText="minlevel" SortExpression="minlevel" />
                                <asp:BoundField DataField="misid" HeaderText="misid" SortExpression="misid" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        </div>
                    </div>
                 </div>

           <%-- <asp:GridView ID="gvr" runat="server"></asp:GridView>--%>
        </section>
    </section>
</asp:Content>
