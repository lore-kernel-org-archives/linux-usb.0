Return-Path: <SRS0=DJv7=B3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C58C433E1
	for <linux-usb@archiver.kernel.org>; Mon, 17 Aug 2020 17:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7E782063A
	for <linux-usb@archiver.kernel.org>; Mon, 17 Aug 2020 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597685647;
	bh=kgsFqZfBvZlLsWEG0Me+Y/JEZOgVaIpwWsg1FcUXXvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OnS5851SQPZgvfLSxl7OrpRooN4y64i+y5QUnxc5WTalKFJOdz5ue4cp27+9/44eQ
	 q4iGgqZSBQnMAGVnr8xY9j5M1QFyOKbE7ffeEGokWIMPQaccLNyDgH0yE9Nfo5shb5
	 coYPfTNNrmNOrCQ5XRdafiphj5CMNpg0QnNN69CQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbgHQReF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 17 Aug 2020 13:34:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389009AbgHQQuB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 12:50:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE85920674;
        Mon, 17 Aug 2020 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597683001;
        bh=kgsFqZfBvZlLsWEG0Me+Y/JEZOgVaIpwWsg1FcUXXvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z5LRnL4HPDoWJogJPTOAKCLUHBRNGcn+L2eJU/2yPrjjzlQAnDPYhXbfbDPxfrTa5
         VpjzK202uV1JpCKuTwJv41VrHziFf0+Cc5pvgsshiLbztZFK9FVWzkFstnt+0nYKWL
         kMS+VVLMSWmbTMyY292FmKZ481HvbqDLfqO/NuMo=
Date:   Mon, 17 Aug 2020 18:50:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v1 3/3] usb: early: xhci-dbc: Sort headers alphabetically
Message-ID: <20200817165020.GB721399@kroah.com>
References: <20200817164226.49119-1-andriy.shevchenko@linux.intel.com>
 <20200817164226.49119-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817164226.49119-3-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 07:42:26PM +0300, Andy Shevchenko wrote:
> For better maintenance sort headers alphabetically.

Maintenance of what?  That's pointless churn.

> While at it, move asm/*.h to be included after linux/*.h.

That's the only valid type of change, but why is a driver having asm/*.h
files included in the first place?  Shouldn't that be fixed?

thanks,

greg k-h
