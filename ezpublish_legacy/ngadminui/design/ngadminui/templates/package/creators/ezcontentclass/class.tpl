{* DO NOT EDIT THIS FILE! Use an override template instead. *}

{def $class_list_by_group = hash()}
{def $class_list = fetch( class, list_by_groups, hash( group_filter, false() ) )}

{foreach $class_list as $class}
    {if is_set( $class_list_by_group[$class.ingroup_list.0.group_name] )}
        {set $class_list_by_group = $class_list_by_group|merge( hash( $class.ingroup_list.0.group_name, $class_list_by_group[$class.ingroup_list.0.group_name]|append( $class ) ) )}
    {else}
        {set $class_list_by_group = $class_list_by_group|merge( hash( $class.ingroup_list.0.group_name, array( $class ) ) )}
    {/if}
{/foreach}

<div id="package" class="create">
    <div id="sid-{$current_step.id|wash}" class="pc-{$creator.id|wash}">

    <form method="post" action={'package/create'|ezurl}>

    {include uri="design:package/create/error.tpl"}

    {include uri="design:package/header.tpl"}

    <p>{'Please choose the content classes you want to be included in the package.'|i18n('design/standard/package')}</p>

    <div class="block">
        <label>{'Class list'|i18n('design/standard/package')}</label>
        <select class="listbox" name="ClassList[]" multiple="multiple" size="30">
        {foreach $class_list_by_group as $group_name => $group_classes}
            <option disabled="disabled" value="group_{$group_name|wash}">{$group_name|wash}</option>
            {foreach $group_classes as $class}
                <option value="{$class.id}">&nbsp;&nbsp;&nbsp;{$class.name|wash}</option>
            {/foreach}
        {/foreach}
        </select>
    </div>

    {include uri="design:package/navigator.tpl"}

    </form>

    </div>
</div>

{undef $class_list_by_group $class_list}
