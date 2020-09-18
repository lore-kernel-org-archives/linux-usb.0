Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7277CC43463
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 14:52:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C1B21973
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 14:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgIROwc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 18 Sep 2020 10:52:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51789 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726253AbgIROwc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 10:52:32 -0400
Received: (qmail 1130178 invoked by uid 1000); 18 Sep 2020 10:52:31 -0400
Date:   Fri, 18 Sep 2020 10:52:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     linux-usb@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>,
        stable@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bastien Nocera <hadess@hadess.net>, syzkaller@googlegroups.com,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/3] usbcore/driver: Fix specific driver selection
Message-ID: <20200918145231.GA1130146@rowland.harvard.edu>
References: <a6e14983a8849d5f75a43f403c7cc721b6e4a420.camel@hadess.net>
 <20200917144151.355848-1-m.v.b@runbox.com>
 <363eab9a-c32a-4c60-4d6b-14ae8d873c52@runbox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363eab9a-c32a-4c60-4d6b-14ae8d873c52@runbox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 18, 2020 at 05:31:26PM +0300, M. Vefa Bicakci wrote:
> Hello all,
> 
> I noticed that applying this patch on its own to the kernel causes the following
> unexpected behaviour: As soon as the usbip_host module is loaded, all of the
> USB devices are re-probed() by their drivers, and this causes the USB devices
> connected to my system to be momentarily unavailable. This happens because
> *without* the third patch in this patch set, the match function for the usbip_host
> device driver unconditionally returns true.
> 
> The third patch in this patch set [1] makes this unexpected behaviour go
> away, as it makes the usbip device driver's match function only match devices
> that were requested by user-space to be used with USB-IP.
> 
> Is this something to be concerned about? I was thinking of people who might be
> using git-bisect, who might encounter this issue in an unexpected manner.
> 
> As a potential solution, I can prepare another patch to revert commit
> 7a2f2974f2 ("usbip: Implement a match function to fix usbip") so that this
> unexpected behaviour will not be observed. This revert would be placed as
> the first patch in the patch series.

Yes, that sounds like a good solution.

Alan Stern
