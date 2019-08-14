Return-Path: <SRS0=XFIG=WK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B454BC0650F
	for <linux-usb@archiver.kernel.org>; Wed, 14 Aug 2019 08:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 964862133F
	for <linux-usb@archiver.kernel.org>; Wed, 14 Aug 2019 08:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfHNIby (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 14 Aug 2019 04:31:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:43854 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725265AbfHNIby (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 04:31:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DCA4BAD45;
        Wed, 14 Aug 2019 08:31:52 +0000 (UTC)
Message-ID: <1565771508.25764.3.camel@suse.com>
Subject: Re: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
From:   Oliver Neukum <oneukum@suse.com>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 14 Aug 2019 10:31:48 +0200
In-Reply-To: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 08:17 +0000 schrieb  Schmid, Carsten :
> [Resend - had mailer errors ]
> 
> Hi Florian,
> 
> today i have seen a strange behaviour of two D-Link DUB-1312 adapters (same Revision A1).
> Plugging them into the same port (!) on my device one of them is recognized as SuperSpeed, the other as high speed ???
> (working on 4.14.129 LTS)
> 
> From dmesg, the "faulty" one:
> [  530.585871] usb 1-2: new high-speed USB device number 4 using xhci_hcd   <<<<<<<<< HUH ????

XHCI is not like EHCI. It needs no companion controller, as it serves
all speeds.

> I had a look at the driver code of ax88179, but that one didn't change much in the past up to v5.2.
> Nothing that explains what i can see here.

This is on a lower layer than ax88179. This comes from xhci_hcd.
Is this a regression?

	Regards
		Oliver

