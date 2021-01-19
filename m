Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA179C0044D
	for <linux-usb@archiver.kernel.org>; Tue, 19 Jan 2021 12:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A577B22D2A
	for <linux-usb@archiver.kernel.org>; Tue, 19 Jan 2021 12:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392554AbhASMQ4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:16:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:42894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389292AbhASK2L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 05:28:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 762A323121;
        Tue, 19 Jan 2021 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611052051;
        bh=e8+L45ufJ1oImtwQPnL76cydMTl3V5ZvMyT/yIrnKaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DC9e/xT5J7SQ/cR4znRAGpA53c69O9631gqUBLPs5jGNCwMve/wN5uh888xcMmOSg
         aUK7tp8G2zZln1ZmUn/rxawkiBe+tO7b+kGHcaOdPUELL5foCmRLWgZkTCNiOmXYmR
         vvKADsNaDQ+8jzCZLLUDlgp6/shX8At3eg/1zXME=
Date:   Tue, 19 Jan 2021 11:27:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Howard Yen <howardyen@google.com>
Cc:     robh+dt@kernel.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: host: add xhci hooks for USB offload
Message-ID: <YAa0ENtLxmcdA7wX@kroah.com>
References: <20210119101044.1637023-1-howardyen@google.com>
 <20210119101044.1637023-2-howardyen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119101044.1637023-2-howardyen@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 19, 2021 at 06:10:41PM +0800, Howard Yen wrote:
> To enable supporting for USB offload, define "offload" in usb controller
> node of device tree. "offload" value can be used to determine which type
> of offload was been enabled in the SoC.
> 
> For example:
> 
> &usbdrd_dwc3 {
> 	...
> 	/* support usb offloading, 0: disabled, 1: audio */
> 	offload = <1>;
> 	...
> };

This patch doesn't require this change, right?  That's only necessary
for your DT change later on, from what I can tell, so maybe it's not
needed to list this here, as the xhci core changes do not seem to
require dt at all.

thanks,

greg k-h
