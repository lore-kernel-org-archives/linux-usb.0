Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C528C433ED
	for <linux-usb@archiver.kernel.org>; Thu, 22 Apr 2021 08:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2606961458
	for <linux-usb@archiver.kernel.org>; Thu, 22 Apr 2021 08:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbhDVItt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Apr 2021 04:49:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:34708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235637AbhDVIts (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 04:49:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE444613ED;
        Thu, 22 Apr 2021 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619081353;
        bh=/LEk7vDGRMBFQuG1ktTPTWOZ+UhItZujTScjVhJoAzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVXhbX4L8aaIeJscLyBH7GL2fiWNLQlXdU3daA5puPJC3YfMDINeekOuuxx70N5mv
         HtgxKeXQcb4zcYi529Q0s8lie1pVj26VgEbBP0uYrQ607VWcQ9bF1MQEyQaUhfDAuN
         9umFx7A+0xd1Ab5ug6qIgme5AF1OVLLKH2x8or1c=
Date:   Thu, 22 Apr 2021 10:49:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saurav Girepunje <saurav.girepunje@gmail.com>
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] usb: musb: davinci: change the variable type
Message-ID: <YIE4hh5NOJMT7QqK@kroah.com>
References: <20210418183618.GA69452@user>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418183618.GA69452@user>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 19, 2021 at 12:06:18AM +0530, Saurav Girepunje wrote:
> vbus_state is define as bool but on davinci.c assigning a value
> '-1' to the bool variable.

Does it also test that value?

If so, shouldn't that logic error be fixed instead of working around it
by changing the variable type?

This feels wrong...

thanks,

greg k-h
