Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9E2C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C0A32073F
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hcyoUrYU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfDORgF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:36:05 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:36316 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfDORgF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 13:36:05 -0400
Received: by mail-vk1-f195.google.com with SMTP id w140so3824579vkd.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nfQeGMN22zZV/sxMvXzS5KLcDc/ACLto+65tn/uR/7E=;
        b=hcyoUrYUDaHaIxVAallLOA+dtXqAF/S1L2yGf39zuEmCY5JnsMsiIvfzpduEvwRXKL
         mCCqqvLGMql9ZltCPNky1D4hkZ5eiBxX1X28qgx4v3olScSxzjoRNA8f/0v0Mre+vLW7
         22cSfD1h57DqwpiyWI6Jg2xiKSLquxWsMGMOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nfQeGMN22zZV/sxMvXzS5KLcDc/ACLto+65tn/uR/7E=;
        b=AIQAa8vH+scKFVu20XaIfeb9Nk24xAY+b81RfSLaIICK5T/VL9aWt+7ugHWnIVLo70
         JSES2EmOJLg3F/oEg9SBtwvE/W5ZMO2tVz9svANDjOCCOMNzSHHEwBzmuRs7SQX+Sxt8
         RyhFgoKiInQ4FLhXlUpjHqOVVRGrd7v0zuTf3T6WfxjynPvLCkuDCXrbIQ9ISuQDbr/X
         k2J++827nlUocgeLQ9W1GpZZkmU9dLZGteekwPPQgJDmBxTTE34Btxq63+QIi0drhcjv
         z7YEQrxEsGGb3db3Rq9xJMEolgr+TuLlfvCLu86uq4DKwoJ2GGxWzWkA2sl54PRBhV9b
         xqDg==
X-Gm-Message-State: APjAAAXGzcaw6yilgjXwFL5X5Dmf+iEgSGnzIm+WRKOUDpYrp+uXegSz
        QtwAxdJveZ4TZTH+FtJM3RXsRa6nMK8=
X-Google-Smtp-Source: APXvYqwttQJu2zKBrHUMxR8WBTB4FiR556c2o+/UcFmtnAt5GFVArQEMkAmhIEjpJnGvTDfon5o06w==
X-Received: by 2002:ac5:cac5:: with SMTP id m5mr41486177vkl.50.1555349764030;
        Mon, 15 Apr 2019 10:36:04 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id h78sm7168946vka.48.2019.04.15.10.36.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 10:36:01 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id s2so9951540vsi.5
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 10:36:01 -0700 (PDT)
X-Received: by 2002:a67:7f44:: with SMTP id a65mr21166520vsd.179.1555349761153;
 Mon, 15 Apr 2019 10:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190408143443.335f7e93@xhacker.debian> <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
 <20190408160551.03911b27@xhacker.debian> <20190409144655.753d3bd9@xhacker.debian>
 <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com> <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
 <20190414194623.afp3fanjuq72ctln@wunner.de>
In-Reply-To: <20190414194623.afp3fanjuq72ctln@wunner.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Apr 2019 10:35:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wbt-g0QtWQ2KzmWsXRygCk6=mJ6xYrnbL6E_NAUY6QkA@mail.gmail.com>
Message-ID: <CAD=FV=Wbt-g0QtWQ2KzmWsXRygCk6=mJ6xYrnbL6E_NAUY6QkA@mail.gmail.com>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Apr 14, 2019 at 12:46 PM Lukas Wunner <lukas@wunner.de> wrote:
>
> On Tue, Apr 09, 2019 at 09:28:16AM +0000, Minas Harutyunyan wrote:
> > Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
> > > The second one: 8000 usb interrupts per second when idle.
> > > This is abnormal. any idea? Is it due to the lan78xx?
> >
> > dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> > So, 8000 interrupts per second is expectant behavior.
>
> The dwc_otg driver patched into the Raspberry Pi Foundation's
> kernel seems to make do with much fewer interrupts and much
> lower CPU load.  How does it do that and how could dwc2 be
> made to do the same?  Would it be possible for you to provide
> me with documentation on the chip?  The Synopsis website
> requires registration for downloads and registration requires
> a Synopsis customer ID.
>
> It seems the Foundation's dwc_otg driver was forked from code
> that later begat dwc2.

Your information might be misleading.  The downstream dwc2 driver for
Raspberry PI handles the SoF interrupts at FIQ (fast interrupt) time.
The idea here is that this is to prioritize it above all other things
in the system since FIQ can fire even if we're currently in another
interrupt handler.

IIRC:

* FIQs don't get counted in /proc/interrupts.  So probably you really
are getting 8000 FIQs per second still, you just don't know it.

* FIQs don't count towards CPU load calculations, so it looks like the
CPU is less loaded by this than it really is.  I have no evidence
here, but I seem to remember someone telling me this, so if you
believe this is wrong then ignore it.


That all being said, though the purpose of using the FIQ is to improve
the latency of handling SoF interrupts, it is also plausible that when
it was written it also had the side effect of making the code more
efficient.  I mean, there's theoretically maybe some built-in
efficiency by skipping all the Linux interrupt infrastructure, but I'd
bet that's not a huge deal and a bigger deal is how inefficient the
mainline dwc2 driver is at handling interrupts.  I doubt you'd manage
to get FIQ support for something like this on mainline, but you could
possible spend more time improving the efficiency of the interrupt
handler.  I spent some time on this a while ago but it was just small
things--I didn't gut it and re-think how to make it faster.


Note also that I spent a bit of time a few years ago making the
upstream dwc2 driver more robust despite some of its inefficiencies.
In the end it was fairly robust, though if you wanted to do something
like audio or USB webcams with it you'd still struggle without higher
CPU speeds or patches like <https://crbug.com/820961>.  I'm still of
the belief that, unless the downstream driver has ported over the
uFrame work I did, that the upstream dwc2 driver will be compatible
with more more combinations of devices/hubs than the downstream one.


-Doug
