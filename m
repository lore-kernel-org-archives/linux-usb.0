Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED76FC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 14:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B024C20818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 14:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="WL2LXkx1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfDLOUx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:20:53 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:58154 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLOUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 10:20:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id AB65B27E03E9;
        Fri, 12 Apr 2019 16:20:51 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id sSfOF7cDh-UR; Fri, 12 Apr 2019 16:20:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1EB4B27E03F4;
        Fri, 12 Apr 2019 16:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1EB4B27E03F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1555078851;
        bh=zyseTl01AU0ypodMCS0rtQ0e+EhLf21aXij1VCAKFng=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=WL2LXkx1GUb6Pzxjp8W9GmmGL5AWjc4unKG9nrTf8+v5ZQBAymid5SmA747s9yr04
         rtjFp18PR+SMUAMuCy/rYkAv3r35g+mkDVknflCGskXC80yUMZmy946KKiTOUAr05q
         PGWVzLzP8vMRd7filqbZZsOCKrgB6YY+My+xEK1s=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xWMTi2OqUsmI; Fri, 12 Apr 2019 16:20:51 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id EE08927E03E9;
        Fri, 12 Apr 2019 16:20:50 +0200 (CEST)
Date:   Fri, 12 Apr 2019 16:20:44 +0200
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Artur Petrosyan <arthur.petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <john.youn@synopsys.com>
Subject: Re: [PATCH 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Message-ID: <20190412142044.e3lojhrhpwe3d7pe@tellis.lin.mbt.kalray.eu>
References: <cover.1555075927.git.arturp@synopsys.com>
 <8f99e3ceb45ede4526363bd9b44d417a6b6ff5cd.1555075928.git.arturp@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <8f99e3ceb45ede4526363bd9b44d417a6b6ff5cd.1555075928.git.arturp@synopsys.com>
User-Agent: NeoMutt/20180716-1344-11488f
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412142044.TE1Umc8v39_8F9FKjadvYpk0FFE3eOKS-nbmtDpKDlc@z>

Hi Artur,

On Fri, Apr 12, 2019 at 01:38:56PM +0000, Artur Petrosyan wrote:
> In host mode port power must be turned on when wakeup
> detected or session request interrupt is detected.
> Because, otherwise core wouldn't exit form partial
> power down.
> 
> - Turned on the port power by setting HPRT0_PWR bit.
> 
> - Called dwc2_hcd_connect() function after enabling
>   the power of the port.
> 
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/core_intr.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 19ae2595f1c3..ce523fd2b1b4 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -312,6 +312,7 @@ static void dwc2_handle_conn_id_status_change_intr(struct dwc2_hsotg *hsotg)
>  static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>  {
>  	int ret;
> +	u32 hprt0;
>  
>  	/* Clear interrupt */
>  	dwc2_writel(hsotg, GINTSTS_SESSREQINT, GINTSTS);
> @@ -320,7 +321,8 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>  		hsotg->lx_state);
>  
>  	if (dwc2_is_device_mode(hsotg)) {
> -		if (hsotg->lx_state == DWC2_L2) {
> +		if (hsotg->lx_state == DWC2_L2 &&
> +		    hsotg->params.power_down == 1) {
I think you can replace 1 with DWC2_POWER_DOWN_PARAM_PARTIAL.

[snip]

---
Best,
Jules

