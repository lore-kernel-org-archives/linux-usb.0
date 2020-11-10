Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67572C388F7
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 08:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11CF621534
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 08:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1z6kYv6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgKJIRR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Nov 2020 03:17:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:53870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgKJIRQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 03:17:16 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3956620897;
        Tue, 10 Nov 2020 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604996235;
        bh=R2hVryx8zQhBTl9aIGlCJMVaKkC/e7qSDDnYbSq5uwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1z6kYv6EK+5S8/b4puehOC10DXP0lERkYOtL8J7PW2OXpgEnWCBw0Ate+pDTP9Lk
         C4GCZKmmspJtasaqo0aY3mPuL2/RHj0FBOGyBlV0hy3RDu3Asd9uEbUMHl1njTqApV
         1EuJNqTtwmRwduVW05sIxvb4psMcPkPt1hltwlAA=
Date:   Tue, 10 Nov 2020 09:18:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v5.10-rc4
Message-ID: <X6pMvbnIwOqHkOF9@kroah.com>
References: <20201110075821.GP2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110075821.GP2495@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 10, 2020 at 09:58:21AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc4

Pulled and pushed out, thanks.

greg k-h
