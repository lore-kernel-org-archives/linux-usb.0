Return-Path: <SRS0=Z06V=CY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EEDC43461
	for <linux-usb@archiver.kernel.org>; Tue, 15 Sep 2020 11:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 203E220732
	for <linux-usb@archiver.kernel.org>; Tue, 15 Sep 2020 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600170868;
	bh=C7F5Qsblh5Pbalfm4odZ8gCC9y3bKERRT3Y3BhbDd2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FUlnEXP9DIjlspVAK2t1jTh8WQ5E5xYJNkSK9E8SpJxZWxdVGlyJYqldVSRnNriJt
	 Mz/Hj/zewKtHcaHsuVJ/Zu3v7RAWeR6wxR+V0Ysk0bzSL+7oU+x6gio0WQ5Rx0MJNp
	 rcvS+IGAv79cV9mwJqSdDKJJuse3UV6m25NCOKVA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgIOLyQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Sep 2020 07:54:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726378AbgIOLwq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 07:52:46 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABF3A20732;
        Tue, 15 Sep 2020 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600170766;
        bh=C7F5Qsblh5Pbalfm4odZ8gCC9y3bKERRT3Y3BhbDd2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lKzrNzTJ6doHfvPWNghFejfm7Pr5zgV3VhOLHNNekUauesiOSwnXJfCwp+7qQERiN
         9PsLVdQUyfKdO33n+jruAbFg7x7RTZDzSc+dAoOvFsuSKNgMRPSit65lFZsayTWKwl
         kw8W8PZ0hy35c7XYAB8dqTCuc8kdWOOplkF+mIzY=
Date:   Tue, 15 Sep 2020 13:52:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.9-rc6
Message-ID: <20200915115243.GA299293@kroah.com>
References: <20200915094007.GV2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915094007.GV2495@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 12:40:07PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 813050e0a9b871ac575abfd3d321f74916df609d:
> 
>   thunderbolt: Use maximum USB3 link rate when reclaiming if link is not up (2020-08-25 11:29:01 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9-rc6

Pulled and pushed out, thanks.

greg k-h
