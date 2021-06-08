Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9993BC4743D
	for <linux-usb@archiver.kernel.org>; Tue,  8 Jun 2021 18:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80B7261376
	for <linux-usb@archiver.kernel.org>; Tue,  8 Jun 2021 18:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhFHSWd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Jun 2021 14:22:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60027 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233348AbhFHSWc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 14:22:32 -0400
Received: (qmail 1813769 invoked by uid 1000); 8 Jun 2021 14:20:38 -0400
Date:   Tue, 8 Jun 2021 14:20:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        ierturk@ieee.org
Subject: Re: Strange problem with USB device
Message-ID: <20210608182038.GA1812516@rowland.harvard.edu>
References: <cfc37ce0-823e-0d19-f5d7-fcd571a94943@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc37ce0-823e-0d19-f5d7-fcd571a94943@lwfinger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 12:41:23PM -0500, Larry Finger wrote:
> Hi,
> 
> In https://bugzilla.suse.com/show_bug.cgi?id=1186889, a user is
> reporting that his Bluetooth component of a Realtek RTL8822CE is not

Is that a USB device?  That is, does it connect to the computer 
via a USB cable?  I'll assume it does...

> being found in openSUSE's kernel 5.3.18. His lsusb scan is as follows:
> 
> $ lsusb
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 003: ID 13d3:56c9 IMC Networks HP TrueVision HD Camera
> Bus 001 Device 002: ID 045e:07fd Microsoft Corp. Nano Transceiver 1.1
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> The Bluetooth device is found and works in Windows 10, where the Device
> Manager reports hardware ID's of 0bda:b00c. This combination is in
> driver btusb.
> 
> Is there a bug in the USB bus scan in kernel 5.3.18 that has since been
> fixed, or is there still a bug that misses this device?

Given only the information you have provided, it is impossible to 
answer that question.  Broadly speaking, lots of bugs in the USB 
subsystem have been fixed since kernel 5.3.18, but I don't know 
if any of them would affect detecting new devices on the bus like 
this.

One thing you might try is to turn on USB debugging before 
plugging in the device:

echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

The additional information this adds to the dmesg log may be 
helpful.

Alan Stern
