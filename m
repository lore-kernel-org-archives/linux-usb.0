Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8271C43219
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 19:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 853C22087C
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 19:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfD0TLG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 15:11:06 -0400
Received: from cassarossa.samfundet.no ([193.35.52.29]:56541 "EHLO
        cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfD0TLG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Apr 2019 15:11:06 -0400
Received: from pannekake.samfundet.no ([2001:67c:29f4::50])
        by cassarossa.samfundet.no with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sesse@samfundet.no>)
        id 1hKSir-0005pF-VN; Sat, 27 Apr 2019 21:10:54 +0200
Received: from sesse by pannekake.samfundet.no with local (Exim 4.92)
        (envelope-from <sesse@samfundet.no>)
        id 1hKSir-000AZn-Lj; Sat, 27 Apr 2019 21:10:53 +0200
Date:   Sat, 27 Apr 2019 21:10:53 +0200
From:   "Steinar H. Gunderson" <sesse@debian.org>
To:     Benjamin Drung <bdrung@posteo.de>, 918800@bugs.debian.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, control@bugs.debian.org
Subject: Re: Bug#918800: PROBLEM: USB 3.0 NIC operates only at USB 2.0 speed
 on Odroid HC1
Message-ID: <20190427191053.bp6hfjbfnv6otdwz@sesse.net>
References: <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <d720bae86ab67d2387c32444c835cd52b2408e6e.camel@posteo.de>
 <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <20190424112554.GA35824@sesse.net>
 <20190427131235.GA40843@sesse.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190427131235.GA40843@sesse.net>
X-Operating-System: Linux 5.0.6 on a x86_64
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

merge 925167 918800
thanks

On Sat, Apr 27, 2019 at 03:12:35PM +0200, Steinar H. Gunderson wrote:
> Now I have; I rebuilt the Debian kernel with
> 
>   USB=y
>   USB_XHCI_HCD=y
>   CONFIG_USB_XHCI_PLATFORM=y
> 
> and the NIC still comes up at 480M. So, no go.

Correction: After a hard reset, it works.

Even better, this patch makes it work also with everything as modules:

  https://marc.info/?l=linux-usb&m=155321315512949&w=2

and there's already a Debian bug for that, so merging. I've verified
that this patch works for me (after a hard reset).

Debian maintainers: This is a tiny little patch; would you be willing to
accept it for buster, so that ODROID users can get unhampered speeds?

(There's some big.LITTLE stuff that still keeps it back in some scenarios,
but this gets my iperf on XU4 to 620 Mbit/sec output and 920 Mbit/sec input.)

/* Steinar */
-- 
Homepage: https://www.sesse.net/
