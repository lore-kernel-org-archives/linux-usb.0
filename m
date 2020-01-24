Return-Path: <SRS0=idDB=3N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E82FC2D0CE
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DA642071E
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579854157;
	bh=KKF1DeAAvbKBpmu1Bic7oGfkaS0ZTzK0E4hhzr6kjjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uFaD2tEThrmjKwMsJ3hjrnU0NtTIkNAG3hQtvgkjZu8fjqsg38NyjiABqaWyzxxbp
	 1cmqH05fR/jU9CTyJZ5dgk493GpTD1IJuSF18Ss0yz1Lb4AF9RG1HoWyZp3xR9RtI1
	 YEoeTODBGAM2Xbsc0cnSziRjB2923M76jhwcOZNA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgAXIWg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Jan 2020 03:22:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgAXIWg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jan 2020 03:22:36 -0500
Received: from localhost (unknown [145.15.244.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56CCF2071A;
        Fri, 24 Jan 2020 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579854156;
        bh=KKF1DeAAvbKBpmu1Bic7oGfkaS0ZTzK0E4hhzr6kjjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VHfDrNh3ixPMsCss1mJhWUp61+kVF9qWI81janaeWylYEO71x2On+nfr/aJ5dfzPJ
         dq/cYp6XlKM8ztoT8bTGhhdlT6IMrS0VMLc6Jzc0rTXN2gUGaKSjoi/PdApsx2fGT9
         PULLXufOjX+JQjH559to9L10ovMx2PpALEyjzFsg=
Date:   Fri, 24 Jan 2020 09:22:32 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>,
        linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] usb: misc: usb3503: Use gpio descriptor interface
Message-ID: <20200124082232.GA2921425@kroah.com>
References: <CGME20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28@eucas1p2.samsung.com>
 <20200123144231.284762-1-pavel@loebl.cz>
 <4c850344-192a-00c5-9789-fd666d1587b1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c850344-192a-00c5-9789-fd666d1587b1@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 24, 2020 at 07:33:36AM +0100, Marek Szyprowski wrote:
> Hi Pavel,
> 
> On 23.01.2020 15:42, Pavel Löbl wrote:
> > Move gpio related code to descriptor-based interface. This makes
> > driver to respect active physical level as specified in DT. Existing
> > DT nodes are adjusted to reflect the former behaviour.
> >
> > Signed-off-by: Pavel Löbl <pavel@loebl.cz>
> 
> This is a duplicate of https://patchwork.kernel.org/cover/11285261/ 
> which has been already applied to current linux-next.

With the exception fof the dts changes :(

