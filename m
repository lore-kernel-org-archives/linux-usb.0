Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1EFC282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 20:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA2DA204FD
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 20:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfDQUjY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 16:39:24 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:59422 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727340AbfDQUjY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 16:39:24 -0400
Received: (qmail 5106 invoked by uid 2102); 17 Apr 2019 16:39:23 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Apr 2019 16:39:23 -0400
Date:   Wed, 17 Apr 2019 16:39:23 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Raul Rangel <rrangel@chromium.org>
cc:     linux-usb@vger.kernel.org, <groeck@chromium.org>,
        <oneukum@suse.com>, <djkurtz@chromium.org>, <zwisler@chromium.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3] usb/hcd: Send a uevent signaling that the host
 controller had died
In-Reply-To: <20190417202017.GA204974@google.com>
Message-ID: <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417203923.EH-QEdFBdVzTeOBMUKffn8yOWHIjUMpRu3fCbCiRMws@z>

On Wed, 17 Apr 2019, Raul Rangel wrote:

> On Wed, Apr 17, 2019 at 03:14:14PM -0400, Alan Stern wrote:
> > On Wed, 17 Apr 2019, Raul E Rangel wrote:
> > 
> > > +/* Workqueue routine for when the root-hub has died. */
> > > +static void hcd_died_work(struct work_struct *work)
> > > +{
> > > +	struct usb_hcd *hcd = container_of(work, struct usb_hcd, died_work);
> > > +	char *env[] = {
> > > +		"ERROR=DEAD",
> > > +		NULL
> > > +	};
> > 
> > This can now be
> > 
> > 	static const char *env[] = ...
> > 
> > right?  There's no need for the array to be reinitialized every time 
> > the routine runs.
> I originally tried to make it const, but kobject_uevent_env doesn't
> declare the parameter as const, so the compiler yelled at me. I could
> make it static, but a static without a const makes me wary. I can add it
> if you think it's fine.

This sounds like a golden opportunity!  Submit a separate patch making 
the parameter to kobject_uevent_env be const (actually const char * 
const []), then submit this patch on top of that one.

Alan Stern

