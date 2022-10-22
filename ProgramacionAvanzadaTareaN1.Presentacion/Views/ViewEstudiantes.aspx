<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEstudiantes.aspx.cs" Inherits="ProgramacionAvanzadaTareaN1.Presentacion.Views.ViewEstudiantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Registro de Estudiantes</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10">
                <asp:TextBox ID="TextBoxBuscar" runat="server" Width="300px" CssClass="form-control form-control-sm mr-2"></asp:TextBox>
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" OnClick="ButtonBuscar_Click" CssClass="btn btn-sm btn-primary" />
            </div>
            <div class="col-md-2 text-right">
                <asp:Button ID="ButtonNuevo" runat="server" Text="Nuevo" CssClass="btn btn-sm btn-primary" />
            </div>
        </div>
         <div class="row mt-2">
            <div class="col-md-12">
                <asp:GridView ID="GridViewEstudiantes" CssClass="table"
                    runat="server" AllowPaging="True" PageSize="10" 
                    AutoGenerateColumns="False" ForeColor="#333333" 
                    GridLines="None" Width="100%" CellSpacing="1"  
                    DataKeyNames="Identificacion"
                    EmptyDataText="Sin datos resultantes."
                    OnPageIndexChanging="GridViewEstudiantes_PageIndexChanging" 
                    OnSelectedIndexChanged="GridViewEstudiantes_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificación" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido1" HeaderText="1° Apellido" />
                        <asp:BoundField DataField="Apellido2" HeaderText="2° Apellido" />
                        <asp:BoundField DataField="FNacimiento" HeaderText="Nacimiento" DataFormatString="{0:d}"/>
                        <asp:BoundField DataField="FIngreso" HeaderText="Fecha Ingreso" DataFormatString="{0:d}"/>
                        <asp:TemplateField ItemStyle-Width="10%" HeaderText="Detalle"> 
                            <ItemTemplate>
                                <asp:Button ID="ButtonVer" runat="server" CommandName="Select" Text="Ver" CssClass="btn btn-sm btn-primary btn-block"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#0082C8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E1E1E1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </div>
        </div>
    </div>

<ajaxtoolkit:modalpopupextender ID="ModalPopupExtender1" runat="server"
    TargetControlID="ButtonNuevo"
    PopupControlID="Panel1"
    BackgroundCssClass="modalBackground"
    CancelControlID="ButtonCancelar">
</ajaxtoolkit:modalpopupextender>

<asp:Panel ID="Panel1" runat="server" CssClass="container-fluid table" Style="width:400px; display:none;" >
    <div class="row">
        <div class="col-sm">
            <h4>Estudiante</h4>
        </div>
    </div>
    <div class="form-group">
        <label>Identificación:</label>
        <asp:TextBox ID="TextBoxId" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required" runat="server" ControlToValidate="TextBoxId" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
        <ajaxtoolkit:FilteredTextBoxExtender ID="Filtered" runat="server"  TargetControlID="TextBoxId" FilterType="Numbers" />
    </div>
    <div class="form-group">
        <label>Nombre:</label>
        <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required1" runat="server" ControlToValidate="TextBoxNombre" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Primer apellido:</label>
        <asp:TextBox ID="TextBoxApellido1" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required2" runat="server" ControlToValidate="TextBoxApellido1" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Segundo apellido:</label>
        <asp:TextBox ID="TextBoxApellido2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required3" runat="server" ControlToValidate="TextBoxApellido2" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Fecha nacimiento:</label>
        <asp:TextBox ID="TextBoxNacimiento" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <ajaxtoolkit:CalendarExtender ID="TextBoxInicial_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="TextBoxNacimiento" Format="dd/MM/yyyy">
        </ajaxtoolkit:CalendarExtender>
        <asp:RequiredFieldValidator ID="Required4" runat="server" ControlToValidate="TextBoxNacimiento" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" 
            ControlToValidate="TextBoxNacimiento" 
            Display="Dynamic" CssClass="alertLabel"
            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" 
            ValidationGroup="vgEstudiante">Formato incorrecto</asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label>Fecha ingreso:</label>
        <asp:TextBox ID="TextBoxIngreso" runat="server"  CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required5" runat="server" ControlToValidate="TextBoxIngreso" Display="Dynamic" ValidationGroup="vgEstudiante" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="row">
        <div class="col-sm text-right mt-2">
            <asp:Button ID="ButtonAceptar" runat="server" Text="Aceptar" CssClass="btn btn-sm btn-primary" ValidationGroup="vgEstudiante" OnClick="ButtonAceptar_Click" />&nbsp;
            <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" CssClass="btn btn-sm btn-secondary" UseSubmitBehavior="false" OnClick="ButtonCancelar_Click" />
        </div>
    </div>
</asp:Panel>

</asp:Content>
