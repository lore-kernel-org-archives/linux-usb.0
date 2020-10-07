Return-Path: <SRS0=hcfR=DO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7BFC41604
	for <linux-usb@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB1FD2076C
	for <linux-usb@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nzD+cJGi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgJGIE5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:04:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37132 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgJGIE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 04:04:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09784mu1057707;
        Wed, 7 Oct 2020 03:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602057888;
        bh=z4VpTvoOOZp6qQHLtmXVaZGYtqgiD52MMsRvSIv4cjk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nzD+cJGiqOp91ekDNpfsxNGIs/X2hqgR1/2TScI6DWvMMAgMaouLaYfh54tgc78Xr
         xAbrdEc8GjzTncRCdVAnFpG6M5Jm7a4MsvIYZtOAcOIv0lKLkKhKRNbWcPcHoDP8VS
         rrijELMbgAPscIh5ozllkgblYPh6Hfc/1hEgPPwQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09784mQ8112342
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Oct 2020 03:04:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 03:04:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 03:04:48 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09784j5R103861;
        Wed, 7 Oct 2020 03:04:46 -0500
Subject: Re: [PATCH] usb: cdns3: Add static to cdns3_gadget_exit function
To:     Pawel Laszczak <pawell@cadence.com>, <balbi@kernel.org>
CC:     <peter.chen@nxp.com>, <nsekhar@ti.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kurahul@cadence.com>
References: <20201007040230.25741-1-pawell@cadence.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <34195846-65f5-c3b3-b883-bed27a401814@ti.com>
Date:   Wed, 7 Oct 2020 11:04:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007040230.25741-1-pawell@cadence.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 07/10/2020 07:02, Pawel Laszczak wrote:
> Function cdns3_gadget_exit is used only in gadget.c file.
> This patch removes declaration and definition of this
> function from gadget-export.h file and makes it static.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Acked-by: Roger Quadros <rogerq@ti.com>


> ---
>   drivers/usb/cdns3/gadget-export.h | 3 ---
>   drivers/usb/cdns3/gadget.c        | 2 +-
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-export.h
> index 577469eee961..702c5a267a92 100644
> --- a/drivers/usb/cdns3/gadget-export.h
> +++ b/drivers/usb/cdns3/gadget-export.h
> @@ -13,7 +13,6 @@
>   #ifdef CONFIG_USB_CDNS3_GADGET
>   
>   int cdns3_gadget_init(struct cdns3 *cdns);
> -void cdns3_gadget_exit(struct cdns3 *cdns);
>   #else
>   
>   static inline int cdns3_gadget_init(struct cdns3 *cdns)
> @@ -21,8 +20,6 @@ static inline int cdns3_gadget_init(struct cdns3 *cdns)
>   	return -ENXIO;
>   }
>   
> -static inline void cdns3_gadget_exit(struct cdns3 *cdns) { }
> -
>   #endif
>   
>   #endif /* __LINUX_CDNS3_GADGET_EXPORT */
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 692acf7b9b14..6ff3aa3db497 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -3069,7 +3069,7 @@ static void cdns3_gadget_release(struct device *dev)
>   	kfree(priv_dev);
>   }
>   
> -void cdns3_gadget_exit(struct cdns3 *cdns)
> +static void cdns3_gadget_exit(struct cdns3 *cdns)
>   {
>   	struct cdns3_device *priv_dev;
>   
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
