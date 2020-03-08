Return-Path: <SRS0=G0VN=4Z=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5565C10DCE
	for <linux-usb@archiver.kernel.org>; Sun,  8 Mar 2020 15:54:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8593C20848
	for <linux-usb@archiver.kernel.org>; Sun,  8 Mar 2020 15:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCHPy4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 8 Mar 2020 11:54:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42683 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726270AbgCHPy4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Mar 2020 11:54:56 -0400
Received: (qmail 31319 invoked by uid 500); 8 Mar 2020 11:54:55 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Mar 2020 11:54:55 -0400
Date:   Sun, 8 Mar 2020 11:54:55 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: dvdrw USB3 drive seen as USB2
In-Reply-To: <5d16425c-a054-779e-cc3d-efad46ee07f0@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2003081143200.30710-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 7 Mar 2020, James wrote:

> https://github.com/aircrack-ng/rtl8812au/blob/v5.6.4.2/README.md
> > USB Mode Switch
> >
> > 0: doesn't switch, 1: switch from usb2.0 to usb 3.0 2: switch from 
> > usb3.0 to usb 2.0
> >
> > $ rmmod 88XXau
> > $ modprobe 88XXau rtw_switch_usb_mode:int (0: no switch 1: switch from 
> > usb2 to usb3 2: switch from usb3 to usb2)

Have you tried using this driver?  Does it work?

Maybe you can convince the authors of this 88XXau driver to merge it 
with the rtl88x2bu driver already in the standard kernel.  That's what 
was managing your Realtek adapter in your earlier email.

Alan Stern


