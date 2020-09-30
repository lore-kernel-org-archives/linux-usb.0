Return-Path: <SRS0=1fts=DH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B335C2D0A8
	for <linux-usb@archiver.kernel.org>; Wed, 30 Sep 2020 07:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3A0D207C3
	for <linux-usb@archiver.kernel.org>; Wed, 30 Sep 2020 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601451837;
	bh=yYlqSEMGlaaydcsTK24rgtJx1h8erbhvHt1MASbuZIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=03O+f2QHgoNqJ9PaUqKN5HJt4lWUvkr71O6Nnsy7c6cYbDdAeEdtpkuD2HeHOpVCO
	 UA3GbY/4jT8Gj4RhsmXVadICbzVHn47aO6SKY3vY/YqmRFINkmvbpRVYWdemBwod1M
	 l2JOnqIMYeXzOEAvAOUfAUBZVCghgkrSkVg6yVMQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3Hn5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgI3Hn4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Sep 2020 03:43:56 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEAE42075F;
        Wed, 30 Sep 2020 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601451836;
        bh=yYlqSEMGlaaydcsTK24rgtJx1h8erbhvHt1MASbuZIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DqQ7WOb6iMw28V/+lbAvqFxHAz4ieQiSCq2SIogrJj7fhpvAbgwMFzEF6inxWl10H
         /e3qbEKpPEQLk3nWASjt0TZJPEqcbrV+0DNBB9oO8hCw5VbHR0yvlZ/yauX1pYkNPB
         6SnDvGjXWs8SYVdQ7P8v3wguZgejvTkqSwWZKmkc=
Date:   Wed, 30 Sep 2020 09:43:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.10 merge window
Message-ID: <20200930074318.GA1512484@kroah.com>
References: <20200930063632.GR2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930063632.GR2495@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 30, 2020 at 09:36:32AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:
> 
>   Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc1

Pulled and pushed out, thanks.

greg k-h
