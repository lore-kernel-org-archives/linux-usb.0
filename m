Return-Path: <SRS0=QQ9a=U4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D96C4321A
	for <linux-usb@archiver.kernel.org>; Sat, 29 Jun 2019 07:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 308B5214DA
	for <linux-usb@archiver.kernel.org>; Sat, 29 Jun 2019 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561793569;
	bh=X2dSxB2Ah+HB5UDxEdDNNV/WTOdlP9hBwBhbEOUWHQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MNQ1oXo0zazcFcWCxwVNvmknaxJBW/j4o7dCXEFCsP0aEiaSWFalDETkjcwHnJKNf
	 1vcoQw5hC2mbBFps0VywUFNz7mNi7xhCxTUx/+RkGzpe2GT5SQPDfGTxl3DdH3vPgS
	 1DC6edFK7czo9AUZU2Y79EoC4ah1a8KZYoKOEdBw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfF2Hcs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 29 Jun 2019 03:32:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfF2Hcs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 29 Jun 2019 03:32:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1F222086D;
        Sat, 29 Jun 2019 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561793567;
        bh=X2dSxB2Ah+HB5UDxEdDNNV/WTOdlP9hBwBhbEOUWHQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QNzyB1/4DPH0G0rNvHI/J3o5fhu4olQI7sgdz8jo3IisiUt1Lf8WUJI832/UOkvOq
         irxnJwyizTtd+q9nTxWAHYvXfkPLRspM8Y3lTyVtXP4mYspHM+t8zO4QAfQNdCfqnW
         u1/hntKHXUixLkMoj+OA+CxoqD4v2W1E7+OKSH18=
Date:   Sat, 29 Jun 2019 09:32:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yuan linyu <cugyly@163.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: message: remove memset in usb_get_descriptor()
Message-ID: <20190629073244.GA27250@kroah.com>
References: <20190629060314.7352-1-cugyly@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190629060314.7352-1-cugyly@163.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 29, 2019 at 02:03:14PM +0800, yuan linyu wrote:
> in the loop, if get a descriptor which is not desired type,
> the buf will be not clean.
> caller check return length to decide success or not.

I'm sorry, but I can not understand these sentances at all.  How does
this relate to remiving a memset() call?  Why do you need to, or want
to, remove it?  What does this fix?

thanks,

greg k-h
