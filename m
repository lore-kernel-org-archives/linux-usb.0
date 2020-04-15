Return-Path: <SRS0=gNVC=57=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8ADC2BB1D
	for <linux-usb@archiver.kernel.org>; Wed, 15 Apr 2020 01:26:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B171C20784
	for <linux-usb@archiver.kernel.org>; Wed, 15 Apr 2020 01:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392549AbgDOB0U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Apr 2020 21:26:20 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34355 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2392550AbgDOB0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 21:26:16 -0400
Received: (qmail 22003 invoked by uid 500); 14 Apr 2020 21:26:12 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Apr 2020 21:26:12 -0400
Date:   Tue, 14 Apr 2020 21:26:12 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     bugzilla-daemon@bugzilla.kernel.org,
        Zeng Tao <prime.zeng@hisilicon.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam
 no longer found on Fedora 31 with 5.4.11 kernel
In-Reply-To: <bug-207219-208809-lY0OCUsUvy@https.bugzilla.kernel.org/>
Message-ID: <Pine.LNX.4.44L0.2004142120060.21162-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=207219
> 
> --- Comment #5 from William Bader (williambader@hotmail.com) ---
> Thanks for looking at it.
> 
> >Try starting with a vanilla (bad) kernel and reverting commit bd0e6c9614b9;
> >let's see if that fixes the camera problem.
> 
> Yes, that fixed the camera problem.
> 
> What is the next step?

I think the next step is for me to revert that commit.  It was written
by Zeng Tao; he said that it makes Linux behave more like Windows.  
However, based on the behavior of your webcam, I doubt that is true.  
If Windows tried to use the "old scheme" for enumerating the webcam, it 
wouldn't work at all.  At least, not if the webcam behaves the same as 
it does in your tests.

Zeng, any comments?  You can see the discussion on Bugzilla at the URL 
above.

Alan Stern

