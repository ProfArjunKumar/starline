<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" CodeBehind="ReturnStock.aspx.cs" Inherits="Starline.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width:800px;margin-right:50px">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">RETURN STOCK</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="DAILY USAGE ID" runat="server" />
                            <asp:DropDownList ID="ddluasgeid" runat="server" OnSelectedIndexChanged="ddluasgeid_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="DATE" runat="server" />
                            <asp:TextBox ID="returndate" Style="width: 325px;" PLACEHOLDER="Enter date" CssClass="form-control" BackColor="Transparent" runat="server" />


                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="MATERIAL CODE" runat="server" />
                            <asp:TextBox ID="returnmaterialcode" ReadOnly="true" Style="width: 325px;" placeholder="Enter material code" CssClass="form-control" BackColor="Transparent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="CATEGORY" runat="server" />
                            <asp:TextBox runat="server" ReadOnly="true" ID="returncategory" Style="width: 325px;" placeholder="Enter category" CssClass="form-control" BackColor="Transparent" />
                         
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SUB-CATEGORY" runat="server" />
                            <asp:TextBox ID="returnsubcategory" Style="width: 325px;" placeholder="Enter subcategory" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="returnmaterial" Style="width: 325px;" placeholder="Enter Material" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="AVAILABLE QUANTITY" runat="server" />
                            <asp:TextBox ID="returnavailablequantity" Style="width: 325px;" ReadOnly="true" placeholder="Enter availablequantity" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="REQUIRED" runat="server" />
                            <asp:TextBox ID="returnrequired" Style="width: 325px;" BackColor="Transparent" placeholder="Enter required" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label13" Text="WORK ORDER" runat="server" />
                            <asp:TextBox ID="returnworkorder" Style="width: 325px;" placeholder="Enter work order" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="EMPLOYEE NAME" runat="server" />
                            <asp:TextBox ID="returnemployeename" Style="width: 325px;" ReadOnly="true" placeholder="Enter EmployeeName"  BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="OLD DATE" runat="server" />
                            <asp:TextBox ID="returnolddate" Style="width: 325px;" placeholder="Enter old date" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="RETURN" runat="server" />
                            <asp:TextBox ID="returnreturn" Style="width: 325px;" placeholder="Enter return" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="EMPLOYEE NAME" runat="server" />
                            <asp:TextBox ID="returnemployeenamee" Style="width: 325px;" placeholder="Enter employee name" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>                    
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label15" Text="COMMENT" runat="server" />
                            <asp:TextBox ID="returnComment" Style="width: 325px;" placeholder="Enter required comment" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    </div>
             
                <div class="row">
                    <div class="col-sm-6" style="margin-left: 300px">
                        <div class="form-group">
                            <asp:Button ID="btn" Text="Submit" CssClass="btn btn-success col-sm-4" runat="server" OnClick="btn_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" >
                    <div class="row" style="width: 1000px;">
                         <div class="col-sm-6" style="margin-left:617px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                        <asp:GridView ID="Gridview1" Style="margin-right:500px" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="50px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="id">

                            <Columns>
                                <asp:BoundField DataField="DailyUsageId" HeaderText="DailyUsageId" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="MaterialCode" HeaderText="MaterialCode" />
                                <asp:BoundField DataField="Catgery" HeaderText="Catgery" />
                                <asp:BoundField DataField="SubCatgery" HeaderText="SubCatgery" />
                                <asp:BoundField DataField="Material" HeaderText="Material" />
                                <asp:BoundField DataField="AvailbileQuty" HeaderText="AvailbileQuty" />
                                <asp:BoundField DataField="Required" HeaderText="Required" />
                                <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                                 <asp:BoundField DataField="oldDate" HeaderText="oldDate" />
                                 <asp:BoundField DataField="Return" HeaderText="Return" />
                                 <asp:BoundField DataField="Ename" HeaderText="Ename" />
                                 <asp:BoundField DataField="Comment" HeaderText="Comment" />
                            </Columns>
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
                                $('[id*=Gridview1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                                    "responsive": true,
                                    "sPaginationType": "full_numbers"
                                });
                            });
                        </script>
                    </div>
                </div>
            <div>
                <br />
                 <br /> <br /> <br /> <br />
            </div>
        </section>
    </section>
</asp:Content>
