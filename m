Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C52C433B4
	for <linux-usb@archiver.kernel.org>; Tue, 20 Apr 2021 07:46:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A1FB613AF
	for <linux-usb@archiver.kernel.org>; Tue, 20 Apr 2021 07:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhDTHqm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Apr 2021 03:46:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhDTHql (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Apr 2021 03:46:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12AB8613AB;
        Tue, 20 Apr 2021 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618904770;
        bh=O4XCOj84rCYc3BbzkoCylLe567dg3DqeHzJJdPr6bz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=alNUiiq9bHh+oY8xhwzbo0hZhrcO7a+Ulp2x3x9nKzacJ67mUd7Hbd/5t6BubJpkl
         TvSUshcs31qhmVUwNuyrE5dgGMzc+hZ6nFJT+sKJmLqJUzOWcgfk9Dbn6Z9Wtuzo1H
         W+awanfu3gBHOY7xgjjMT+r9igujT83maAK9ee10=
Date:   Tue, 20 Apr 2021 09:46:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Frank Zago <frank@zago.net>
Cc:     linux-kernel@vger.kernel.org,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YH6Gv9QG5VusXlgy@kroah.com>
References: <20210420022520.47965-1-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420022520.47965-1-frank@zago.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 19, 2021 at 09:25:19PM -0500, Frank Zago wrote:
> From: frank zago <frank@zago.net>
> 
> The 0x5512 USB PID is for the I2C/GPIO/SPI interfaces. UART is still
> present but only the TX and RX pins are available; DTS, DTR, ... are
> used for other things. Remove the PID, and let a I2C driver bind to
> it.
> 
> Existing CH341 boards usually have physical jumpers to switch between
> the 3 modes.
> 
> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.
> 
> Signed-off-by: Frank Zago <frank@zago.net>
> Signed-off-by: frank zago <frank@zago.net>

Why are you signing off twice?

