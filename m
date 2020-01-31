Return-Path: <SRS0=NQ6k=3U=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E7EC33CB2
	for <linux-usb@archiver.kernel.org>; Fri, 31 Jan 2020 11:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4D10206F0
	for <linux-usb@archiver.kernel.org>; Fri, 31 Jan 2020 11:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=metanate.com header.i=@metanate.com header.b="504AD6Kw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgAaL1h (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 31 Jan 2020 06:27:37 -0500
Received: from dougal.metanate.com ([90.155.101.14]:30017 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbgAaL1h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 06:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
        :In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0ZbdQaJ9+vRnPRTSp6MQqjJ2wSj8lzNrl69V4sH+uow=; b=504AD6KwVFduPIhT3pA89d4Uoo
        9qDdedQWsmguogHNQG+6jmCF51Rrz1S1FYuJTcjM1rka+SgLL1EjcsLxvfAxawnSKqS07TICeIcFi
        A7rUhtHaKOejHeSMadmRvIMMaiUa6QEXjTpcp6CNtRONwlXQTDBMdUXmXMkQVXrVGV7EpNA0xDp8f
        8pT0x66jf37snWSf5WoQoFrTczhmZPrBruz53WnRXpArwHWq2MK4I2tb3iwulsp9e7aVuomzkJ289
        P74R6cLWbBVQvwpbqLQphL2aXBJ0mXTg/HrQVvAAYuoZDu+4IEZCR08FiVWRLNAq+do1LlL55wIrr
        OVUhhUkg==;
Received: from dougal.metanate.com ([192.168.88.1] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1ixUSU-0007UK-A9; Fri, 31 Jan 2020 11:27:34 +0000
Date:   Fri, 31 Jan 2020 11:27:33 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
Message-ID: <20200131112733.758ab77c.john@metanate.com>
In-Reply-To: <4588dcf7-7e2a-8bdd-48e5-e835f3503f5a@ivitera.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
        <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
        <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
        <20200114200450.064cd521.john@metanate.com>
        <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
        <20200117104022.5bb769f2.john@metanate.com>
        <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
        <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com>
        <4588dcf7-7e2a-8bdd-48e5-e835f3503f5a@ivitera.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 31 Jan 2020 11:30:11 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 24. 01. 20 v 13:16 Pavel Hofman napsal(a):
> >=20
> > Dne 19. 01. 20 v 15:53 Pavel Hofman napsal(a): =20
> >>
> >> Dne 17. 01. 20 v 11:40 John Keeping napsal(a): =20
> >>> On Thu, 16 Jan 2020 16:39:50 +0100
> >>> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> >>> =20
> >>>>> I've taken a look at this and the patch below fixes it in my simple
> >>>>> testing.=C2=A0 But note that this doesn't adjust the PCM's min_peri=
od_bytes
> >>>>> which will be necessary if you want to minimize latency with an=20
> >>>>> adjusted
> >>>>> high-speed bInterval setting. =20
> >>>>
> >>>> Please can I ask you to submit your patch? IMO your perhaps slightly
> >>>> suboptimal solution is much better than the current broken version. =
=20
> >>>
> >>> Yes, the patch is definitely an improvement.=C2=A0 I thought it would=
 be
> >>> picked up from the earlier mail, but I think Patchwork requires the
> >>> subject to match, so I'm including it again here.
> >>>
> >>> Are you able to provide a Tested-by for this change? =20
> >>
> >>
> >> Testing looks OK, thanks a lot!
> >>
> >> Tested-by: Pavel Hofman=C2=A0 <pavel.hofman@ivitera.com>
> >> =20
> >  =20
>=20
> I apologize for a basic question - please which official repository to=20
> check status of a gadget patch after being accepted? Thanks a lot for=20
> the information.

If you have a kernel tree, you can ask the MAINTAINERS file:

	./scripts/get_maintainer.pl --scm -f drivers/usb/gadget/function/u_audio.c

I'd expect this to appear in Felipe's tree first at:

	https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git

but I don't see it yet.  I guess it won't be picked up until after the
merge window.


Regards,
John
