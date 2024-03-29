﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WizardUsc.ascx.cs" Inherits="Warden.Components.Controls.WizardUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<!--      Wizard container        -->
          <div class="wizard-container">
            <div class="card card-wizard" data-color="primary" id="wizardProfile">
              <form>
                <!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                <div class="card-header text-center">
                  <h3 class="card-title">
                    Build Your Profile
                  </h3>
                  <h5 class="description">This information will let us know more about you.</h5>
                  <div class="wizard-navigation">
                    <div class="progress-with-circle">
                      <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
                    </div>
                    <ul>
                      <li class="nav-item">
                        <a class="nav-link active" href="#about" data-toggle="tab">
                          <i class="tim-icons icon-single-02"></i>
                          <p>About</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#account" data-toggle="tab">
                          <i class="tim-icons icon-settings-gear-63"></i>
                          <p>Account</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#address" data-toggle="tab">
                          <i class="tim-icons icon-delivery-fast"></i>
                          <p>Address</p>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane show active" id="about">
                      <h5 class="info-text"> Let's start with the basic information (with validation)</h5>
                      <div class="row justify-content-center mt-5">
                        <div class="col-sm-5">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <i class="tim-icons icon-single-02"></i>
                              </div>
                            </div>
                            <input type="text" name="firstname" class="form-control" placeholder="First Name...">
                          </div>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <i class="tim-icons icon-email-85"></i>
                              </div>
                            </div>
                            <input type="email" required name="email" class="form-control" placeholder="Email...">
                          </div>
                        </div>
                        <div class="col-sm-5">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <i class="tim-icons icon-caps-small"></i>
                              </div>
                            </div>
                            <input type="text" name="lastname" placeholder="Last Name..." class="form-control">
                          </div>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <i class="tim-icons icon-mobile"></i>
                              </div>
                            </div>
                            <input type="number" name="number" class="form-control" placeholder="Phone...">
                          </div>
                        </div>
                        <div class="col-sm-10">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <i class="tim-icons icon-square-pin"></i>
                              </div>
                            </div>
                            <input type="text" name="address" class="form-control" placeholder="Address">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="account">
                      <h5 class="info-text"> Who are you? (Fileinput)</h5>
                      <div class="row justify-content-center">
                        <div class="col-lg-10 text-center">
                          <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                            <div class="fileinput-new thumbnail">
                              <img src="../../assets/img/image_placeholder.jpg" alt="...">
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail"></div>
                            <div>
                              <span class="btn btn-primary btn-simple btn-file">
                                <span class="fileinput-new">Select image</span>
                                <span class="fileinput-exists">Change</span>
                                <input type="file" name="..." />
                              </span>
                              <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="address">
                      <div class="row justify-content-center">
                        <div class="col-sm-12">
                          <h5 class="info-text"> Are you living in a nice area? </h5>
                        </div>
                        <div class="col-sm-7">
                          <div class="form-group">
                            <label>Street Name</label>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="form-group">
                            <label>Street No.</label>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                        <div class="col-sm-5">
                          <div class="form-group">
                            <label>City</label>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                        <div class="col-sm-5">
                          <div class="form-group">
                            <label>Country</label>
                            <select class="selectpicker" data-size="7" data-style="btn btn-primary" title="Single Select">
                              <option value="Afghanistan"> Afghanistan </option>
                              <option value="Albania"> Albania </option>
                              <option value="Algeria"> Algeria </option>
                              <option value="American Samoa"> American Samoa </option>
                              <option value="Andorra"> Andorra </option>
                              <option value="Angola"> Angola </option>
                              <option value="Anguilla"> Anguilla </option>
                              <option value="Antarctica"> Antarctica </option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="pull-right">
                    <input type='button' class='btn btn-next btn-fill btn-primary btn-wd' name='next' value='Next' />
                    <input type='button' class='btn btn-finish btn-fill btn-primary btn-wd' name='finish' value='Finish' />
                  </div>
                  <div class="pull-left">
                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
                  </div>
                  <div class="clearfix"></div>
                </div>
              </form>
            </div>
          </div>
          <!-- wizard container -->

<script src="<%=Help.FormatUrl("/assets/js/wizard/jquery.bootstrap-wizard.js")%>"></script>
<script>
    $(document).ready(function() {
      // Initialise the wizard
      demo.initNowUiWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
</script>
