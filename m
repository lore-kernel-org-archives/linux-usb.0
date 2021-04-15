Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697B0C433ED
	for <linux-usb@archiver.kernel.org>; Thu, 15 Apr 2021 18:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33121610E6
	for <linux-usb@archiver.kernel.org>; Thu, 15 Apr 2021 18:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhDOSrC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Apr 2021 14:47:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39461 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234101AbhDOSrB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 14:47:01 -0400
Received: (qmail 16071 invoked by uid 1000); 15 Apr 2021 14:46:37 -0400
Date:   Thu, 15 Apr 2021 14:46:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Chris Chiu <chris.chiu@canonical.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's
 Realtek Hub
Message-ID: <20210415184637.GA15445@rowland.harvard.edu>
References: <20210415114856.4555-1-chris.chiu@canonical.com>
 <YHgyP8tGNM1Wi5dJ@kroah.com>
 <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 16, 2021 at 12:13:43AM +0800, Chris Chiu wrote:
> One thing worth mentioning here, I never hit the hub_ext_port_status -71
> problem if I resume by waking up from the keyboard connected to the hub.

I thought you said earlier that the port got into trouble while it was 
suspending, not while it was resuming.  You wrote:

> [ 2789.679812] usb 3-4-port3: can't suspend, status -110

So if the problem occurs during suspend, how can it be possible to avoid 
the problem by taking some particular action later while resuming?

> But the usbcore kernel log shows me wPortStatus: 0503 wPortChane: 0004
> of that port while resuming. In normal cases, they are 0507:0000.

The 0004 bit of wPortChange means that the suspend status has changed; 
the port is no longer suspended because the device attached to that port 
(your keyboard) issued a wakeup request.

>  I don't know how to SetPortFeature() with setting the status change bit only.

You can't.  Only the hub itself can set the wPortChange bits.

> Or maybe it's just some kind of timing issue of the
> idle/suspend/resume signaling.

Not timing.  It's because you woke the system up from the attached 
keyboard.

Alan Stern
