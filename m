Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFBCC54EE9
	for <linux-usb@archiver.kernel.org>; Thu, 22 Sep 2022 13:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiIVNoA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiIVNn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:43:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB9BB5A67;
        Thu, 22 Sep 2022 06:43:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3945FB8231C;
        Thu, 22 Sep 2022 13:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60406C433D6;
        Thu, 22 Sep 2022 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663854235;
        bh=Gv/u/HsijpsHM5eZqhwNdqJc8A3ZzJU1+qlSoUtlBdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gWOnwBuv9s1QRgeJ48hIUSKu2bbOME4ZPvPFT+YmsTsxc7ozs01+Bw+jx4PQmVa0M
         ApMRK6c3OaYKPhhZLCEk16iJiovwD+HCVbTPhgmvJW9PUGjUiBQdwyPm383U0RW6f/
         rxEEETwIT4fhPI03gtHkIM5n18vreMZsBMScKabU=
Date:   Thu, 22 Sep 2022 15:43:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 6.0-rc7
Message-ID: <YyxmmIUsZyjGktWz@kroah.com>
References: <YyxkgPNrbp7g/+w5@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyxkgPNrbp7g/+w5@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 03:34:56PM +0200, Johan Hovold wrote:
> The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:
> 
>   Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.0-rc7

Pulled and pushed out, thanks.

greg k-h
