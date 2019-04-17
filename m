Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBB4C282DC
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5F82217FA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387695AbfDQWlg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 18:41:36 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:51370 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387692AbfDQWlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 18:41:36 -0400
Received: by mail-it1-f195.google.com with SMTP id s3so410373itk.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 15:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tAY3tqZpNl1puGrkgrVxxOuIRHZ6LBNHbIdJbLHFZr0=;
        b=Vyi95qlw5HOhGTCo5L69hZ3v/tN7GOEmrBWdYyJ2feX+HANL53DazkVBEk3u6zEdHf
         s0N7KlcqzE+QxDt0kcrFnfMRSGroBcVjGGvScilcBDJ0X68LDcCvLfZsVvx4D19ZEreo
         YsEB4zrbkUcJ7Ray/loikxLcOEverNyZZy69whSwkXm5EyHYmB9+XnPXlid0Zjfa85Ep
         vU9Euvn+tPxA6R2GzgAIE2ZoONdvr5EtMgQXqX3tNCoxcd25ytXK9wOqBwYW6+YnJ1i/
         w61xJ0Mt52p4WNaMrQ0UykJ5qUmNOuedKT/WFxPTzZU/BvACKKYgoCQZpM1qTDATEOJ6
         eN0A==
X-Gm-Message-State: APjAAAU9WKxOwKfLnICqV3vkBXW8abMTGvQiBIzFZ4O6JxCbszBO4bq6
        23ax0wbBVeK041Mm7Bi9dSj52w==
X-Google-Smtp-Source: APXvYqwi7ZqoAmXMXDAm93P7ERl8NcVH2RuxzvRAA67ZR245zA+jaTDcpK6GTOSCkuHeMW4+t3h43Q==
X-Received: by 2002:a02:c510:: with SMTP id s16mr432119jam.51.1555540895170;
        Wed, 17 Apr 2019 15:41:35 -0700 (PDT)
Received: from google.com ([2620:15c:183:0:20b8:dee7:5447:d05])
        by smtp.gmail.com with ESMTPSA id p1sm180143itp.19.2019.04.17.15.41.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Apr 2019 15:41:33 -0700 (PDT)
Date:   Wed, 17 Apr 2019 16:41:29 -0600
From:   Raul Rangel <rrangel@chromium.org>
To:     Guenter Roeck <groeck@google.com>
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
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Raul Rangel <rrangel@chromium.org>
Subject: Re: [PATCH v3] usb/hcd: Send a uevent signaling that the host
 controller had died
Message-ID: <20190417224129.GA255388@google.com>
References: <20190417202017.GA204974@google.com>
 <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
 <CAHQZ30B3+gzuw0=tofwW3yUwJ_MkN6GWPgVg0Qq_6S2tJHkcFQ@mail.gmail.com>
 <CABXOdTcjr6zw9sceC-i_Za3uOaOVmKGFaJsyMxhLUPEhtKn_Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <CABXOdTcjr6zw9sceC-i_Za3uOaOVmKGFaJsyMxhLUPEhtKn_Jg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417224129.3K4GBQFoT3-BPYV7Bvs87bPswdYtKy_WPbFoxi0sZwo@z>

On Wed, Apr 17, 2019 at 03:23:52PM -0700, Guenter Roeck wrote:
> On Wed, Apr 17, 2019 at 3:11 PM Raul Rangel <rrangel@chromium.org> wrote:
> >
> > On Wed, Apr 17, 2019 at 04:39:23PM -0400, Alan Stern wrote:
> > >
> > > This sounds like a golden opportunity!  Submit a separate patch making
> > > the parameter to kobject_uevent_env be const (actually const char *
> > > const []), then submit this patch on top of that one.
> > So there are other parts of the code base that dynamically create their
> > array values. So by making the function take const, it breaks :(
> 
> Confused. The calling code can still be non-const. I don't see the
> parameter modified in kobject_uevent_env(), so declaring it const
> should be possible. Can you give an example of code that no longer
> works ?
static int notify_user_space(struct thermal_zone_device *tz, int trip)
{
	char *thermal_prop[5];
	int i;

	mutex_lock(&tz->lock);
	thermal_prop[0] = kasprintf(GFP_KERNEL, "NAME=%s", tz->type);
	thermal_prop[1] = kasprintf(GFP_KERNEL, "TEMP=%d", tz->temperature);
	thermal_prop[2] = kasprintf(GFP_KERNEL, "TRIP=%d", trip);
	thermal_prop[3] = kasprintf(GFP_KERNEL, "EVENT=%d", tz->notify_event);
	thermal_prop[4] = NULL;
	kobject_uevent_env(&tz->device.kobj, KOBJ_CHANGE, thermal_prop);
	for (i = 0; i < 4; ++i)
		kfree(thermal_prop[i]);
	mutex_unlock(&tz->lock);
	return 0;
}

drivers/thermal/user_space.c:48:52: error: passing 'char *[5]' to parameter of type 'const char *const *' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
        kobject_uevent_env(&tz->device.kobj, KOBJ_CHANGE, thermal_prop);
                                                          ^~~~~~~~~~~~
include/linux/kobject.h:238:22: note: passing argument to parameter 'envp' here
                        const char *const envp[]);
                                          ^

http://c-faq.com/ansi/constmismatch.html explains why it fails.

Raul

> 
> Thanks,
> Guenter
> 
> > >
> > > Alan Stern
> > >
