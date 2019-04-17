Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_MED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3036C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B66E9217FA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0PUqVND"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733188AbfDQWj0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 18:39:26 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:35813 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbfDQWYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 18:24:05 -0400
Received: by mail-yb1-f195.google.com with SMTP id e190so149557ybf.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9iNMZibBS2r6UrLw2W/xlO65vJqdF+R8lzrIZSjULU=;
        b=P0PUqVNDClNomENp2Mb9lemkpVmuKmvETTYlpFxVmeFZI2KLAGSXkRgaDhlB4cvkXC
         rctRusOMYWcktZaZ4hivUEblVO9Iu9TsWDAyOCtY34eO0TNUY0AGUjA/J1vSXmD2D99L
         JigPg8HqwrF8MEr0O/r0lo2BWHoXgxTDNJJ6YJcfwjv5ONzez/4aGIPl5lJGcXDyy1bW
         a7ewezjVz6HJR+3oZ/AnDiz7baxorYZeB5DjwFVON9sYRSTTEeBe5a4KZqIuPWmcBFHj
         +2exR2obhFV5fFypeX0PldvmvzD8jb3fCGOiwsFP+OLa1Pl1ac4EYAAWcGR4iBAu3C5R
         glsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9iNMZibBS2r6UrLw2W/xlO65vJqdF+R8lzrIZSjULU=;
        b=q1C5QxsWPuDPMym7d3r41Dc1BMSUVB7ihd9dOs85xI3ODMrvHXm1FyZQdyqafERVn1
         a+idam/YRHO5W9xRBM2kcG7CcJPcHRongvLDnbw4D93qAbcSLnHv14dTPm9Mo5TKE2Ib
         hrijXJhgbUoksQ31MI9pPemOz0FUc/pCS3ngpkjrYaacF4H4RXkBhdfXA8CRMQ7z9D3T
         T/T4bKf+Ffm/TszGmYWPrxYNuGdnUhfFMkg0NoK+n4ugm9QeZPErBTt1a7FMHIgf7Ogn
         cKqAi7k8iguQbZcShZVv3ku9WaSrJqzpar4QmWexwUXEh+HQd2A0i9tBno0taldH1NCq
         SZtQ==
X-Gm-Message-State: APjAAAVSIpgQg0VeHhnTfpJA8FpEqy+/k6IozcSqVSQkXprkJ38/BBFC
        o8xOtrEyZJM5yCZzP9ODmC0OW4jvuM/ASKPfWSP2+w==
X-Google-Smtp-Source: APXvYqyIi/Bm0RHKyRaC+Sa7HgX+W90/4p2ucvAwomRL0pc+K9FnBiZScU2uh1o4E3WQ/N0DYWP1595P8L4EJsx2pdQ=
X-Received: by 2002:a25:c652:: with SMTP id k79mr57313302ybf.63.1555539843887;
 Wed, 17 Apr 2019 15:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190417202017.GA204974@google.com> <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
 <CAHQZ30B3+gzuw0=tofwW3yUwJ_MkN6GWPgVg0Qq_6S2tJHkcFQ@mail.gmail.com>
In-Reply-To: <CAHQZ30B3+gzuw0=tofwW3yUwJ_MkN6GWPgVg0Qq_6S2tJHkcFQ@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Wed, 17 Apr 2019 15:23:52 -0700
Message-ID:
 <CABXOdTcjr6zw9sceC-i_Za3uOaOVmKGFaJsyMxhLUPEhtKn_Jg@mail.gmail.com>
Subject: Re: [PATCH v3] usb/hcd: Send a uevent signaling that the host
 controller had died
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Guenter Roeck <groeck@chromium.org>,
        Oliver Neukum <oneukum@suse.com>,
        Daniel Kurtz <djkurtz@chromium.org>, zwisler@chromium.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417222352.b0uzpFd3_tzcDMaAzbx-JnrOTkuuTlpuTpVt3Gz4sko@z>

On Wed, Apr 17, 2019 at 3:11 PM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Wed, Apr 17, 2019 at 04:39:23PM -0400, Alan Stern wrote:
> >
> > This sounds like a golden opportunity!  Submit a separate patch making
> > the parameter to kobject_uevent_env be const (actually const char *
> > const []), then submit this patch on top of that one.
> So there are other parts of the code base that dynamically create their
> array values. So by making the function take const, it breaks :(

Confused. The calling code can still be non-const. I don't see the
parameter modified in kobject_uevent_env(), so declaring it const
should be possible. Can you give an example of code that no longer
works ?

Thanks,
Guenter

> >
> > Alan Stern
> >
