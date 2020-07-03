Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03587C433E0
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 13:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C18E720675
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 13:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="skKLfjAZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCNRx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 09:17:53 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50752 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCNRw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 09:17:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063DHnun019887;
        Fri, 3 Jul 2020 08:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593782269;
        bh=GioOfTyUBgaHZmj1Emw3+SD+hhjN478boVkxl90gIuA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=skKLfjAZy5hvW42nxYKaCdN0iKW4ZFDwEOAFrZe6ZnlpHQ9AQTUAj2xtXLEMOX/TZ
         bocscBYbe1IAN5t+Sv7uCdw0wlzCrtKGKJXkt2MHpzLsLFmNyVobA1vb8RCYdbuqay
         +AvQuLeJsBomwrPudwES+3AF+riPL3c2SjDZqajw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063DHndj071508
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jul 2020 08:17:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 08:17:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 08:17:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063DHlXV105572;
        Fri, 3 Jul 2020 08:17:47 -0500
Subject: Re: [PATCH] usb: ehci-omap: Drop surplus include
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>
References: <20200703131059.515436-1-linus.walleij@linaro.org>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <83f32585-6fa8-17e2-6a72-0fe0d78e89fa@ti.com>
Date:   Fri, 3 Jul 2020 16:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703131059.515436-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 03/07/2020 16.10, Linus Walleij wrote:
> The EHCI OMAP driver includes <linux/gpio.h> but does not use
> any symbols from this file, so drop it.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/usb/host/ehci-omap.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.=
c
> index fc125b3d06e7..94b4b3ea49c8 100644
> --- a/drivers/usb/host/ehci-omap.c
> +++ b/drivers/usb/host/ehci-omap.c
> @@ -24,7 +24,6 @@
>  #include <linux/slab.h>
>  #include <linux/usb/ulpi.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/gpio.h>
>  #include <linux/clk.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

