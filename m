Return-Path: <SRS0=RCoP=6X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EE8C28CBC
	for <linux-usb@archiver.kernel.org>; Sat,  9 May 2020 17:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AE29208DB
	for <linux-usb@archiver.kernel.org>; Sat,  9 May 2020 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589044168;
	bh=mxEHl5m2Y32oHjr/OcTR9Wcn7GM/m0epIVOrjMBgyRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xz1Iy1RhTZ1AfquwK0Mg+Sseavo5nFT4DTvRIYzm4Qikc98K3JnmSQBW1xOk9qM3i
	 z+FqA2rFxBFvj5GFvra32142mcNBLrTd3+mFi/ycD8JRFMw4PTtN1Co5N+m8lGl7L7
	 O3ha8Gra/NOb8IZoQqED1EQhZ0GU8jY381yVkG2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgEIRJ2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 9 May 2020 13:09:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:43046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgEIRJ1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 May 2020 13:09:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07C7D208DB;
        Sat,  9 May 2020 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589044166;
        bh=mxEHl5m2Y32oHjr/OcTR9Wcn7GM/m0epIVOrjMBgyRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ia5VQ6mbuUVOKu6QkFegg0OGJ2lyvJmzXwrIWdDZpGBnXqKp/nibSbPf0xeAzCERL
         xCfKAoiCXjIc9HAqZgiUy64nBsaOqBdQl/cLupTu52dwPQ9AM1A6Ib+8uGkLcjVFOd
         vmIpleC/TN2LpEH/tVNrhaxUFLg3U2YdiFaW3lEQ=
Date:   Sat, 9 May 2020 19:09:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.7-rc
Message-ID: <20200509170924.GE2482887@kroah.com>
References: <87v9l5le8v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9l5le8v.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 09, 2020 at 11:11:12AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's another pull request for the current -rc cycle. We may have
> another pull request to add a few more fixes to the raw-gadget, but it
> depends on your reply to my query on that thread ;-)

I think we can take more raw-gadget fixes so late, that's fine.

I'll pull this one on Monday.

thanks,

greg k-h
