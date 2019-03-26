<%@ Page Title="" Language="C#" MasterPageFile="~/Starline.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DailyUsage.aspx.cs" Inherits="Starline.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-content" style="background-color:white;">
        <section class="wrapper">
            <div class="container" style="width: 695px;">
                <div class="header">
                    <h3 style="color: mediumslateblue; padding: 7px; margin-top: -9px; font-size: 17px;">DAILY CONSUMPTION</h3>
                </div>
                <div class="row" style="margin-top: 25px; margin-left: -15px;">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" Text="DAILY USAGE ID" runat="server" />
                            <asp:TextBox ID="dailyusageid" Style="width: 325px;" ReadOnly="true" CssClass="form-control" BackColor="Transparent" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" Text="CATEGORY" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlcategory" Style="width: 325px;" CssClass="form-control"  BackColor="Transparent" required="Required" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged" AutoPostBack="True">
                               
                            </asp:DropDownList>
                           
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" Text="SUB-CATEGORY" runat="server" />
                            <asp:TextBox ID="dailysubcategory" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" Text="MATERIAL CODE" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlmaterial" Style="width: 325px;" CssClass="form-control"   BackColor="Transparent" OnSelectedIndexChanged="ddlmaterial_SelectedIndexChanged" AutoPostBack="True">
                              
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label6" Text="SIZE(L*W*H)" runat="server" />
                            <asp:TextBox ID="dailysize" Style="width: 325px;" placeholder="Enter size" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label7" Text="MINIMUM QUANTITY" runat="server" />
                            <asp:TextBox ID="dailyminimumquantity" Style="width: 325px;" placeholder="Enter Minimum Quantity" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label8" Text="MATERIAL" runat="server" />
                            <asp:TextBox ID="dailymaterial" Style="width: 325px;" placeholder="Enter material"  BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label9" Text="DATE" runat="server" />
                            <asp:TextBox ID="dailydate" Style="width: 325px;" BackColor="Transparent" placeholder="Enter date" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" Text="CATEGORY" runat="server" />
                            <asp:TextBox ID="ddailycategory" Style="width: 325px;" placeholder="Enter category" AutoPostBack="true" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label10" Text="OLD DATE" runat="server" />
                             <asp:TextBox ID="dailyolddate" Style="width: 325px;" placeholder="Enter old date" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label11" Text="AVAILABLE STOCK" runat="server" />
                            <asp:TextBox ID="dailyavailablestock" Style="width: 325px;" placeholder="Enter availabe Stock" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label12" Text="CUSTOMER NAME" runat="server" />
                            <asp:TextBox ID="dailycustomername" Style="width: 325px;"  placeholder="Enter customer name" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label13" Text="WORK ORDER" runat="server" />
                            <asp:TextBox ID="dailyworkorder" Style="width: 325px;"  placeholder="Enter work order" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label14" Text="PURPOSE" runat="server" />
                            <asp:TextBox ID="dailypurpose" Style="width: 325px;"  placeholder="Enter purpose" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
                        </div>
                    </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label ID="Label15" Text="REQUIRED QUANTITY" runat="server" />
                            <asp:TextBox ID="dailyrequiredquantity" Style="width: 325px;" placeholder="Enter required quantity" BackColor="Transparent" CssClass="form-control" required="Required" runat="server" />
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
            <br />
            <br />
            <br />
            
            <div class="container-fluid" >
                 <div class="col-sm-6" style="margin-left:770px;">
                        <div class="form-group">
                            <asp:Button ID="Button1" Text="ExporttoExcel" CssClass="btn btn-primary" runat="server" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <div class="row col-md-offset-0" style="width: 950px;overflow-x:auto;">
                        
                        <asp:GridView ID="Gridview1" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="YellowGreen" ClientIDMode="Static" RowStyle-BackColor="WhiteSmoke" HeaderStyle-Width="100px" HeaderStyle-Height="40px" RowStyle-Height="40px" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="dailyid" OnRowCancelingEdit="Gridview1_RowCancelingEdit1" OnRowDeleting="Gridview1_RowDeleting" OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating">

                            <Columns>
                                <asp:BoundField DataField="dailyid" HeaderText="dailyid" />
                                <asp:BoundField DataField="dailymaterialcode" HeaderText="dailymaterialcode" />
                                <asp:BoundField DataField="dailycategory" HeaderText="dailycategory" />
                                <asp:BoundField DataField="dailymaterial" HeaderText="dailymaterial" />
                                <asp:BoundField DataField="dailysize" HeaderText="dailysize" />
                                <asp:BoundField DataField="dailysubcategory" HeaderText="dailysubcategory" />
                                <asp:BoundField DataField="dailytotalquantity" HeaderText="dailytotalquantity" />
                                <asp:BoundField DataField="dailyminimumquantity" HeaderText="dailyminimumquantity" />
                                <asp:BoundField DataField="dailydate" HeaderText="dailydate" />
                                <asp:BoundField DataField="dailyemployeename" HeaderText="dailyemployeename" />
                                 <asp:BoundField DataField="dailyreqquantity" HeaderText="dailyreqquantity" />
                                 <asp:BoundField DataField="dailypurpose" HeaderText="dailypurpose" />
                                 <asp:BoundField DataField="Upadtedate" HeaderText="Upadtedate" />
                                 <asp:BoundField DataField="Work" HeaderText="Work" />
                                 <asp:BoundField DataField="DailyusageId" HeaderText="DailyusageId" />
                                <asp:CommandField ShowEditButton="true" />
                                <asp:CommandField ShowDeleteButton="true" />

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
