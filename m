Return-Path: <SRS0=ebhX=BD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BC8C433F7
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jul 2020 10:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB9BD20767
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jul 2020 10:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xbvouy0n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGXKj2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Jul 2020 06:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgGXKj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 06:39:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5C3C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:39:27 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k4so4218120pld.12
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzSAjHmvxrq5jlMWQdu7tmk/XfZDMdxsoUia3wQRxZA=;
        b=Xbvouy0ndkcuZB46VSOtK+fIsGhehly+txp8/9W7hxSMthWk8QMzfgRsiwvpowZllQ
         aJr9G2JSE9kXaEAz7H913ElfEVGZsld+k7wOCih6B7OEUZXNayIltyJEoZ+E7bAJNyUL
         cdnygLGG2WAK3UWojiph8yhqTg/nkubwIRvI8cDh3aVWkeLvQJGzNSZ0qyB0jtdjpgY5
         N2L+OttTdLJVe/ok3VWuBeyqHeDk67iespqu/HXql+/89cQvGo8IUSiBQDb33ASWH9sS
         Rs4pqkYkNQjxpSxvnVI3khPSlNU9oxMAoAZSlewmnH1V648XuklA8HfEAocTiT+k1NJR
         5n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzSAjHmvxrq5jlMWQdu7tmk/XfZDMdxsoUia3wQRxZA=;
        b=lU+xjOrf1zNPIpq1+hQhLbyO7dzHG88a8YGmIYHSUso+6Q/hM48nD93a9RleTPbfzm
         Hj4112VAYrEdjab/tbAomD48S+GsAg/ivd0OBFRusmsshP38/Veh5pjyWWdrInG1qwu5
         RRWp/QyEAbBPoKVoK6uUBFLyk6wyF7lSBDVhwDo+A6hmrlFsCeKKiRf7oHFZuG21eM3o
         iRgOKTV2H63fFSrFLWb3xBiftIQqcBK+xq4QdsBDGsDSaLBb4eEi/vL3uG5NFZmhblUy
         Yw+IDaekzQGecNrHLQ9+R3XIbKyPAA3AOjGQW9+OUVclg5pm9+FW/HamOHZ7zUhDGVaC
         su7A==
X-Gm-Message-State: AOAM533PG49dPaMyzO7BW7OzdMxb5hTHrXDnAkxpgxqWbce/r3DrUTcm
        ka6FvMW4OO5y6Rqn1SxH2n6/+u63WalI5wq1LCw5iw2x3PM=
X-Google-Smtp-Source: ABdhPJzC11PV2foemBi0wqZP3gH4K+wu/JU/qHTQgrQUaMeyYX72ipJqonuq6QV08JgIZcJjw6MjBc4qmYPhungv5ok=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr4725711pjb.181.1595587167183;
 Fri, 24 Jul 2020 03:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net> <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
In-Reply-To: <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Jul 2020 13:39:10 +0300
Message-ID: <CAHp75VeKgxcq8J8WFPhH8EBUoE3-TxGU0Tanc=Vb5ib_0VMVLA@mail.gmail.com>
Subject: Re: [PATCH v4] USB: Fix device driver race
To:     Bastien Nocera <hadess@hadess.net>
Cc:     USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 1:32 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net> wrote:

...

> > +static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
> > +{
> > +       struct usb_device_driver *new_udriver = data;
> > +       struct usb_device_driver *udriver;
> > +       struct usb_device *udev;
> > +
> > +       if (!dev->driver)
> > +               return 0;
> > +
> > +       udriver = to_usb_device_driver(dev->driver);
> > +       if (udriver != &usb_generic_driver)
> > +               return 0;
>
> What about
>
> static bool is_dev_usb_generic_driver(dev)
> {
>       struct usb_device_driver *udd = dev->driver ?
> to_usb_device_driver(dev->driver) : NULL;
>
>       return udd == &usb_generic_driver;
> }
>
>   if (!is_dev_usb_generic_driver)
>     return 0;
>
> ?
>
> > +       udev = to_usb_device(dev);
> > +       if (usb_device_match_id(udev, new_udriver->id_table) != NULL ||
> > +           (new_udriver->match && new_udriver->match(udev) == 0))
> > +               device_reprobe(dev);
> > +
> > +       return 0;
>
> What about
>
>      udev = to_usb_device(dev);
>      if (usb_device_match_id(udev, new_udriver->id_table) == NULL)
>        return 0;
> ?
>
>   if (new_udriver->match && new_udriver->match(udev) == 0))
>                device_reprobe(dev);
>     return 0;
>
> > +}

It actually sparks a lot of similarities with
__check_usb_generic(). Perhaps you may unify them?


-- 
With Best Regards,
Andy Shevchenko
