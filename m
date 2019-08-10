Return-Path: <SRS0=kKNA=WG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BDAC32751
	for <linux-usb@archiver.kernel.org>; Sat, 10 Aug 2019 08:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BDBE217D7
	for <linux-usb@archiver.kernel.org>; Sat, 10 Aug 2019 08:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="sIug2yxn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfHJILK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 10 Aug 2019 04:11:10 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:38817 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbfHJILK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Aug 2019 04:11:10 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 465FBq1zQ5z6q;
        Sat, 10 Aug 2019 10:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1565424579; bh=q1aJKKoJRIpLc6Wc5NXrw38laZ+/Z2tY7Fu74SJi3f0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sIug2yxnQwl5dUbydQwJXrCZyhbwYjbHB6mVs6TpGITcpy09c7EC8slLf+Nuph2Te
         4LU23zvkPe1r5AItU3TEsMZP1uuWlkLkuxyyvCuhh0MkrzoliLd7dj9DucUs3f8Mis
         q398PJGfDCv7FTE0kO0Hdv11tQ+9e3YmvYCTG9rL7i5H8S2zMTdVlVuBiYRBC6h4vM
         l4v6tQ9lqslNdXeQqtSw5nZH6nToGt8D6jJr1JjY3Fx6ymJkX1ZtVl5tYJ+7NXOPha
         r15nJN4PUQ7u0fWSD94z4KG9c4kxpY4ZhSOAv6UyPYGPB2l/68MBrmxtMlXX7PHhtC
         RJ/b/aTP3LEUA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Sat, 10 Aug 2019 10:11:05 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
Message-ID: <20190810081105.GA10667@qmqm.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
 <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
 <87r25utufw.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r25utufw.fsf@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 03:05:55PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Micha³ Miros³aw <mirq-linux@rere.qmqm.pl> writes:
> > Rewrite console support to fix a few shortcomings of the old code
> > preventing its use with multiple ports. This removes some duplicated
> > code and replaces a custom kthread with simpler workqueue item.
> >
> > Only port ttyGS0 gets to be a console for now.
> >
> > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Tested-by: Ladislav Michl <ladis@linux-mips.org>
> 
> checking file drivers/usb/gadget/function/u_serial.c
> Hunk #7 FAILED at 1206.
> Hunk #8 succeeded at 1302 (offset -2 lines).
> Hunk #9 succeeded at 1334 (offset -2 lines).
> Hunk #10 succeeded at 1363 (offset -2 lines).
> 1 out of 10 hunks FAILED
> 
> Could you rebase on my testing/next?

Sure. Should be ready in a few minutes.

Best Regards,
Micha³ Miros³aw
