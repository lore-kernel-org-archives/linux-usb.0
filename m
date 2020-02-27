Return-Path: <SRS0=zE7s=4P=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E720C4BA24
	for <linux-usb@archiver.kernel.org>; Thu, 27 Feb 2020 09:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7C42222C2
	for <linux-usb@archiver.kernel.org>; Thu, 27 Feb 2020 09:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=skidata.com header.i=@skidata.com header.b="M400Y4Up"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgB0JJ5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Feb 2020 04:09:57 -0500
Received: from mail2.skidata.com ([91.230.2.91]:39246 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbgB0JJ5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 04:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1582794596; x=1614330596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GGXAG9VGUtBcj6dSnVrpF58a0PLRtACzPNYzg5fyNZY=;
  b=M400Y4UpmJYVogZ8RvbNayLRuRzsy/9qHUmXGoYPTCKp4q2EQFwbihEq
   dIugBIwP+Yyk21iGkNXRMRWiUX3KQuKOpvGTuy1M7Mm2n/YPQyCJ4i6oy
   opnhrWtbdm065lKpjBdqSrBzqo6736Onwu1Iqd7OXiYs3v6erW/m4K2fI
   NzdNKXXH1G1WPnc7SF5cJ9eVTjNUKvrUO+GG2fRIaQIY1pFQ6rfwrM/qF
   bt1njuxfSlnaEPJUJmoCTR/e6wy+BaPmfdzHORdSbTJXZHFfXnpzPRXwp
   lTCUuxa2Q8ljCCpZLuCgY0ofuQ3EMxUpAUHsFHknoKFpUdEcVeCO1nKUp
   g==;
IronPort-SDR: zX0IpQOI0McnictWxduh1MlRlU8VK/JdP/Za2WDJ486cyaysJHBMjpVay67sTvJUW81fb/DAAx
 HZ6n3NnZzoklYlhMoLO3s3B4bq66BVB669GC9k/9he9VuF/BzoezttwNbXyWXSoSogzg6SiEfB
 bJ00mqzOm1mX4gJsSmn9Cgr0riAMR8uVfji1v9JB8qNJnvJmR5Brj6J/KJQY/o985CKk45RdBI
 oGDHxMf32prPJVhXnyEKt1K/eWQMxobh0JBxSFa7s925YwT1WzmEQyKeExAbdVRyQEH4g1Jo/o
 CJY=
X-IronPort-AV: E=Sophos;i="5.70,491,1574118000"; 
   d="scan'208";a="2533323"
Date:   Thu, 27 Feb 2020 10:09:54 +0100
From:   Richard Leitner <richard.leitner@skidata.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Marco Felsch <m.felsch@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: usb251xb: check if hub is already attached
Message-ID: <20200227090954.GC13758@pcleri>
References: <20200227072545.16856-1-m.felsch@pengutronix.de>
 <20200227081448.f7ul3idseybln3sc@pengutronix.de>
 <20200227083007.GB13758@pcleri>
 <20200227084133.spydp5fudfqc6eim@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200227084133.spydp5fudfqc6eim@pengutronix.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 27, 2020 at 09:41:33AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Feb 27, 2020 at 09:30:07AM +0100, Richard Leitner wrote:
> > On Thu, Feb 27, 2020 at 09:14:48AM +0100, Uwe Kleine-König wrote:
> > > If you write this as:
> > > 
> > > 	if (!hub->gpio_reset && usb251xb_hub_attached(hub))
> > > 		return 0;
> > > 
> > > you save some i2c transfers in the presence of a reset gpio.
> > 
> > I'd also go with this solution, so you only have i2c transfers when a
> > reset gpio is configured/present.
> 
> Nitpick: you only have additional i2c transfers if *no* reset gpio is
> configured/present.

Sure... That "no" got lost somewhere between my brain and the keyboard ;-)

regards;rl

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
