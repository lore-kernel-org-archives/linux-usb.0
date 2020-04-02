Return-Path: <SRS0=IcVX=5S=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394CEC43331
	for <linux-usb@archiver.kernel.org>; Thu,  2 Apr 2020 09:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D093206D3
	for <linux-usb@archiver.kernel.org>; Thu,  2 Apr 2020 09:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sVDDy5Pb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgDBJ1F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 2 Apr 2020 05:27:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38002 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbgDBJ1F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 05:27:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0329QxmW050155;
        Thu, 2 Apr 2020 04:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585819619;
        bh=YWMb6J5eOH0UqZdo3owSVU9wfDadBomPqXcdH4Kst/o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sVDDy5PbRp7lDWmq7gApfAeelWzIVDiQRyt9/SVMuBam83t0tSda3WZEB/6OP4oZ6
         7So/erzyhbr9gtk6CtBLg54q6Z75qEC83PGegjIe/+NhcaZehOEqFBwkBdG0XyjLwk
         GAWm8ZY/vBCLIE2qlNDPdE3hGKy1i0VxrLri2Y+M=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0329QxYS103210
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Apr 2020 04:26:59 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 04:26:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 04:26:58 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0329QuR9106897;
        Thu, 2 Apr 2020 04:26:57 -0500
Subject: Re: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
 <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
 <AM7PR04MB7157C5ECA0597F2BBB3C29EC8BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <1b745ded-b0b2-1c4b-3052-41aaccad8a9c@ti.com>
Date:   Thu, 2 Apr 2020 12:26:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM7PR04MB7157C5ECA0597F2BBB3C29EC8BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 02/04/2020 12:24, Peter Chen wrote:
> 
>   
>>
>> On 31/03/2020 11:10, Peter Chen wrote:
>>> After that, the role switch device (eg, Type-C device) could call
>>> cdns3_role_set to finish the role switch.
>>>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>
>> This does not apply on v5.6. What branch did you test this on?
>>
> 
> Hi Roger,
>   
> I use 5.6-rc4.  Which conflict you have met? Do you have below patch?
> 
> 8708a9fa2938 usb: roles: Provide the switch drivers handle to the switch in the API

Applying: usb: cdns3: core: get role switch node from firmware
error: patch failed: drivers/usb/cdns3/core.c:528
error: drivers/usb/cdns3/core.c: patch does not apply
Patch failed at 0001 usb: cdns3: core: get role switch node from firmware
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
