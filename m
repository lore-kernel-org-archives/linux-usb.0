Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C442EB64D7
	for <linux-usb@archiver.kernel.org>; Wed, 21 Jun 2023 16:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjFUQD4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Jun 2023 12:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjFUQDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 12:03:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4940B185
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:03:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA64A615CB
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 16:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5523C433C8;
        Wed, 21 Jun 2023 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687363431;
        bh=nqJ8ZcnJGCMXVwb0z8QXud9UZpr7YlG/cjQn7NX+lP8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iCv/mx/IKmrA/ROiZ2Vpw9zpPn6zBCr/Xg1hAjV5mjNo5yilNB/fJU0kjwa5pN5e6
         2L9HMbQJK1J68WsmgPpxchcGc0dfYx4XzYAOHksQBcc/95ebBE8wjKOQVeY3OfHvKb
         thhto81BpL97tcTTS232rw8VGB5yH81doS8hBUtU=
Date:   Wed, 21 Jun 2023 18:02:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v6.5 merge window
Message-ID: <2023062127-blaming-unboxed-791b@gregkh>
References: <20230621071843.GK45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621071843.GK45886@black.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 10:18:43AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:
> 
>   Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.5-rc1

Pulled and pushed out, thanks.

greg k-h
