Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11015C282CE
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 22:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D32A520880
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 22:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JR2elQTW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfDHWsY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 18:48:24 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34388 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbfDHWsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 18:48:24 -0400
Received: by mail-vs1-f66.google.com with SMTP id t78so8654446vsc.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2019 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89IMPl6IXehu/gnw/AwvjgPWErShOhBJvpt/8Rtdgw8=;
        b=JR2elQTWQ2kAIwbgJjrLsKGTw6p8DNirG5SVJHRAJCIf/Q/h0gLM/cD0MDK3+m2aJY
         zSx6U0fcMIYK5Wx3QwynOsvVYOgHqspeykYXQNr4Bhe7rR/LcDqIab/eG7qgDd0waLeM
         1YDCRVmYC7vkzGjNJkHu9CSNti0iUtcXfvABY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89IMPl6IXehu/gnw/AwvjgPWErShOhBJvpt/8Rtdgw8=;
        b=bfvUhPkeUqOBpnlc8OciIzfpuDwPf9VT5OC+Cips8rrzxYDMycYO7/F3WyMith5VkL
         6Y0mWzQdidMYjZUB9G89Vb8CKAscJa6YasTYAzLfyhU66fMYOZxZtywJlPchMWHTJxXm
         DYFzH5eT13zx5rqYeH92RZYhhAhYFRWLAlNaPZ53WQqWdU3tR7mqhLun0vsRjdBgS2hH
         74EmIewrOlMIBBj6iYsa/uLTyxYNaWD79oyzTSltuJVFBne/Vey0+SaRziO62xXaC9hL
         w23uqIAnPcJNGdNVvP195zSrJVqt2XlkQlavP67J20pN6vnd7AgE9MVdnY7nVExw2o6f
         epfA==
X-Gm-Message-State: APjAAAX0ROhWdKHI1lZoerrx8SB1h48EIzjOCRC01cG/F5ADrDvozdag
        aPPDn2ihAT9g1afvnujrerySe/ebl28=
X-Google-Smtp-Source: APXvYqx5X25tyaN3vT0pnGw9gOFEGxxl/4SbNGFM5zBwrexSVENaKA+NGquGP4gpCG5TbtoRBdanvQ==
X-Received: by 2002:a67:c29e:: with SMTP id k30mr17561249vsj.203.1554763703158;
        Mon, 08 Apr 2019 15:48:23 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 15sm3711597uav.11.2019.04.08.15.48.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 15:48:21 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id d5so4884546uan.6
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2019 15:48:21 -0700 (PDT)
X-Received: by 2002:ab0:474c:: with SMTP id i12mr17689275uac.9.1554763701098;
 Mon, 08 Apr 2019 15:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <ae079099-4a29-7ae7-afa3-00dad26e81c2@halemmerich.com> <f40fd3bf-97aa-b4ac-8260-6fa727909e3b@halemmerich.com>
In-Reply-To: <f40fd3bf-97aa-b4ac-8260-6fa727909e3b@halemmerich.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 8 Apr 2019 15:48:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WG64ZuAZCLWZe4CeYHEmpo2TNPeane_yS6Fg6xnGU9DQ@mail.gmail.com>
Message-ID:
 <CAD=FV=WG64ZuAZCLWZe4CeYHEmpo2TNPeane_yS6Fg6xnGU9DQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] usb: dwc2: disable power_down on rockchip for regression
To:     stable@vger.kernel.org
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        Hal Emmerich <hal@halemmerich.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190408224810.Q2bJ1p2UQXpwGm8lHZ6nwYGNsZeiI_CO3IT1j7HOmTg@z>

Hi,

On Fri, Oct 26, 2018 at 7:38 AM Hal Emmerich <hal@halemmerich.com> wrote:
>
>
> From 04fbf78e4e569bf872f1ffcb0a6f9b89569dc913 Mon Sep 17 00:00:00 2001
> From: Hal Emmerich <hal@halemmerich.com>
> Date: Thu, 19 Jul 2018 21:48:08 -0500
> Subject: [PATCH] usb: dwc2: disable power_down on rockchip devices
>
>  The bug would let the usb controller enter partial power down,
>  which was formally known as hibernate, upon boot if nothing was plugged
>  in to the port. Partial power down couldn't be exited properly, so any
>  usb devices plugged in after boot would not be usable.
>
>  Before the name change, params.hibernation was false by default, so
>  _dwc2_hcd_suspend() would skip entering hibernation. With the
>  rename, _dwc2_hcd_suspend() was changed to use  params.power_down
>  to decide whether or not to enter partial power down.
>
>  Since params.power_down is non-zero by default, it needs to be set
>  to 0 for rockchip devices to restore functionality.
>
>  This bug was reported in the linux-usb thread:
>  REGRESSION: usb: dwc2: USB device not seen after boot
>
>  The commit that caused this regression is:
>  6d23ee9caa6790aea047f9aca7f3c03cb8d96eb6
>
> Signed-off-by: Hal Emmerich <hal@halemmerich.com>
> Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>  drivers/usb/dwc2/params.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index bf7052e037d6..09292dc977e4 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -81,6 +81,7 @@ static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
>         p->host_perio_tx_fifo_size = 256;
>         p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 <<
>                 GAHBCFG_HBSTLEN_SHIFT;
> +       p->power_down = 0;

This landed as commit c216765d3a1d ("usb: dwc2: disable power_down on
rockchip devices").  Can it please go to stable?  Hotplug of USB on
v4.19 stable, for example, is currently broken due to the lack of this
patch.

Thanks!

-Doug
