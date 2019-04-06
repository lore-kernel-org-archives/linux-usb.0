Return-Path: <SRS0=peg9=SI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF95C10F06
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 15:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 156CB20863
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 15:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbfDFPei (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Apr 2019 11:34:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43749 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726419AbfDFPei (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Apr 2019 11:34:38 -0400
Received: (qmail 19525 invoked by uid 500); 6 Apr 2019 11:34:37 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Apr 2019 11:34:37 -0400
Date:   Sat, 6 Apr 2019 11:34:37 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <FCCAD5C7-4836-45F1-85EE-51E5AE001740@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904061132460.19196-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Apr 2019, Bollinger, Seth wrote:

> On Apr 5, 2019, at 4:01 PM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> Why is the remote buffer too small?  If you can figure that out then
> you should be able to fix the problem pretty easily.
> 
> The usb-storage driver is doing a 32K read.  When it does the read all in one buffer, it succeeds.  If it does it using a scatter gather read (which generates an URB for each fragment in usb_sg_init), then it fails because the first URB only wants to read something like 3K.

Why does a 3-KB read cause a failure?  It should work perfectly well.

Alan Stern

