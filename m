Return-Path: <SRS0=3jNv=3E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25624C33CB1
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 12:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA5952187F
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 12:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgAOMFf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:05:35 -0500
Received: from bmailout1.hostsharing.net ([83.223.95.100]:53545 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOMFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:05:35 -0500
X-Greylist: delayed 506 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 07:05:34 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id A825A3000BB4B;
        Wed, 15 Jan 2020 12:57:07 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 81D4C40EB1; Wed, 15 Jan 2020 12:57:07 +0100 (CET)
Date:   Wed, 15 Jan 2020 12:57:07 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Message-ID: <20200115115707.c4l7t64r5obanvg3@wunner.de>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
 <20200109123617.5ovxwkfnmf7ou4z4@wunner.de>
 <87h80x6qog.fsf@kernel.org>
 <788fc4ab-28f4-f4de-66b3-8c39ab841c3e@synopsys.com>
 <20200115113039.lmz6kzwqspq2vugc@wunner.de>
 <d11f5537-f0f8-20cd-ff5c-c4951e60d3dc@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11f5537-f0f8-20cd-ff5c-c4951e60d3dc@synopsys.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 11:44:14AM +0000, Minas Harutyunyan wrote:
> On 1/15/2020 3:30 PM, Lukas Wunner wrote:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Dusb_77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas-40wunner.de_&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=6z9Al9FrHR_ZqbbtSAsD16pvOL2S3XHxQnSzq8kusyI&m=RvUQvVjq5dj9CVUu3njmpdm88GS6B3rFv7iB9Rj8k4Y&s=p4AmQK1vx63kNa3BDdfxaOO1C80AvmgTQY5wtKJcXbc&e=
> 
> Actually I agree with you on unnecessary unlock/lock here. Currently I'm 
> going to test your patch before Ack.
> Just, want to check with you - did you see any issue in driver flow 
> without this patch? or it just code cleanup?

Just a cleanup.  I was looking through dwc_otg (which is still used by the
Raspberry Pi Foundation's downstream tree) and checked to what extent the
antipatterns found there are still present in dwc2, thereby found this
occurrence.

Thanks,

Lukas
