Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34672C433EF
	for <linux-usb@archiver.kernel.org>; Mon, 25 Apr 2022 13:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbiDYNdJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 25 Apr 2022 09:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242022AbiDYNbW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 09:31:22 -0400
X-Greylist: delayed 295 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Apr 2022 06:28:14 PDT
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA69B41616
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 06:28:14 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 82B9AC0008;
        Mon, 25 Apr 2022 13:28:12 +0000 (UTC)
Message-ID: <ce9d268bd6fdbe65d7e3256f12d9b78710070d25.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon, 25 Apr 2022 15:28:12 +0200
In-Reply-To: <20220425132315.924477-1-hadess@hadess.net>
References: <20220425132315.924477-1-hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

On Mon, 2022-04-25 at 15:23 +0200, Bastien Nocera wrote:
> Note that this variant needs to do a few things that the evdev revoke
> doesn't need to handle, particular:
> - cancelling pending async transfers
> - making sure to release claimed interfaces on revoke so they can be
>   opened by another process/user, as USB interfaces require being
>   exclusively claimed to be used.

This is a first version of the patch, untested as yet (although I at
least checked that it compiled...).

I wanted to have comments on whether I was on the right path, in terms
of coding style, but also that I had plugged all the entry points that
would allow a user to communicate with a USB device after revocation.

I also have a local patch that allows using BPF to revoke a USB device
that's trivial so would need testing before posting.

You can find links to Peter's hidraw revocation patches at:
https://github.com/systemd/systemd/pull/23140#issue-1210571942

Cheers
