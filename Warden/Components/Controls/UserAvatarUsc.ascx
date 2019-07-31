<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAvatarUsc.ascx.cs" Inherits="Warden.Components.Controls.UserAvatarUsc" %>

<div class="col-md-4">
    <div class="card card-user">
        <div class="card-body">
            <p class="card-text">
                <div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                        <img class="avatar" src="../assets/img/emilyz.jpg" alt="...">
                        <usc:LabelUsc Text="Mike Andrew" runat="server" FontSize="11" ForeColor="white" BackColor="black"/>
                    </a>
                    <p class="description">
                        <usc:LabelUsc Text="Ceo/Co-Founder" runat="server" FontSize="12" />
                    </p>
                </div>
            </p>
            <div class="card-description">
                <usc:LabelUsc runat="server" Text="Do not be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is..." FontSize="10" />
            </div>
        </div>
        <div class="card-footer">
            <div class="button-container">
                <button href="javascript:void(0)" class="btn btn-icon btn-round btn-facebook">
                <i class="fab fa-facebook"></i>
                </button>
                <button href="javascript:void(0)" class="btn btn-icon btn-round btn-twitter">
                <i class="fab fa-twitter"></i>
                </button>
                <button href="javascript:void(0)" class="btn btn-icon btn-round btn-google">
                <i class="fab fa-google-plus"></i>
                </button>
            </div>
        </div>
    </div>
</div>