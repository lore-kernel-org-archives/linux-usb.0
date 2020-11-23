Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10083C2D0E4
	for <linux-usb@archiver.kernel.org>; Mon, 23 Nov 2020 11:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E6C2065E
	for <linux-usb@archiver.kernel.org>; Mon, 23 Nov 2020 11:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QL5/zqRY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgKWLSF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 23 Nov 2020 06:18:05 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59826 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728564AbgKWLSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 06:18:04 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ANBHwlA070802;
        Mon, 23 Nov 2020 05:17:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606130278;
        bh=WvwHqCuiqiABMAx9nvRKSoa/wJ8vCDBnBsqx2S1S4FA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QL5/zqRYKlHdC7uAUsSIctPK1lC6qMxl/Gb0LhRNU7hDLxj0+IR45KNOWAVlW+8jP
         jaCjWY7krXPOSKsItV8NH/re4Vjd+nFIIJS6LYq2AyRVwETNI6Dd7z5UjP2Mp9pGGe
         TJsLmi7wrzbQR3wOGQTTje4YAptOUpP7U3q2ryMA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ANBHwqm068710
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Nov 2020 05:17:58 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 23
 Nov 2020 05:17:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 23 Nov 2020 05:17:58 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ANBHt2L088900;
        Mon, 23 Nov 2020 05:17:56 -0600
Subject: Re: [PATCH 1/5] usb: cdns3: core: quit if it uses role switch class
To:     Peter Chen <peter.chen@nxp.com>, <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <gregkh@linuxfoundation.org>,
        <jun.li@nxp.com>, Aswath Govindraju <a-govindraju@ti.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
 <20200901023352.25552-2-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <9c24639c-d78f-8465-6291-5002dd648d75@ti.com>
Date:   Mon, 23 Nov 2020 13:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901023352.25552-2-peter.chen@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter/Felipe,

On 01/09/2020 05:33, Peter Chen wrote:
> If the board uses role switch class for switching the role, it should
> not depends on SoC OTG hardware siginal any more, so quit early.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>   drivers/usb/cdns3/core.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index faee5ec5fc20..96c2da4e20c5 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -280,6 +280,10 @@ int cdns3_hw_role_switch(struct cdns3 *cdns)
>   	enum usb_role real_role, current_role;
>   	int ret = 0;
>   
> +	/* Depends on role switch class */
> +	if (cdns->role_sw)
> +		return 0;
> +

This breaks h/w based role switching for us.

cdsn->role_sw would always be non zero, right, which means h/w based role swithching
will be bypassed for all platforms.

>   	pm_runtime_get_sync(cdns->dev);
>   
>   	current_role = cdns->role;
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
