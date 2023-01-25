Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05A7C27C76
	for <linux-usb@archiver.kernel.org>; Wed, 25 Jan 2023 14:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbjAYOlA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Jan 2023 09:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235928AbjAYOkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 09:40:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A601420A
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 06:40:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29EEFB81991
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 14:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858C2C433D2;
        Wed, 25 Jan 2023 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674657585;
        bh=efg09H21OP3vl69+MpYtiS6xpVm68aVSFNhzWEKPPIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JulAp4iYYNIBfQet8QZpfweBToU4K8ywLZxLFZb+oy5C6CJTMHiHUOAkfRuN8DsOk
         +0jhYniOFfi9Itkwz91mgCEpwARF/+Y9l0BYjWi17G1gZgVxiXEN9zOPgXbtXFBH46
         yS86jKpaO0GC1KxBBSPf5bKFWDhreMKENOTPyCM8=
Date:   Wed, 25 Jan 2023 15:39:43 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: Restrict symlink creation if UDC
 already binded
Message-ID: <Y9E/L6WcfTvljZok@kroah.com>
References: <20230125065740.12504-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125065740.12504-1-quic_ugoswami@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 25, 2023 at 12:27:40PM +0530, Udipto Goswami wrote:
> During enumeration or composition switch, if a userspace process
> agnostic of the conventions of configs tries to create function symlink
> seven after the UDC is bound to current config which is not correct.
> Potentially it can create duplicates within the current config.

I'm sorry, but I can not parse this paragraph at all.

Exactly what is the problem here?  Is userspace doing something it
shouldn't?  If so, fix userspace, right?

> Prevent this by adding a check if udc_name already exists then bail
> out of cfg_link.

Why?  What will this help prevent if userspace already messed things up?

confused,

greg k-h
