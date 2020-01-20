Return-Path: <SRS0=3b5b=3J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338D6C33CA1
	for <linux-usb@archiver.kernel.org>; Mon, 20 Jan 2020 09:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06D9E20882
	for <linux-usb@archiver.kernel.org>; Mon, 20 Jan 2020 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579512581;
	bh=X7Znlgcot6reTv9zZCpQDNBB7rGSbipmza2STDBU18c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FFwbBcMasniYXl31drblhTnXtp7zOvi0mfH5neI3rTkYylsea4Oy7p/e+U2bOe6eY
	 DN9GQG/TFbechkk57TO8PUGu0MotJW4qygtk8/Ll2v+DVu27LZtjFPsZK6RO2hJNXI
	 Juq9eiCvji4LfEpSYbr0aC4/Y6e0Bcn6MpE4nKl0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgATJ3k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 20 Jan 2020 04:29:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgATJ3k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:29:40 -0500
Received: from localhost (unknown [89.205.136.67])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8ABE207FF;
        Mon, 20 Jan 2020 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579512578;
        bh=X7Znlgcot6reTv9zZCpQDNBB7rGSbipmza2STDBU18c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y0x+bJojzICm/olETUUkND3oB5sXAWoNbHOKHpOOpCuSsJJ6I98yWKtf3yWh+Uzp7
         jebDGfHYpQVo8wNEgYmBs5kwHUTtOUVqRybeIPKIw/wRCC0yvbQNpXDBF4CTk5gxg3
         FZuNwiJSv0MUFCP6MWC6BI08eYhk7GKkdtGip5S0=
Date:   Mon, 20 Jan 2020 10:29:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: No message is showed after USB gadget has configured
Message-ID: <20200120092934.GA382520@kroah.com>
References: <20200120090357.GB19938@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120090357.GB19938@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 09:03:59AM +0000, Peter Chen wrote:
> Hi all,
> 
> >From commit 1cbfb8c4f62d ("usb: gadget: Quieten gadget config message"),
> there is no any message from gadget side after it connects to host
> and works correctly. Although we could cat "state" under
> /sys/class/udc/$CONTROLLER/ to know its state, we can't easily
> know if the gadget works or not from console, USB host could have
> many messages after one device has connected, why we can't keep one
> for USB gadget?

Why not make "normal" USB devices quieter too? :)

Surely you do not have tools that watch syslog to determine if a device
is working properly or not, right?  That's what sysfs is for, not syslog
entries.

thanks,

greg k-h
