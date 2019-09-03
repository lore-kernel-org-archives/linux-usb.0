Return-Path: <SRS0=d4Tt=W6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59605C3A5A2
	for <linux-usb@archiver.kernel.org>; Tue,  3 Sep 2019 15:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 328132077B
	for <linux-usb@archiver.kernel.org>; Tue,  3 Sep 2019 15:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfICPnh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Sep 2019 11:43:37 -0400
Received: from dsl092-148-226.wdc2.dsl.speakeasy.net ([66.92.148.226]:50153
        "EHLO nathanst.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbfICPnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 11:43:37 -0400
Received: from holmes.nathanst.com (nathanst@localhost [127.0.0.1])
        by nathanst.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id x83FhXo0032695
        for <linux-usb@vger.kernel.org>; Tue, 3 Sep 2019 11:43:33 -0400
Received: (from nathanst@localhost)
        by holmes.nathanst.com (8.13.4/8.13.4/Submit) id x83FhX6p032693
        for linux-usb@vger.kernel.org; Tue, 3 Sep 2019 11:43:33 -0400
Date:   Tue, 3 Sep 2019 11:43:33 -0400
From:   Nathan Stratton Treadway <vgerlists@nathanst.com>
To:     linux-usb@vger.kernel.org
Subject: Re: Adding "UAS" protocol line to usb.ids file?
Message-ID: <20190903154333.GT4337@nathanst.com>
References: <20190817220145.GJ1403@nathanst.com> <20190903133933.GA9435@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903133933.GA9435@kroah.com>
User-Agent: Mutt/1.5.9i
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 03, 2019 at 15:39:33 +0200, Greg KH wrote:
> On Sat, Aug 17, 2019 at 06:01:45PM -0400, Nathan Stratton Treadway wrote:
> > I noticed that when I use "lsusb -v" on a UAS-enabled drive enclosure,
> > the bInterfaceProtocol line for #80/0x50 has a "protocol name" label but the
> > one for #98/0x62 does not:
[...]
> > So...I was wondering if there was any particular reason that protocol
> > 98 isn't included in the usb.ids file?
> 
> No one got around to it?  Feel free to submit a patch to the web site
> that handles these to upate it.

Thanks for your reply.  I did look there first, but because the
"Bulk-Only" and "UAS" protocol names seem so similar but the UAS name
hasn't been created for several years now, I started to wonder if there
was a more complicated background story behind the situation.

Anyway, for what it's worth there was a submission for the UAS protocal
name on the USB ID website in 2013 and I submitted another one a couple
weeks ago, but so far both are still showing up as grey (which seems to
indicate that it's still pending approval by "an admin").
  https://usb-ids.gowdy.us/read/UC/08/06/62

I'll see if I can track down contact information for the admin(s) there.

						Nathan
