{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div id="package" class="create">
    <div id="sid-{$current_step.id|wash}" class="pc-{$creator.id|wash}">

        <form method="post" action={'package/create'|ezurl}>
            <div class="panel">
                {include uri="design:package/create/error.tpl"}

                {include uri="design:package/header.tpl"}

                <p>{'Provide some basic information for your package.'|i18n('design/admin/package')}</p>
                <div class="block">
                        <label for="PackageName">{'Package name'|i18n('design/admin/package')}</label>
                        <input id="PackageName" class="form-control" type="text" name="PackageName" value="{$persistent_data.name|wash}" />
                </div>

                <div class="block">
                        <label for="PackageSummary">{'Summary'|i18n('design/admin/package')}</label>
                        <input id="PackageSummary" class="form-control" type="text" name="PackageSummary" value="{$persistent_data.summary|wash}" />
                </div>

                <div class="block">
                        <label for="PackageDescription">{'Description'|i18n('design/admin/package')}</label>
                        <textarea id="PackageDescription" class="form-control" rows="7" name="PackageDescription">{$persistent_data.description|wash}</textarea>
                </div>

                <div class="block">
                        <label for="PackageVersion">{'Version'|i18n('design/admin/package')}</label>
                        <input id="PackageVersion" class="form-control" type="text" name="PackageVersion" value="{$persistent_data.version|wash}" />
                </div>

                <div class="block">
                        <label>{'License'|i18n('design/admin/package')}</label>
                        <input type="hidden" name="PackageLicence" value="{$persistent_data.licence|wash}" />
                        <p>{$persistent_data.licence|wash}</p>
                </div>

                <div class="block">
                        <label for="PackageHost">{'Package host'|i18n('design/admin/package')}</label>
                        <input id="PackageHost" class="form-control" type="text" name="PackageHost" value="{$persistent_data.host|wash}" />
                </div>

                <div class="block">
                        <label for="PackagePackager">{'Packager'|i18n('design/admin/package')}</label>
                        <input id="PackagePackager" class="form-control" type="text" name="PackagePackager" value="{$persistent_data.packager|wash}" />
                </div>

                {include uri="design:package/navigator.tpl"}
            </div>
        </form>

    </div>
</div>
