Return-Path: <SRS0=Dimz=Z7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5285C43603
	for <linux-usb@archiver.kernel.org>; Mon,  9 Dec 2019 15:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EF492077B
	for <linux-usb@archiver.kernel.org>; Mon,  9 Dec 2019 15:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfLIPYq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Dec 2019 10:24:46 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:36912 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726197AbfLIPYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 10:24:45 -0500
Received: (qmail 2025 invoked by uid 2102); 9 Dec 2019 10:24:45 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 10:24:45 -0500
Date:   Mon, 9 Dec 2019 10:24:45 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <023701d5ae77$14ec9d50$3ec5d7f0$@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912091024060.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 9 Dec 2019, Erkka Talvitie wrote:

> > Ok, just to double check:
> > 
> > I take the existing driver code (I will not apply the earlier RFC on top
> of
> > that) and apply one more check before the original stall check (that is):
> > } else if (QTD_CERR(token)) {
> > 
> > The check that I will add is checking MMF bit && PID == IN, and this check
> > comes right after the babble check, right?
> > 
> > Good, seems like a simple change. Yet I still prefer to test the change.
> > Unfortunately that goes to the next week as we have a national holiday
> > tomorrow.
> > I will get back to you most likely on Monday.
> 
> I tested this change and it removes the error messages from the output.

Great!  Okay, feel free to submit a new patch.

Alan Stern

