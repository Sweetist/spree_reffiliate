Deface::Override.new(
  virtual_path: "spree/users/show",
  name: "add_referral_link_and_count",
  sequence: {after: "add_socials_to_account_summary"},
  insert_after: "[data-hook='account_summary'] #user-info dd:eq(2)"
) do
<<-CODE.chomp
<br>
<dt>Referral URL</dt>
<dd class='col-md-6 row'>
  <div class="input-group">
    <input type='text' data-coupon-code=true value='<%= referral_url(@user.referral.code) %>' class='form-control' />
    <span class="input-group-btn">
      <button class="btn btn-primary" data-copy-coupon-code=true type="button" title='Copy to clipboard'><span class='glyphicon glyphicon-copy'></span></button>
    </span>
  </div>
</dd>
<br>
<br>
<br>
<div>
  <dt>Referred Users</dt>
  <dd><%= @user.referred_count%></dd>
</div>
CODE
end
