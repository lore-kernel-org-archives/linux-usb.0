Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8D8ECAAD1
	for <linux-usb@archiver.kernel.org>; Wed, 31 Aug 2022 09:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbiHaJAZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 31 Aug 2022 05:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiHaJAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 05:00:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC5D44540
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 02:00:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B26D361A2F
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 09:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5662C433C1;
        Wed, 31 Aug 2022 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661936418;
        bh=A0Gzzl+eNxUEZjOmqh5TLiQWLtV3P+3qTEM8hDb9gQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yswq0GcVTGjWq91vcAB7payHwBbR3+5/WLYRK/T9MUftQoNytT8Y4EC71eZVucqlc
         ektOwxFTaD0KAR8Hyxz7DTsKnuy8ZWz6CwEfXIRQ0hi0BBk1SVQq/ps9/PEbPnpWT6
         RF7vE1qW9pHXBZdbF6IKEovevAiQTyEJE+uYqHjQ=
Date:   Wed, 31 Aug 2022 11:00:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zhongling0719 <zhongling0719@126.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: Re: [PATCH] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <Yw8jHrmmtvvJuS3R@kroah.com>
References: <1661930031-21908-1-git-send-email-zhongling0719@126.com>
 <Yw8MNa3vPEtkIQsj@kroah.com>
 <44784fcb.4c24.182f315bb79.Coremail.zhongling0719@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44784fcb.4c24.182f315bb79.Coremail.zhongling0719@126.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Aug 31, 2022 at 04:47:43PM +0800, zhongling0719 wrote:
> Hi all:

<snip>

Please do not send html email as it is rejected by the mailing lists.

Please fix up your email client as the documentation describes, and
resend.

thanks,

greg k-h
