<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="Steel.aspx.cs" Inherits="Starline.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;height:1000px">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">STEEL</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="steelmaterialcode" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="SUBCATEGORY" runat="server" />
                            <asp:TextBox ID="steelsubcategory" Style="width: 325px;" CssClass="form-control" PLACEHOLDER="Subcategory" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="LENGTH" runat="server" />
                            <asp:TextBox ID="steellength" Style="width: 325px;" AutoPostBack="true" CssClass="form-control" placeholder="Enter Length" BackColor="Transparent" required="Required" runat="server" OnTextChanged="steellength_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="WIDTH" runat="server" />
                            <asp:TextBox ID="steelwidth" Style="width: 325px;" CssClass="form-control" AutoPostBack="true" placeholder="Enter width" BackColor="Transparent" required="Required" runat="server" OnTextChanged="steelwidth_TextChanged" />

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SPECFIFICATION" runat="server" />
                            <asp:TextBox ID="steelspecification" Style="width: 325px;" placeholder="Enter specificatios" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM QTY LEVEL" runat="server" />
                            <asp:TextBox ID="steelminiomumqtylevel" Style="width: 325px;" placeholder="Enter Minimum qty level" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="steelcategory" Style="width: 325px;" placeholder="Enter category" ReadOnly="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="MATERIAL " runat="server" />
                            <asp:TextBox ID="steelmaterial" Style="width: 325px;" BackColor="Transparent" placeholder="Enter material" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="HEIGHT/THICKNESS" runat="server" />
                            <asp:TextBox ID="steelheight" Style="width: 325px;" placeholder="Enter height" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" OnTextChanged="steelheight_TextChanged" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="UOM" runat="server" />
                            <asp:DropDownList ID="steeluom" Style="width: 325px;" BackColor="Transparent" CssClass="form-control" required="Required" runat="server">
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
                            <asp:Label ID="Label11" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="steelsize" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="steelavailablestock" Style="width: 325px;" placeholder="Enter available Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
            <div class="container-fluid" style="overflow-x:auto">
                <div class="row">

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" DeleteCommand="DELETE FROM [msteel] WHERE [stid] = @stid" InsertCommand="INSERT INTO [msteel] ([stmaterialcode], [stsubcategory], [stlength], [stwidth], [stspecifications], [stminimum], [stcategory], [stmaterial], [stheight], [stuom], [stsize], [sttotalqty]) VALUES (@stmaterialcode, @stsubcategory, @stlength, @stwidth, @stspecifications, @stminimum, @stcategory, @stmaterial, @stheight, @stuom, @stsize, @sttotalqty)" SelectCommand="SELECT * FROM [msteel]" UpdateCommand="UPDATE [msteel] SET [stmaterialcode] = @stmaterialcode, [stsubcategory] = @stsubcategory, [stlength] = @stlength, [stwidth] = @stwidth, [stspecifications] = @stspecifications, [stminimum] = @stminimum, [stcategory] = @stcategory, [stmaterial] = @stmaterial, [stheight] = @stheight, [stuom] = @stuom, [stsize] = @stsize, [sttotalqty] = @sttotalqty WHERE [stid] = @stid">
                        <DeleteParameters>
                            <asp:Parameter Name="stid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="stmaterialcode" Type="String" />
                            <asp:Parameter Name="stsubcategory" Type="String" />
                            <asp:Parameter Name="stlength" Type="String" />
                            <asp:Parameter Name="stwidth" Type="String" />
                            <asp:Parameter Name="stspecifications" Type="String" />
                            <asp:Parameter Name="stminimum" Type="Decimal" />
                            <asp:Parameter Name="stcategory" Type="String" />
                            <asp:Parameter Name="stmaterial" Type="String" />
                            <asp:Parameter Name="stheight" Type="String" />
                            <asp:Parameter Name="stuom" Type="String" />
                            <asp:Parameter Name="stsize" Type="String" />
                            <asp:Parameter Name="sttotalqty" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="stmaterialcode" Type="String" />
                            <asp:Parameter Name="stsubcategory" Type="String" />
                            <asp:Parameter Name="stlength" Type="String" />
                            <asp:Parameter Name="stwidth" Type="String" />
                            <asp:Parameter Name="stspecifications" Type="String" />
                            <asp:Parameter Name="stminimum" Type="Decimal" />
                            <asp:Parameter Name="stcategory" Type="String" />
                            <asp:Parameter Name="stmaterial" Type="String" />
                            <asp:Parameter Name="stheight" Type="String" />
                            <asp:Parameter Name="stuom" Type="String" />
                            <asp:Parameter Name="stsize" Type="String" />
                            <asp:Parameter Name="sttotalqty" Type="Decimal" />
                            <asp:Parameter Name="stid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="stid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="stid" HeaderText="stid" InsertVisible="False" ReadOnly="True" SortExpression="stid" />
                            <asp:BoundField DataField="stmaterialcode" HeaderText="stmaterialcode" SortExpression="stmaterialcode" />
                            <asp:BoundField DataField="stsubcategory" HeaderText="stsubcategory" SortExpression="stsubcategory" />
                            <asp:BoundField DataField="stlength" HeaderText="stlength" SortExpression="stlength" />
                            <asp:BoundField DataField="stwidth" HeaderText="stwidth" SortExpression="stwidth" />
                            <asp:BoundField DataField="stspecifications" HeaderText="stspecifications" SortExpression="stspecifications" />
                            <asp:BoundField DataField="stminimum" HeaderText="stminimum" SortExpression="stminimum" />
                            <asp:BoundField DataField="stcategory" HeaderText="stcategory" SortExpression="stcategory" />
                            <asp:BoundField DataField="stmaterial" HeaderText="stmaterial" SortExpression="stmaterial" />
                            <asp:BoundField DataField="stheight" HeaderText="stheight" SortExpression="stheight" />
                            <asp:TemplateField HeaderText="stuom" SortExpression="stuom">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="stuom" DataValueField="stuom" SelectedValue='<%# Bind("stuom", "{0}") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:starlinepackersConnectionString %>" SelectCommand="SELECT DISTINCT [stuom] FROM [msteel]"></asp:SqlDataSource>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="stsize" HeaderText="stsize" SortExpression="stsize" />
                            <asp:BoundField DataField="sttotalqty" HeaderText="sttotalqty" SortExpression="sttotalqty" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </section>
    </section>
</asp:Content>
