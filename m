Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B54CC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 12:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 458D3218B0
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 12:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfDXMFz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 08:05:55 -0400
Received: from cassarossa.samfundet.no ([193.35.52.29]:58617 "EHLO
        cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfDXMFz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 08:05:55 -0400
X-Greylist: delayed 2383 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Apr 2019 08:05:53 EDT
Received: from pannekake.samfundet.no ([2001:67c:29f4::50])
        by cassarossa.samfundet.no with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sesse@samfundet.no>)
        id 1hJG2E-0001Nw-MA; Wed, 24 Apr 2019 13:25:55 +0200
Received: from sesse by pannekake.samfundet.no with local (Exim 4.92)
        (envelope-from <sesse@samfundet.no>)
        id 1hJG2E-000AKY-GO; Wed, 24 Apr 2019 13:25:54 +0200
Date:   Wed, 24 Apr 2019 13:25:54 +0200
From:   "Steinar H. Gunderson" <sesse@debian.org>
To:     Benjamin Drung <bdrung@posteo.de>, 918800@bugs.debian.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: Bug#918800: PROBLEM: USB 3.0 NIC operates only at USB 2.0 speed
 on Odroid HC1
Message-ID: <20190424112554.GA35824@sesse.net>
References: <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <d720bae86ab67d2387c32444c835cd52b2408e6e.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d720bae86ab67d2387c32444c835cd52b2408e6e.camel@posteo.de>
X-Operating-System: Linux 5.0.6 on a x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 02, 2019 at 01:39:06PM +0100, Benjamin Drung wrote:
> The Odroid HC1 ARM board contains a JMicron JMS578 USB 3.0 to SATA
> Bridge and a Realtek Gbps Ethernet device connected to an USB 3.0 host.
> The SATA bridge works correctly at USB 3.0 speed, but the Ethernet
> controller operates only at USB 2.0 speed. I tracked this behaviour down
> to the CONFIG_USB_XHCI_PLATFORM kernel configuration.

I have the same problem with the ODROID XU4, which also includes a dwc3 and
an 8152 (it's probably dwc3-specific; the driver has been problematic
before). I haven't checked whether CONFIG_USB_XHCI_PLATFORM=y helps, though.

Linux liadroid 4.19.0-4-armmp-lpae #1 SMP Debian 4.19.28-2 (2019-03-15) armv7l GNU/Linux

/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, Driver=r8152, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=exynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=exynos-ehci/3p, 480M

/* Steinar */
-- 
Homepage: https://www.sesse.net/
