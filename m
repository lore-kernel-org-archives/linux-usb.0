Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D0AC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4F2120684
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfDXJ6r (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:58:47 -0400
Received: from ns.iliad.fr ([212.27.33.1]:47328 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbfDXJ6q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Apr 2019 05:58:46 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id E63D51FF4E;
        Wed, 24 Apr 2019 11:58:44 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id CABB71FF37;
        Wed, 24 Apr 2019 11:58:44 +0200 (CEST)
Subject: Re: [PATCH] usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
Message-ID: <7844b06a-c332-38bb-1d3a-a206a828e991@free.fr>
Date:   Wed, 24 Apr 2019 11:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b2846f91-90ba-8ffa-9afe-ab9e719ed780@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Apr 24 11:58:44 2019 +0200 (CEST)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190424095844.XquoaqcCcndfykCpKNLnROApGHNAO3-nO7aDStQv1QY@z>

On 19/04/2019 11:59, Marc Gonzalez wrote:

> Keep EXTCON support optional, since some platforms do not need it.
> 
> Fixes: 3def4031b3e3 ("usb: dwc3: add EXTCON dependency for qcom")
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  drivers/usb/dwc3/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 2b1494460d0c..6bd1a28c535f 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -115,7 +115,8 @@ config USB_DWC3_ST
>  
>  config USB_DWC3_QCOM
>  	tristate "Qualcomm Platform"
> -	depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on EXTCON || !EXTCON
>  	depends on OF
>  	default USB_DWC3
>  	help

Can I get an amen? :-)

Arnd? Greg? Mom?
