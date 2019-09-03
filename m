Return-Path: <SRS0=d4Tt=W6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65E1C3A5A2
	for <linux-usb@archiver.kernel.org>; Tue,  3 Sep 2019 10:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DB6422CF7
	for <linux-usb@archiver.kernel.org>; Tue,  3 Sep 2019 10:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lrhKF9v6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfICKq0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Sep 2019 06:46:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33725 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbfICKq0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 06:46:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so5479847pfl.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2019 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhIll50zBtRbSQXnPI2yzC/EvrC1KoXXdnGgqdqJO9A=;
        b=lrhKF9v6lRIovR3Fkujrfgr7gKSwlEJ7+i6IQTcO8eTPTBSgliXQ5zNf5v6ajv4S9W
         QWdWOXil3hVylbdAgmRLw1nI2LPBNYxRzAtBGkWCVNUHBgW9ilhpLiU46m/ER4E9iL3L
         tPuPZEG/cqYd7Igw/pwOgo7WG783sFr0aG7yvh/RB4IikEihwWKYMlrnmJY3uIXR8S7W
         CPZQyEUZdYm6rg2rxw6g4GAZJJGCicsK7YelDhesn3xb8Di725S1QSrq/GhkqUX+jPtb
         wA3JrbaT2HkdvQ0OFXo1/pZqwCoSKz+MBWx4vJZVDLLcLdDETd1F1g05NNk6XW7dq2B8
         JPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhIll50zBtRbSQXnPI2yzC/EvrC1KoXXdnGgqdqJO9A=;
        b=kGPos+vchoxvviJsZib5WISATMhsDj/M8ZMQe19t9QIAT9IWvSozsockrmjWWFKKK4
         byKxFAkTxGFyR08ObHmDWyuvjAdeo7ihiBuFBKzGUJ7kzrEjwsDaZPizup94EdsBVrs+
         K9Sp0ss4uRib9rPz23oUkvaQ9ZjYtHhmtAt8nGzfZZVB14VNCBCDfwKbCmlvb6SQHZsB
         mI23C+dzT4/OCT9s+tfpQBmlTatHx2AKyq5VAgS3+/1Y/LxUhQqugXgFxBLZeg09QSF9
         sYJhZsKXXeOJi/bQwmxvc3KZFjbulKH1oIKZ8bXpGMPeeiEP/kp4H2HZbTQdtHLteQ/D
         Sd2Q==
X-Gm-Message-State: APjAAAWR2j63RUuEfeeYfOCliWPTzP7cQ2686AvMC4xcL7+LVE7bKD/V
        57maVHWAwdmtDsqXwhaUUzi4I1aEnlywwuiywUv5ug==
X-Google-Smtp-Source: APXvYqyW6c2iTf3Cj4Rx0JLVeiYDRNlELp3HlgGAgqlk6g4GIqImK67Iia0aTMbZ+ipN516EjCRcBw+bJtrP6M6Aeus=
X-Received: by 2002:a17:90a:ff08:: with SMTP id ce8mr7671823pjb.123.1567507584882;
 Tue, 03 Sep 2019 03:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>
 <nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm> <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>
In-Reply-To: <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 3 Sep 2019 12:46:13 +0200
Message-ID: <CAAeHK+yissGc22RXh6t3KZxnGL=6_+PdP7LoQ_dvfALJcdQk8g@mail.gmail.com>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech driver
To:     Roderick.Colenbrander@sony.com
Cc:     Jiri Kosina <jikos@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 24, 2019 at 2:41 AM <Roderick.Colenbrander@sony.com> wrote:
>
> On Thu, 22 Aug 2019, Alan Stern wrote:
>
> > > > > > I've ran the fuzzer with your patches applied overnight and noticed
> > > > > > another fallout of similar bugs. I think they are caused by a similar
> > > > > > issue in the sony HID driver. There's no hid_hw_stop() call in the "if
> > > > > > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Does it
> > > > > > look like a bug to you?
> > > > >
> > > > > It looks like the relevant hid_hw_stop() call is the one at the end of
> > > > > sony_configure_input().  But I can't tell if doing that way is valid or
> > > > > not -- in practice the code would end up calling hid_disconnect() while
> > > > > hid_connect() was still running, which doesn't seem like a good idea.
> > > > >
> > > > > There's a comment about this near the end of sony_probe().  I suspect
> > > > > it would be better to call hid_hw_stop() in the conditional code
> > > > > following that comment rather than in sony_configure_input().
> > > > >
> > > > > Either way, these are all things Jiri should know about or check up on.
> > > > >
> > > > > Have you gotten any test results from syzbot exercising these pathways?
> > > > > You ought to be able to tell which HID driver is involved by looking
> > > > > through the console output.
> > > >
> > > > Yes, a typical crash is below, that's why I thought it's the sony
> > > > driver. Adding hid_hw_stop() in sony_probe() stops the issue from
> > > > happening, but I don't know whether it's the right fix.
> > >
> > > Probably you have to add hid_hw_stop() in sony_probe() and remove it
> > > from sony_configure_input().  But like I said above, Jiri should look
> > > into this.
>
> > It almost certainly is, thanks.
>
> > Adding Roderick to CC ... Roderick, will you be able to test and submit
> > a patch fixing that?
> >
> > --
> > Jiri Kosina
> > SUSE Labs
>
> Sure we will have a look and do some testing. Hopefully we can share a patch some time next week.

Hi Roderick,

I was wondering if you had a chance to look into this?

Once the Logitech fix is upstream, this similar Sony bug will start
producing a large number of similar syzbot reports since it causes a
major memory corruption and we'll need to triage them all again. It
would be nice to get the Sony fix merged together with the Logitech
one. Or at least to have it available so I can apply it manually until
it is merged.

Thanks!
