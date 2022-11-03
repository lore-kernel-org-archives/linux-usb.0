Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA159C433FE
	for <linux-usb@archiver.kernel.org>; Thu,  3 Nov 2022 13:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiKCNaS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKCNaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 09:30:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F746647C;
        Thu,  3 Nov 2022 06:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA71161EA2;
        Thu,  3 Nov 2022 13:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15357C433C1;
        Thu,  3 Nov 2022 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667482215;
        bh=C/LaGyUi3yEhoXOR10GYwpwSqHqg4OZLBjwOkLbXpck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yOhlDoM6Ada4Dim0KpJhqJybkDt00MvwJY8OmmgB3GfXJbvbk9UNrYENM/j//jS2/
         CZ0crJRZE0/Le0+pcy12qPlQN+8qBut5EjUkmUCD2xKykKD+3OaT1nWLxvXI5LZFWW
         DHrUMi1O+kxDvz05NDdzrzckv9azBBdRZtPfGMs8=
Date:   Thu, 3 Nov 2022 22:30:55 +0900
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jing Leng <jleng@ambarella.com>
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_uvc: add super speed plus transfer
 support
Message-ID: <Y2PCj3c4z73s2Hxe@kroah.com>
References: <20220217031035.6150-1-3090101217@zju.edu.cn>
 <20221103060041.25866-1-jleng@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103060041.25866-1-jleng@ambarella.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 03, 2022 at 02:00:41PM +0800, Jing Leng wrote:
> **********************************************************************
> This email and attachments contain Ambarella Proprietary and/or Confidential Information and is intended solely for the use of the individual(s) to whom it is addressed. Any unauthorized review, use, disclosure, distribute, copy, or print is prohibited. If you are not an intended recipient, please contact the sender by reply email and destroy all copies of the original message. Thank you.

Now deleted, sorry.

greg k-h
