{*
 * 2007-2016 PrestaShop
 *
 * Thirty Bees is an extension to the PrestaShop e-commerce software developed by PrestaShop SA
 * Copyright (C) 2017-2024 thirty bees
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@thirtybees.com so we can send you a copy immediately.
 *
 * @author    Thirty Bees <modules@thirtybees.com>
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2017-2024 thirty bees
 * @copyright 2007-2016 PrestaShop SA
 * @license   https://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  PrestaShop is an internationally registered trademark & property of PrestaShop SA
*}

{capture name=path}{l s='Check payment' mod='cheque'}{/capture}

<h1 class="page-heading">{l s='Order summary' mod='cheque'}</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if isset($nbProducts) && $nbProducts <= 0}
  <div class="alert alert-warning">{l s='Your shopping cart is empty.' mod='cheque'}</div>
{else}
  <form action="{$link->getModuleLink('cheque', 'validation', [], true)|escape:'html':'UTF-8'}" method="post">
    <div class="box cheque-box">
      <h3 class="page-subheading">{l s='Check payment' mod='cheque'}</h3>
      <p class="cheque-indent">
        <strong>
          {l s='You have chosen to pay by check.' mod='cheque'} {l s='Here is a short summary of your order:' mod='cheque'}
        </strong>
      </p>
      <p>
        - {l s='The total amount of your order comes to:' mod='cheque'}
        <span id="amount" class="price">{displayPrice price=$total}</span>
        {if $use_taxes == 1}
          {l s='(tax incl.)' mod='cheque'}
        {/if}
      </p>
      <p>
        -
        {if isset($currencies) && $currencies|@count > 1}
        {l s='We accept several currencies to receive payments by check.' mod='cheque'}
        <br/>
      <div class="form-group">
        <label>{l s='Choose one of the following:' mod='cheque'}</label>
        <select id="currency_payment" class="form-control" name="currency_payment">
          {foreach from=$currencies item=currency}
            <option value="{$currency.id_currency}"{if isset($currencies) && $currency.id_currency == $cust_currency} selected="selected"{/if}>{$currency.name}</option>
          {/foreach}
        </select>
      </div>
      {else}
      {l s='We allow the following currencies to be sent by check:' mod='cheque'}&nbsp;<b>{$currencies[0].name}</b>
      <input type="hidden" name="currency_payment" value="{$currencies[0].id_currency}"/>
      {/if}
      </p>
      <p>
        - {l s='Check owner and address information will be displayed on the next page.' mod='cheque'}
        <br/>
        - {l s='Please confirm your order by clicking \'I confirm my order\'' mod='cheque'}.
      </p>
    </div>
    <p class="cart_navigation clearfix" id="cart_navigation">
      <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}"
         class="btn btn-lg btn-default">
        <i class="icon icon-chevron-left"></i> {l s='Other payment methods' mod='cheque'}
      </a>
      <button type="submit" class="btn btn-lg btn-success pull-right">
        <span>{l s='I confirm my order' mod='cheque'} <i class="icon icon-chevron-right"></i></span>
      </button>
    </p>
  </form>
{/if}

