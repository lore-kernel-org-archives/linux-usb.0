Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329ACC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 11:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB7D8208FE
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602502128;
	bh=sTuFov17QoNXvw1Tg9+jfAMUuJ6kBXheaeeiufRm4Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Kkd2L1L7v+TkUi38bbjbAJYOzOKd4S7mc/xB2QjgEx9k+MmFnKU31u5wSKWr1PYDA
	 usjIaW3YDhHxOSW7Xvo4pdhv6Kwf7Rj4EvLV1OqN41wgG/hVjelpf4SM7K459mO2uQ
	 EJUQDIBgToZmqim2nAzI9FnvH8nMSaNeYdY9rfMw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgJLL2p (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 07:28:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387617AbgJLL2o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 07:28:44 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0BE32080D;
        Mon, 12 Oct 2020 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602502124;
        bh=sTuFov17QoNXvw1Tg9+jfAMUuJ6kBXheaeeiufRm4Uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ztBicItN8ZBStXxDAbrbg12G6I7X99E+HqS6WiwUApfZ7XM++w65xYT684QAJ0mEn
         OwLtTucPhNu8dNb/7h5MvdkC3Mh55Tbyn3X98e7S+8Hvd7IsdPyS0+NddQ5UWKxh1l
         Q6Eh2PP5Lc1W1drEcBis4+HaIP98YUghXB5lYxxY=
Date:   Mon, 12 Oct 2020 13:29:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     rickyniu <rickyniu@google.com>
Cc:     balbi@kernel.org, astrachan@google.com, amit.pundir@linaro.org,
        lockwood@android.com, benoit@android.com, jackp@codeaurora.org,
        vvreddy@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kyletso@google.com
Subject: Re: [PATCH 0/3] f_accessory upstream
Message-ID: <20201012112923.GE356911@kroah.com>
References: <20201012111024.2259162-1-rickyniu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012111024.2259162-1-rickyniu@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 12, 2020 at 07:10:21PM +0800, rickyniu wrote:
> Below commit is to add log and send uevent:
> 0003-ANDROID-usb-f_accessory-send-uevent-for-51-52-reques.patch

I don't understand the text in this changelog, what does it mean?

confused,

greg k-h
