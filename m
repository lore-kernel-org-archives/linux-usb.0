Return-Path: <SRS0=acVg=U6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698EFC0650E
	for <linux-usb@archiver.kernel.org>; Mon,  1 Jul 2019 10:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A80621707
	for <linux-usb@archiver.kernel.org>; Mon,  1 Jul 2019 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561975938;
	bh=8ueB3TD97v1Kpj2tb+rfU/syCKNrYndGOjPufVWQSaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XP9UXeUic1DAefh3kIvYZSN55BDaC6fuVrVo0u2SP18Q83RDpfhntqQYdJWSaPBjB
	 b1dnVs9JEqcdSKKonFLCbIo8TGSh4ks8SSy5DixPjgqNeGbj6IQyFPv9TRufC5LPGi
	 4ragxXqQZdQsKWLmq0Fa0NPEjJhLv8olD/Ss+d/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfGAKMR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 1 Jul 2019 06:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbfGAKMR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 06:12:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E744A2133D;
        Mon,  1 Jul 2019 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561975936;
        bh=8ueB3TD97v1Kpj2tb+rfU/syCKNrYndGOjPufVWQSaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wzlf2uNJ1haXsPLx546Yc11c5JWQC0TuDdcmRDvJWZotWUpVrrmUlZ7PL45JkjmWl
         Nph3dzKalL+EphjCqYFqFEINh5chp7IxlUKkS+M6/KFiv+UUsU4Mp7qFoLKwnrZlqA
         D5A8FFK25ggJqS1olQqmA4W5ryRxM0mtLgW0uKP8=
Date:   Mon, 1 Jul 2019 12:11:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.3 merge window
Message-ID: <20190701101114.GB23548@kroah.com>
References: <87y31nea2k.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y31nea2k.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 27, 2019 at 10:55:47AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my pull request for v5.3 merge window. Relevant patches have been
> tested on platforms I have available.
> 
> Let me know if you want anything to be changed
> 
> cheers
> 
> The following changes since commit a954e5fb4bc2d401b8fc3b4c7cd316497ff80225:
> 
>   Merge 5.2-rc5 into usb-next (2019-06-17 11:23:24 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.3

Pulled and pushed out, thanks.

greg k-h
