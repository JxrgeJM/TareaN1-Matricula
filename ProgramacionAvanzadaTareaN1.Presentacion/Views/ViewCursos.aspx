<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCursos.aspx.cs" Inherits="ProgramacionAvanzadaTareaN1.Presentacion.Views.ViewCursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Registro de Cursos</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownListEscuela1" runat="server" DataValueField="Id" DataTextField="Nombre" Width="200px" 
                    CssClass="form-control form-control-sm mr-2" AutoPostBack="true" 
                    OnSelectedIndexChanged="FiltrarCursos_Event"></asp:DropDownList>
                <asp:TextBox ID="TextBoxBuscar" runat="server" Width="300px" CssClass="form-control form-control-sm mr-2"></asp:TextBox>
                <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" OnClick="FiltrarCursos_Event" CssClass="btn btn-sm btn-primary" />
            </div>
            <div class="col-md-2 text-right">
                <asp:Button ID="ButtonNuevo" runat="server" Text="Nuevo" CssClass="btn btn-sm btn-primary" />
            </div>
        </div>
         <div class="row mt-2">
            <div class="col-md-12">
                <asp:GridView ID="GridViewCursos" CssClass="table"
                    runat="server" AllowPaging="True" PageSize="10" 
                    AutoGenerateColumns="False" ForeColor="#333333" 
                    GridLines="None" Width="100%" CellSpacing="1"  
                    DataKeyNames="Id"
                    EmptyDataText="Sin datos resultantes."
                    OnPageIndexChanging="GridViewCursos_PageIndexChanging" 
                    OnSelectedIndexChanged="GridViewCursos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Identificación" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="Costo" HeaderText="Costo" DataFormatString="{0:c}"/>
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
            <h4>Curso</h4>
        </div>
    </div>
    <div class="form-group">
        <label>Escuela:</label>
        <asp:DropDownList ID="DropDownListEscuela2" runat="server" DataValueField="Id" DataTextField="Nombre" CssClass="form-control form-control-sm mr-2"></asp:DropDownList>
    </div>
    <div class="form-group">
        <label>Identificación:</label>
        <asp:TextBox ID="TextBoxId" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required" runat="server" ControlToValidate="TextBoxId" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
        <ajaxtoolkit:FilteredTextBoxExtender ID="Filtered" runat="server"  TargetControlID="TextBoxId" FilterType="Numbers" />
    </div>
    <div class="form-group">
        <label>Nombre:</label>
        <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required1" runat="server" ControlToValidate="TextBoxNombre" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Descripcion:</label>
        <asp:TextBox ID="TextBoxDescripcion" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required2" runat="server" ControlToValidate="TextBoxDescripcion" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Costo:</label>
        <asp:TextBox ID="TextBoxCosto" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required3" runat="server" ControlToValidate="TextBoxCosto" Display="Dynamic" ValidationGroup="vgCurso" CssClass="alertLabel">Requerido</asp:RequiredFieldValidator>
        <ajaxtoolkit:FilteredTextBoxExtender ID="Filtered2" runat="server"  TargetControlID="TextBoxCosto" FilterType="Custom" ValidChars="0123456789.," />
    </div>
    <div class="row">
        <div class="col-sm text-right mt-2">
            <asp:Button ID="ButtonAceptar" runat="server" Text="Aceptar" CssClass="btn btn-sm btn-primary" ValidationGroup="vgCurso" OnClick="ButtonAceptar_Click" />&nbsp;
            <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" CssClass="btn btn-sm btn-secondary" UseSubmitBehavior="false" OnClick="ButtonCancelar_Click" />
        </div>
    </div>
</asp:Panel>
</asp:Content>
