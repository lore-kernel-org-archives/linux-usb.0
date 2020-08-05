Return-Path: <SRS0=x5hE=BP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB16C433E0
	for <linux-usb@archiver.kernel.org>; Wed,  5 Aug 2020 20:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EA4622B42
	for <linux-usb@archiver.kernel.org>; Wed,  5 Aug 2020 20:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cEZUlFvD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgHEUP6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Aug 2020 16:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgHEQUG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 12:20:06 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BE5C001FCB
        for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2020 08:49:37 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id j9so34367159ilc.11
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2020 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAePZiXm6lZPAjA6iTXawTSBS+sAH5U4gKjxjlBvI0Y=;
        b=cEZUlFvDLAnpENC/yKTWFB1oZSsWgaFcdEK3kO1XWKEBFLTEOIndPMsfpvJYNJvNeG
         lkm9ZjcuKgHISltwWrUminf2SdoZ1/nOSTuA9nUedqthXNBZKufJsuDrBMnRCtRZSbdu
         hZYXu71PtTywu/2KeBDpycp66T60q8ILHjAUifO1oTfaR5hT8Cyt5pDQIN+fK+v98b62
         Ol3Byx7byyjTBH9DfQXEazKsO/teovdrl40E9QN2E0VTe9K2X/UF0C4JshZ9cBBKihLl
         pLEUYCQ3v//7ryr1n/B9eCCcIhq9EN3yea/bWA5hY0ngP0dPFdaLsonPcKf3euYDH7gp
         d1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAePZiXm6lZPAjA6iTXawTSBS+sAH5U4gKjxjlBvI0Y=;
        b=i9n+QLJloO63IiWWuXZs9ZFI/8JR1btoy1ycHrSNAA5EGBxkwCM2mUTX/EwhrQf6Hg
         5vAUHAAm/bTeTeamNtkKvpvYGmo26pbJGA0r+MNn737iE4pJPGQ3w3F/Do+TntTswwmW
         wGjwXnKDuOb5wGSqDnzbuEJsb+IopvB2/GNybSmYIS7oCncwx8lPCD8myCnquuGXelpc
         POPz143RqMV90VPiUn1iJ1y7J217KUokOKmL2G1FUZUsktyJRTLA/+nxdwvbFEDKRkNT
         ss9bLVjHjeSd+mmm0CN41HAin44rZxgO+wqOoHplD8FDLtooxt0Cgc4olONFrHL1gP7C
         NCxg==
X-Gm-Message-State: AOAM5338y9+fHRyeNqB3FiHX8HpSE1Ko1i+peTIta9FaXNxKLNxkPh00
        ex4zvkE1qBXnTNm4vU9zuwS6VE3IGoca7LJuyvy7uw==
X-Google-Smtp-Source: ABdhPJw4+QNSbWVVgzqtpHXqkxWJ0R16Kf4NhYIRqnjztUp9gdjrTBTVrV7+NngM10Ct80llKGRZbRgfa4AOC5nKypI=
X-Received: by 2002:a92:d8cf:: with SMTP id l15mr4977954ilo.0.1596642575465;
 Wed, 05 Aug 2020 08:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200805075810.604063-1-lorenzo@google.com> <87mu39tmu6.fsf@kernel.org>
In-Reply-To: <87mu39tmu6.fsf@kernel.org>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Thu, 6 Aug 2020 00:49:23 +0900
Message-ID: <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 5, 2020 at 7:21 PM Felipe Balbi <balbi@kernel.org> wrote:
> But anyway, if we change 13 to 16, then we 1Gbps. How did you get
> 1.7Gbps? I think we should really update ncm_bitrate() to contain the
> correct equations for bitrate on different speeds.

I got 1.7 Gbps because that's what I measured in iperf. :-)

But actually after reading the spec I think that for SuperSpeed and
above that calculation is meaningless, because bulk transfers are no
longer limited by a set number of packets per microframe. The USB 3.2
spec has mostly replaced the words "microframe" with "bus interval",
but I don't see any place in the spec that says the number of packets
per bus interval is limited. Section 8.12.1.2 (Bulk IN Transactions)
just says that "when the host is ready to receive bulk data, it sends
an ACK TP" saying how many packets it's willing to accept, where the
maximum is the burst size supported by the endpoint. After that, the
host has to respond with an ACK to every data packet received, and
every ACK specifies the number of data packets it expects from then
on.

It seems more correct that for SS and above the driver should simply
just report the link speed minus theoretical bus overhead? Section
4.4.11 suggests that's about 10%, so it would announce 4.5 Gbps.

> > +static struct usb_ss_ep_comp_descriptor ssp_ncm_bulk_comp_desc = {
> > +     .bLength =              sizeof(ssp_ncm_bulk_comp_desc),
> > +     .bDescriptorType =      USB_DT_SS_ENDPOINT_COMP,
> > +
> > +     /* the following 2 values can be tweaked if necessary */
> > +     /* .bMaxBurst =         0, */
>
> should you add bMaxBurst = 15 here?

I'm not sure. On my setup, it provides a fair performance boost (goes
from ~1.7Gbps to ~2.3Gbps in, and ~620Mbps to ~720Mbps out). But I
don't know whether there might be any compatibility constraints or
hardware dependencies. I do see that the f_mass_storage driver sets it
to 15:

         /* Calculate bMaxBurst, we know packet size is 1024 */
        max_burst = min_t(unsigned, FSG_BUFLEN / 1024, 15);

so perhaps this is fine to do in NCM too? If we want to set bMaxBurst
to 15, should that be in this patch, or in a separate patch?

Cheers,
Lorenzo
