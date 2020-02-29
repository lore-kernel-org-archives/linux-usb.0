Return-Path: <SRS0=pefB=4R=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ED0C3F2D1
	for <linux-usb@archiver.kernel.org>; Sat, 29 Feb 2020 01:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 585A524697
	for <linux-usb@archiver.kernel.org>; Sat, 29 Feb 2020 01:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgB2Bv1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 28 Feb 2020 20:51:27 -0500
Received: from funyu.konbu.org ([51.15.241.64]:52982 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgB2Bv1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Feb 2020 20:51:27 -0500
Received: from tungsten (74.125.148.210.rev.vmobile.jp [210.148.125.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id BA76A2858EF;
        Sat, 29 Feb 2020 01:50:11 +0000 (UTC)
Date:   Sat, 29 Feb 2020 10:50:08 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH 0/4] usb: dwc2: Fixes and improvements
Message-ID: <20200229015008.GA936@tungsten>
References: <20200226210414.28133-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226210414.28133-1-linux@roeck-us.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

Thank you for your work on this.

I tested this series on my usual setup, discussed on a previous thread (kenzo +
veyron), and your patchset fixes the crashes I was seeing.

I also did some testing with usb-storage, everything works as expected.

Best, Boris.

Guenter Roeck wrote:
>This series addresses the following problems:
>
>- Fix receive buffer corruptions
>- Fix receive transfers with 0 byte transfer length
>- Abort transactions after unknown receive errors
>  if the receive buffer is full
>- Reduce "trimming xfer length" logging noise
>
>The problems fixed with this series were observed when connecting
>a DM9600 Ethernet adapter to Veyron Chromebooks such as the ASUS
>Chromebook C201PA. The series was tested extensively with this and
>other adapters.
>
>The observed problems are also reported when tethering various
>phones, so test coverage with such phones would be very appreciated.
>
>----------------------------------------------------------------
>Guenter Roeck (4):
>      usb: dwc2: Simplify and fix DMA alignment code
>      usb: dwc2: Do not update data length if it is 0 on inbound transfers
>      usb: dwc2: Abort transaction after errors with unknown reason
>      usb: dwc2: Make "trimming xfer length" a debug message
>
> drivers/usb/dwc2/hcd.c      | 82 ++++++++++++++++++++++++---------------------
> drivers/usb/dwc2/hcd_intr.c | 14 +++++++-
> 2 files changed, 56 insertions(+), 40 deletions(-)
