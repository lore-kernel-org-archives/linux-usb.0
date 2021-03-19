Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D35CC433E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Mar 2021 09:32:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3525164F6D
	for <linux-usb@archiver.kernel.org>; Fri, 19 Mar 2021 09:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhCSJcA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Mar 2021 05:32:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229710AbhCSJbm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Mar 2021 05:31:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9160964F68;
        Fri, 19 Mar 2021 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616146299;
        bh=mqtBysgKK7089n2c1Dz44dGC3X3my9QlHvV3Nw6jidI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pFBHjmE41DnHxzi3qpMl/c5eHOS/wWGSf4rcLgmR7PX6dazUypm8dWnZ2+ezn9urx
         hg7KDA6KqtKgTN0+q1lZ65zYo+tSaXzekRGdHKmUfHHtZl0qeChi2jiilSv4rDRA4U
         884CHE0Z630NJVNykWmZvMbIp0L2o7tvUBeZZpMc=
Date:   Fri, 19 Mar 2021 10:31:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Zeng Tao <prime.zeng@hisilicon.com>
Cc:     hminas@synopsys.com, linuxarm@huawei.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: Using tab instead of blank
Message-ID: <YFRveKbKUxbf/I0y@kroah.com>
References: <1616144456-15381-1-git-send-email-prime.zeng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616144456-15381-1-git-send-email-prime.zeng@hisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 19, 2021 at 05:00:55PM +0800, Zeng Tao wrote:
> Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>

I can not take patches without any changelog text, sorry.

greg k-h
