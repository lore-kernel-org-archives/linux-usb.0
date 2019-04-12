Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F67DC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 23:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BEF52086D
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 23:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JOcKg9gY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbfDLXmU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 19:42:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44345 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfDLXmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 19:42:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id y13so5833903pfm.11
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 16:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rdwL5OgN7f9hEUf+/UyyCAtBDK4dkvD9zKg3w6Quock=;
        b=JOcKg9gY+y1MaYu1XULnZ6Wd8jfdVbnERaBWja8PJ6zDdNQOgMPgyt96pApqOrPCIN
         i7tkof1o/+ewPU/fgkho4xsTSrUPgMOO+OPbZyguXVCSA0oteHGm755XLjmNwp/rv2Zz
         UaHuTUPFRHpwjd9JwItnhFra+6GOyHHdw5R1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rdwL5OgN7f9hEUf+/UyyCAtBDK4dkvD9zKg3w6Quock=;
        b=fLqKN7ZYaD7yv5nELRn2YDJPXNitiIcYQyAJQR30/w2ZTvJvbVv6VFL5QEP4qwJG3e
         SycYeTfTGmBWLChzmV6XncnOMy3Ik17OdVESV7MSQaxdjDRjoQX3j+kzJENBACt8nftO
         caESIhNLxBYvYRsXOGJCi+Wwud8LIQKS2BHbbbkGLcaLISZKY90DkXMZyEKYunrC2PY1
         RmQCe42bIAG4zzX6Eahiqip74KUA+esp39JREMsmxrMzXTBR7dsjmr4jP1emVF3gEXw/
         qfKrMlbjI0t/Jlr+W6pD42H84lbG1bwsD7St1me85BOEyZDkfe78dbhntmxyRv+Z9js+
         K6Dw==
X-Gm-Message-State: APjAAAX4BwCZ4a0rOO7MIjD6JYQUvWe26IsVgT7OjvouQH7nW5Ym0do5
        faZXEhQZB568n+w0ZEqdA4j0aw==
X-Google-Smtp-Source: APXvYqwmPNbWal5ncxV1ID7Sn4TNR1ckMVNN7SOBv7zsDyllm0Uo0xl0NbKyt3nDyEIqwdT40QvHpA==
X-Received: by 2002:a62:1bc7:: with SMTP id b190mr60696226pfb.29.1555112539450;
        Fri, 12 Apr 2019 16:42:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id l19sm10892005pfi.87.2019.04.12.16.42.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2019 16:42:18 -0700 (PDT)
Date:   Fri, 12 Apr 2019 16:42:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>,
        ryandcase@chromium.org, jwerner@chromium.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: dwc2: Document quirk to reset PHY
 upon wakeup
Message-ID: <20190412234218.GX112750@google.com>
References: <20190412224149.106971-1-dianders@chromium.org>
 <20190412224149.106971-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190412224149.106971-2-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412234218.2zMxM9AMA5O9P_sWrqKLO7FNoFSWJnmEe6wEIWqFx34@z>

On Fri, Apr 12, 2019 at 03:41:46PM -0700, Douglas Anderson wrote:
> On Rockchip rk3288 there's a hardware quirk where we need to assert
> the reset signal to the PHY when we get a remote wakeup on one of the
> two ports.  Document this quirk in the bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 6dc3c4a34483..f70f3aee4bfc 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - g-rx-fifo-size: size of rx fifo size in gadget mode.
>  - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
>  - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
> +- snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
> +                          we detect a wakeup.  This is due to a hardware errata.
>  
>  Deprecated properties:
>  - g-use-dma: gadget DMA mode is automatically detected

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
