Return-Path: <SRS0=EamD=VB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35FAC4646D
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 12:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B202218A0
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 12:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Lr8d6lLz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfGDMWI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Jul 2019 08:22:08 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5990 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfGDMWH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 08:22:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1def6d0000>; Thu, 04 Jul 2019 05:22:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 05:22:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 04 Jul 2019 05:22:06 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 12:22:04 +0000
Subject: Re: [PATCH 2/8] clk: tegra: don't enable PLLE HW sequencer at init
To:     JC Kuo <jckuo@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-3-jckuo@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4b63588d-937c-ea9f-573f-0fc2028b6061@nvidia.com>
Date:   Thu, 4 Jul 2019 13:22:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-3-jckuo@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562242925; bh=2s8K5e0JBF4WkMjuEclj1uDaZjT8/JXyNSkvwGXJXYw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Lr8d6lLzlQ81B9hVi7QCmMkZxgjlZZ0yLKvJBoa2q+59vnjLcN2+r07DTQ3LeA9lr
         EAJCuvU33rY/krvlQnRoC4pir6LM5AvJJXHjExQcJAxmNfPrW+zso08P47i+uVoyzy
         NBQL3kFZNa7mZGh9ky/AC/YnFOdoFPRoakH8pz5iTJMvl0i6+UtjWdrd0r2KPJPFca
         EEdZYrpGp+SDlQWWiurhr79h0fXrHmWxiPnHrptQ1ym7miPBs7FPRf+33/Ag0zOvj8
         IOv1YAb+RufGgO05bXQLjuVqKEN8Dd+392lFPv2w73ExtfxZU9aiE0dFkMxZ8E0t3h
         1agVJBtFmZEfw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 14/06/2019 08:46, JC Kuo wrote:
> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
> power sequencers' output to enable/disable PLLE. PLLE hardware power
> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
> are enabled.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1583f5fc992f..e6de65987fd2 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -2469,18 +2469,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
>  	pll_writel(val, PLLE_SS_CTRL, pll);
>  	udelay(1);
>  
> -	val = pll_readl_misc(pll);
> -	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
> -	pll_writel_misc(val, pll);
> -
> -	val = pll_readl(pll->params->aux_reg, pll);
> -	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> -	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> -	pll_writel(val, pll->params->aux_reg, pll);
> -	udelay(1);
> -	val |= PLLE_AUX_SEQ_ENABLE;
> -	pll_writel(val, pll->params->aux_reg, pll);
> -
>  out:
>  	if (pll->lock)
>  		spin_unlock_irqrestore(pll->lock, flags);
> 

So this function is called clk_plle_tegra210_enable() and is called by
the CCF enable callback. However, after the above change, does this mean
that this no longer enables the PLL? I understand that that is what you
want, but from an architecture perspective, it seems incorrect to have
an enable function that when called does not enable the PLL as expected.

I don't fully understand why we need to add the new helpers from the
previous patch and we cannot use the CCF APIs directly?

If you really need to split the existing enable function, then the CCF
does have prepare and enable callbacks that can be used.

Cheers
Jon

-- 
nvpublic
