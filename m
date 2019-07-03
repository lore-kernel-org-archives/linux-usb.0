Return-Path: <SRS0=QQeN=VA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B578C0650E
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jul 2019 11:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 355BF218A3
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jul 2019 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562154716;
	bh=gT1W9FpYgLIZiPMnzHLuDY0pcsCFD31S2SJrvmc+3fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OuMod9E27diQsZXSYJh6wgloycjZGGIaD+eerx+8eHpw/QReeIuEI/dZ+HrqOQ6UV
	 NNPzWHIVfhng+O/gWlyoso56b5S6w40MT8Q77dWC6j2CSgfWk+56TwYCgIU1+fiaJo
	 USwg6Qf3M/a7qTylAN8v/7MyQc+gtC3O+6ZY3EOU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfGCLvy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Jul 2019 07:51:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfGCLvx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 07:51:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4C8E218A4;
        Wed,  3 Jul 2019 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562154713;
        bh=gT1W9FpYgLIZiPMnzHLuDY0pcsCFD31S2SJrvmc+3fg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yUkIOP/fUAgWAYZCeVfyKadic59+wjtxBVN5ZomudJT3b8FaxuAHXwYrb8J794k46
         76CzH/NYTLE4LHCEk5ibb3UDwyjog4AXfkE9hj9p0dFTBzz/3Fe7FXXAIt8ZPlrLBT
         xMzgzF3uknJZ4/6SnrSWv4HUlwc/T7Bfwmatk50Y=
Date:   Wed, 3 Jul 2019 13:51:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL part2] USB: changes for v5.3 merge window
Message-ID: <20190703115122.GA2064@kroah.com>
References: <87a7dv4a6n.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7dv4a6n.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 03, 2019 at 02:41:36PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Hopefully there's still time to merge these other patches.
> 
> They came a little late but should be safe to merge. I've tested what I
> could with platforms I had.
> 
> The biggest thing here is the new Cadence USB DRD controller driver and
> an important fix on dwc2.
> 
> cheers
> 
> The following changes since commit aa23ce847ddac1fd5ffe987ff12e12ff48318e45:
> 
>   usb: dwc3: remove unused @lock member of dwc3_ep struct (2019-06-20 11:50:19 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.3-part2

Pulled and pushed out, thanks.

greg k-h
