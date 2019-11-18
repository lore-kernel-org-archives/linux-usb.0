Return-Path: <SRS0=69Rx=ZK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6351C432C0
	for <linux-usb@archiver.kernel.org>; Mon, 18 Nov 2019 16:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A0B4206F4
	for <linux-usb@archiver.kernel.org>; Mon, 18 Nov 2019 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574092812;
	bh=inSJoXR4FGHau5GlVJvXkBq54clliW1jLQ/TpRWK+dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1tak3QAFICFbfpCDyOqtFE6o5FsxQAR5+l8dseAm4fHUdgcEw6olvIFGJJfK209iy
	 0OzoSVTs84X3hGgUVNw6Ai950kBIIja8zb/cramSsX6CXGmPXTBu2N4Bfwdd6seK0G
	 BwNFHy9QV4CEm+Np84kj5ZZUsHoIhLPVIbn7LZD8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfKRQAL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Nov 2019 11:00:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:35880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbfKRQAL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 11:00:11 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 327C7206F4;
        Mon, 18 Nov 2019 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574092809;
        bh=inSJoXR4FGHau5GlVJvXkBq54clliW1jLQ/TpRWK+dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xtM/GofXz5wxzbOPeQ01aM7bVLl2CZbZxaOeThC+GX8vcAH4uCKfH2ymV4UvnT0Su
         abYrmMPTUxwPaHJRKorXkSc2psWuyfqELsq5POPGWsEyCyOG/jS8106DKlYstS9KoG
         rtINSh11DWsaol4slM+oPDc7gvR8ZYjS4jQ4DHN4=
Date:   Mon, 18 Nov 2019 16:58:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laura Abbott <labbott@redhat.com>
Cc:     Pacho Ramos <pachoramos@gmail.com>,
        Laura Abbott <labbott@fedoraproject.org>,
        linux-usb@vger.kernel.org
Subject: Re: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
Message-ID: <20191118155859.GA553955@kroah.com>
References: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
 <20191118112837.GE156486@kroah.com>
 <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 10:44:03AM -0500, Laura Abbott wrote:
> On 11/18/19 6:28 AM, Greg KH wrote:
> > On Mon, Nov 18, 2019 at 11:07:55AM +0100, Pacho Ramos wrote:
> > > Hello,
> > > 
> > > I would like to forward the patch that is being used for years in
> > > Fedora and Gentoo to fix connectivity issues of JMicron devices with
> > > UAS when they got into idle state:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1260207
> > > https://bugs.gentoo.org/640082
> > > 
> > > The problem is still valid with current kernels, then, I guess the
> > > patch wasn't forwarded here or got forgotten for some reason. This
> > > patch works fine for current kernel 4.13.11 too
> > 
> > Laura, any reason this patch was never sent upstream to us?  Any
> > objection for the patch below to be merged?
> > 
> 
> Huh this must have completely slipped off my radar. No objections.
> Thanks for the follow up!

Ok, now queued up, thanks.

greg k-h
