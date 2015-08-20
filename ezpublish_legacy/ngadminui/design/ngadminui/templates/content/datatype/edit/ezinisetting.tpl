{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}

{section show=count( $attribute.content.modified )}
<div class="message-warning">
<p>{'Warning: the ini file settings value and object value does not match.'|i18n( 'design/standard/class/datatype' )}</p>
<p>{'The ini file has probably been modified manually since last time.'|i18n( 'design/standard/class/datatype' )}</p>
{section var=modified loop=$attribute.content.modified}
<ul>
<li>{'Ini File: '|i18n( 'design/standard/class/datatype' )}{$modified.item.file|wash}</li>
<li>{'Ini Value: '|i18n( 'design/standard/class/datatype' )}{$modified.item.ini_value|wash}</li>
</ul>
{/section}
</div>
{/section}


{switch match=$attribute.contentclass_attribute.data_int1}

{* String. *}
{case in=array( 1, 4, 5 )}
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" size="50" name="{$attribute_base}_ini_setting_{$attribute.id}" value="{$attribute.data_text|wash}" />
{/case}

{* Boolean: enabled/disabled. *}
{case match=2}
    <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ini_setting_{$attribute.id}">
        <option value="enabled" {if $attribute.data_text|eq( 'enabled' )}selected="selected"{/if}>{'Enabled'|i18n( 'design/standard/class/datatype' )}</option>
        <option value="disabled" {if $attribute.data_text|eq( 'disabled' )}selected="selected"{/if}>{'Disabled'|i18n( 'design/standard/class/datatype' )}</option>
    </select>
{/case}

{* Boolean: true/false. *}
{case match=3}
    <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ini_setting_{$attribute.id}">
        <option value="true" {if $attribute.data_text|eq( 'true' )}selected="selected"{/if}>{'True'|i18n( 'design/standard/class/datatype' )}</option>
        <option value="false" {if $attribute.data_text|eq( 'false' )}selected="selected"{/if}>{'False'|i18n( 'design/standard/class/datatype' )}</option>
    </select>
{/case}

{* Array. *}
{case match=6}
    <div class="block">
        <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_make_empty">{'Make empty array'|i18n( 'design/standard/class/datatype' )}:</label>
        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_make_empty" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="checkbox" name="{$attribute_base}_ini_setting_make_empty_array_{$attribute.id}" {$attribute.data_int|choose( '', 'checked=checked' )} />
    </div>
    <textarea id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ini_setting_{$attribute.id}" cols="97" rows="5">{$attribute.data_text|wash}</textarea>
{/case}

{/switch}
{/default}