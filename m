Return-Path: <SRS0=CVr8=AR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8AFC433DF
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 197AA2073E
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594031497;
	bh=PKJqXwmnBUa/sptDECePTi5+E2rgrpZGpUUkwLdHA+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e5MC0Qzzd7O2LwWiWJpViiKUVOauaEx5SIRT1+FSpT68OWwohemPPatVBQ4haOn+m
	 ysuST3+XLMeXPjGuqhIygDaPBWQ6PVvXsLrJmp0k3VOPQ7IDEBJlLEctiMTgAmYrcZ
	 W58zMdN8oiS9x5XzwYzqIiq5zYcznX4Nu0YZch2c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgGFKbd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 Jul 2020 06:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728733AbgGFKbd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 06:31:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78E992073E;
        Mon,  6 Jul 2020 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594031493;
        bh=PKJqXwmnBUa/sptDECePTi5+E2rgrpZGpUUkwLdHA+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lut7e6l0dkPiNYIDGARuhUsomrpajCRtmTrFxnfS+5vl+arDqhJr9Q+2vfeIfSkXS
         JkWpAtJq5kjg62GddK3XPOhr6U+/6ecCtLqwUGAuBOmKGPRJbOhOQXhXj3828/mfCU
         ZaJ2F2Z34FjPEG4NodzVJobhmPZnd14ruq/d2GLE=
Date:   Mon, 6 Jul 2020 12:31:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     balbi@kernel.org, colin.king@canonical.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: function: fix missing spinlock in
 f_uac1_legacy
Message-ID: <20200706103130.GB10624@kroah.com>
References: <20200705061616.833-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705061616.833-1-qiang.zhang@windriver.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 05, 2020 at 02:16:16PM +0800, qiang.zhang@windriver.com wrote:
> From: Zhang Qiang <qiang.zhang@windriver.com>
> 
> Add a missing spinlock protection to the add operation of the "audio->play_queue"
> in "f_audio_out_ep_complete" function.

That says _what_ you did, but not _why_ you did that.  Why is a lock
needed here?  What does this protect?

What kernel commit does this "fix"?  Put that in the "Fixes:" line, and
probably you need a "cc: stable" in that area too, right?

thanks,

greg k-h
