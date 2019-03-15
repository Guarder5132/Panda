3.30fen  

1小时  看 删 改 权限

1.30小时  微博
<% @user.errors.full_messages.each do |error| %>

    <% if micropost.pinluns.any? %>
        <% micropost.pinluns.each do |pinlun| %>
        <li>
            <h6>
                <%= gravatar_for pinlun.user,size:20 %>
                <%= pinlun.user.name %> :
                <%= pinlun.content %>
            </h6>
        </li>
        <% end %>
    <% end %>

    <%# 发表评论 %>
    <%= form_for(current_user.pinluns.build(micropost_id: feed.id)) do |f| %>
        <h5>
            <%= f.hidden_field :micropost_id %>
            <%= f.text_area :content, placeholder:"Please enter what you want to send. ",style:"margin: 0px 0px 10px; width: 481px; height: 32px;"%>
            <%= f.submit "pinlun", class:"btn"%>
        </h5>
    <% end %>