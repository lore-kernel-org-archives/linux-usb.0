Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE5EC43334
	for <linux-usb@archiver.kernel.org>; Tue, 28 Jun 2022 14:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347323AbiF1ODQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347267AbiF1ODP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 10:03:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792801D0DC
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 07:03:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38159B81C9F
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 14:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D15C341CC;
        Tue, 28 Jun 2022 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656424991;
        bh=yowxv6DcY9RAb5NYJqTI9qf0sQO1qOWm/e9EFTBDL0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zvd3gWVLYv25h+gfEiWKSjq4akNPvyGVbUok9EPDEFzdc27YsVtKLLco8xDL2GwGS
         2aB8N3ADawTqR5GORwMU9LI5z/7QbVUy869qEoKNtw9XIR82tK+sQxW2IyvJbKXCiJ
         iCJRqK+40tt/q5k+VWVUSoSdQIMdUbTy9CftqZEE=
Date:   Tue, 28 Jun 2022 16:02:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.20 merge window
Message-ID: <YrsKB31lkuE5RnoX@kroah.com>
References: <YrrVjj+xZyaqjFFi@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrrVjj+xZyaqjFFi@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 28, 2022 at 01:18:54PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> Please find Thunderbolt/USB4 changes for the next merge window below.
> I'm sending this one early because I will be on vacation pretty much the
> whole July. I hope this is fine for you. 
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.20-rc1

pulled and pushed out,t hanks.

greg k-h
