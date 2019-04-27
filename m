Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C75C43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 13:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C05C1208C2
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 13:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfD0NMu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 09:12:50 -0400
Received: from cassarossa.samfundet.no ([193.35.52.29]:57045 "EHLO
        cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD0NMu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Apr 2019 09:12:50 -0400
Received: from pannekake.samfundet.no ([2001:67c:29f4::50])
        by cassarossa.samfundet.no with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sesse@samfundet.no>)
        id 1hKN87-0001tc-K7; Sat, 27 Apr 2019 15:12:36 +0200
Received: from sesse by pannekake.samfundet.no with local (Exim 4.92)
        (envelope-from <sesse@samfundet.no>)
        id 1hKN87-00005t-B8; Sat, 27 Apr 2019 15:12:35 +0200
Date:   Sat, 27 Apr 2019 15:12:35 +0200
From:   "Steinar H. Gunderson" <sesse@debian.org>
To:     Benjamin Drung <bdrung@posteo.de>, 918800@bugs.debian.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: Bug#918800: PROBLEM: USB 3.0 NIC operates only at USB 2.0 speed
 on Odroid HC1
Message-ID: <20190427131235.GA40843@sesse.net>
References: <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <d720bae86ab67d2387c32444c835cd52b2408e6e.camel@posteo.de>
 <154704226118.1322.1006713485599467999.reportbug@odroid.bdrung.de>
 <20190424112554.GA35824@sesse.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190424112554.GA35824@sesse.net>
X-Operating-System: Linux 5.0.6 on a x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 24, 2019 at 01:25:54PM +0200, Steinar H. Gunderson wrote:
> I have the same problem with the ODROID XU4, which also includes a dwc3 and
> an 8152 (it's probably dwc3-specific; the driver has been problematic
> before). I haven't checked whether CONFIG_USB_XHCI_PLATFORM=y helps, though.

Now I have; I rebuilt the Debian kernel with

  USB=y
  USB_XHCI_HCD=y
  CONFIG_USB_XHCI_PLATFORM=y

and the NIC still comes up at 480M. So, no go.

/* Steinar */
-- 
Homepage: https://www.sesse.net/
