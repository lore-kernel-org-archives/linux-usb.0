Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45877C54EE9
	for <linux-usb@archiver.kernel.org>; Tue, 13 Sep 2022 12:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiIMMsu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Sep 2022 08:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiIMMst (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 08:48:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C25150734;
        Tue, 13 Sep 2022 05:48:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 385E86144A;
        Tue, 13 Sep 2022 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E295C433C1;
        Tue, 13 Sep 2022 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663073327;
        bh=I6oTbatHobNlYjYHGyHKwqANjbSQjrxFlVZfO84Q1lo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boJkZRu26fOHzXLLainwggBwKA3boKCYYOovR/2wxdln4d79gQfnBP79ZHDw+JPHB
         nhBTYUzrdi12Fxw0dtfgfIAuZGjOLUhr1McBB2m1wcoCzjHy2D+JZCSVF488luYsEz
         ma7ujIbRhLoph26nSzLgsfydsLaHX+AiAXKOfSOF+p6A4jDNlWZ7UlnDiVpXziZHme
         l9u81x6fiXMiJG+MmDFujR+JqslgR+fmWIg8cd/DZxCzi6AF69DtCUgVE3jHBoF3tK
         lT80yf8q6wwINEZd9Kn5VEJenAcsu6h976w3cORsfJ4j3Rf/Zb4dCU2PfA8Mv2HMq3
         iMb/7GZa3bEoQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY5LL-0003as-0y; Tue, 13 Sep 2022 14:48:47 +0200
Date:   Tue, 13 Sep 2022 14:48:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3] USB: serial: ftdi_sio: Convert to use dev_groups
Message-ID: <YyB8L5+R2s7Np/DP@hovoldconsulting.com>
References: <20220905100101.343861-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905100101.343861-1-jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 05, 2022 at 06:01:01PM +0800, Jiasheng Jiang wrote:
> On Fri, Sep 02, 2022 at 10:52:52PM +0800, Greg KH wrote:

> >>> And again, have you tested this change?
> >> 
> >> Every time I change the code, I recomplie it and check whether there are
> >> errors.
> >> Are there any other tests I need to do?
> > 
> > Yes, boot with the device and make sure that the sysfs files are still
> > there.  You do have access to one of these devices, right?  They are
> > very very common.
> 
> Sorry, I still have no idea how to boot with the device.

You need to buy an FTDI device and plug it into a machine with your
patch applied to the running and make sure that you did not break
anything.

> But if there is any wrong with the patch, you can tell me and I will continue
> to revise it.

It is your job to test your patches.

Johan
