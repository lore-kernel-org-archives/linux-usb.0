Return-Path: <SRS0=QQeN=VA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7175C5B578
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jul 2019 07:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98E3721882
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jul 2019 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562138467;
	bh=YMIYC73Qup6/WDnppW7wMr3kVnkBDJkkJszs7AyzT9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rLEDeHoy+ETNNbVZc/1tkFEFkDBfUt14pm3Ml5p/USG2YSamaOlAapdqv6JSjqlFv
	 hVQ+xT9nr0iLFTKKsg2kaO/KWCPf+0KOXMAzEnOEVoIp1C1l5cLfTlOHmOIs2Rfyya
	 i/xqmo8d02oDo7zDoYt7ZIMuT2ye8UFVIUxPP/8Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfGCHVH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Jul 2019 03:21:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfGCHVH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 03:21:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D860A2187F;
        Wed,  3 Jul 2019 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562138466;
        bh=YMIYC73Qup6/WDnppW7wMr3kVnkBDJkkJszs7AyzT9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=epNJ0TUkVfbRJK2HeG6CP8sEqJTROC3vp4SvtNFGTf84jG+OsTHSpJiAzVWERlmdY
         gLhynW1N9YnmnH+badt+CYIY3QSpXtgP+Gg1KgbwypcuUl/gwNtmW1nz6Z7dmUDv6W
         RlXBdfQ+1NJT5yUEW7CC29ExDAj/zJUiNjKRpMHA=
Date:   Wed, 3 Jul 2019 09:20:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.3-rc1
Message-ID: <20190703072056.GB3033@kroah.com>
References: <20190703063451.GA1508@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703063451.GA1508@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 03, 2019 at 08:34:51AM +0200, Johan Hovold wrote:
> The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:
> 
>   Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.3-rc1

Pulled and pushed out, thanks!

greg k-h
