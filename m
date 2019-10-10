Return-Path: <SRS0=fO8s=YD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA2BC4360C
	for <linux-usb@archiver.kernel.org>; Thu, 10 Oct 2019 08:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B1A92067B
	for <linux-usb@archiver.kernel.org>; Thu, 10 Oct 2019 08:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733188AbfJJI1B (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Oct 2019 04:27:01 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50139 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbfJJI1B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 04:27:01 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F24D7240002;
        Thu, 10 Oct 2019 08:26:58 +0000 (UTC)
Message-ID: <ae7c3e3abfce7cc6d69e8453c3964245db160143.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when
 available
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 10 Oct 2019 10:26:58 +0200
In-Reply-To: <Pine.LNX.4.44L0.1910091435300.1603-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1910091435300.1603-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-10-09 at 14:45 -0400, Alan Stern wrote:
> 
On Wed, 9 Oct 2019, Bastien Nocera wrote:
> 
> <snip>
> > +               return
> device_driver_attach(usb_generic_driver.drvwrap.driver, dev);
> > +       return error;
> 
> I think that's right.  A little testing wouldn't hurt.

device_driver_attach() isn't available to this part of the code.

I think the only way to do things here might be to set status bit for
the usb_device and launch device_reprobe(). The second time around, we
wouldn't match or probe the specific driver.

