Return-Path: <SRS0=CVr8=AR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646B1C433E0
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 16:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E36B206DF
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594053357;
	bh=h78bugupyVwb8i7yI2LoTuUuXl9vGpcz8Ai0NNv5M+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c2BAIKQIWycYSd+couAuKMjMfT7S1zOtZQb+g47BB7ZzQsAzCWsKp/tZ0Zs21TQ4s
	 tyvtqQzMgKbr1ulMVdev7UugCHOdRI5uChLNdtLGNvGESD28LyS3ashsnooqec5dAW
	 vgJY8tTGuDcVe/lJCRx/Ni5wm2DdUhAftfI1A9gc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgGFQf4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 Jul 2020 12:35:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:34300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbgGFQf4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 12:35:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DF21206CD;
        Mon,  6 Jul 2020 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594053356;
        bh=h78bugupyVwb8i7yI2LoTuUuXl9vGpcz8Ai0NNv5M+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TwiiGvHya9RnB3hUgagZiwkEhKDqX1D6uVm9c0+v30RX3cChG5bC8JrsXGasdZ/NN
         o0vtbU1WZE969j2cvvWJ4UN4QgBn74f2J8uB5gV3ncv3xhwNYVKqvxW1popHDedniZ
         RiBgwGra07Eka8KieYLDBB6uD9w+wnrWqmule8mM=
Date:   Mon, 6 Jul 2020 18:35:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>
Subject: Re: [PATCH v3 2/2] usbmon: expose the usbmon structures and
 constants as an UAPI header.
Message-ID: <20200706163555.GB2306919@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706131014.19064-1-flameeyes@flameeyes.com>
 <20200706131014.19064-2-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706131014.19064-2-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 02:10:14PM +0100, Diego Elio Pettenò wrote:
> Previously any application wanting to implement the usbmon binary
> interfaces needed to re-declare the structures and constants, leading to
> structure duplication and confusion over whether these structures fall into
> the system call exception or not.

There is no "confusion", like Pete said, just make the text here say
something like "add proper uapi file for the usbmon structures" and
expand on that.

thanks,

greg k-h
