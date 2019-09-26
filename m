Return-Path: <SRS0=j0NE=XV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60287C432C2
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 06:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33965222C4
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569479594;
	bh=dZfCjey4cfJVzbd2yxSRo7AEl+em2u2ShtmAg8m3d/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iYMusEl19sWE7sMlsZeiwVPtIftOcdKf7uKb9+PAH8YtqgcJz1aNUNamPQO2jcbq0
	 AX9Xr8EggC7riMl83C6FL4vxo68UtV/IjwnHDDUm+MigPuVF78N//2yIB5x/PL3K4G
	 ERNt7UcKpxQxn9bBA+H3HrqrS7trj3+2TUZaJAFg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392526AbfIZGdN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Sep 2019 02:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:58022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390250AbfIZGdN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 02:33:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 241A5206E0;
        Thu, 26 Sep 2019 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569479592;
        bh=dZfCjey4cfJVzbd2yxSRo7AEl+em2u2ShtmAg8m3d/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pygmq9KKeEYeo0rK2/U/mpe1Vy7Rg0BblLepdS+0yJK0S7R/NCstwbG8Hi9n4AXvQ
         /0dydo+B/b6wJc7guR5/2mzBiaaeeC5M9DluN2jmfSoWG/nWZxWqYeJzTyKcO5zcAR
         DoJXtWL0jxdxiTzqnN7+5jiWX5mBfxubW6ZuZOYk=
Date:   Thu, 26 Sep 2019 08:33:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        dan.carpenter@oracle.com
Subject: Re: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Message-ID: <20190926063310.GA1579276@kroah.com>
References: <1569478767-19889-1-git-send-email-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569478767-19889-1-git-send-email-pawell@cadence.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 26, 2019 at 07:19:27AM +0100, Pawel Laszczak wrote:
> Patch fix issue in cdns3_ep0_feature_handle_device function.
> 
> The function usleep_range can't be used there because this function is
> called with locks held and IRQs disabled in
> cdns3_device_thread_irq_handler().
> 
> To resolve this issue patch replaces usleep_range with mdelay.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

What commit does this fix?  Did someone report it?  If so, please
properly credit them here.

thanks,

greg k-h
