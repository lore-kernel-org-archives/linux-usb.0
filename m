Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88AEC4332F
	for <linux-usb@archiver.kernel.org>; Sat, 12 Nov 2022 07:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbiKLH4r (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 12 Nov 2022 02:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiKLH4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Nov 2022 02:56:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDADFAC9
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 23:56:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 856EAB80011
        for <linux-usb@vger.kernel.org>; Sat, 12 Nov 2022 07:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EADC433C1;
        Sat, 12 Nov 2022 07:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668239801;
        bh=Ux9xAeStHNV6PF6h1s8hApRSn76/uNRmwc0F+xDOV3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=whKi7kxD09fp3OB7cO419nGkBAdnsV0jaVMfdUa8giJdKCuhFW723pyV0p4iTSxVi
         u8FktUTmenLL8CGI7hfX5EUrcqddCaGNiqBI/r5l9qBKQ5tUcROWgdAkSCgluEvzNF
         r6GNFV+6K1jR2VS0wubcSsU6E0YoZ1D1TMXVoU00=
Date:   Sat, 12 Nov 2022 08:56:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "zhongling0719@126.com" <zhongling0719@126.com>
Cc:     Juhyung Park <qkrwngud825@gmail.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Message-ID: <Y29RtXGcey6V9iTY@kroah.com>
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com>
 <Y2uDnUQKCDGzioJN@kroah.com>
 <2022111215445443712314@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2022111215445443712314@126.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 12, 2022 at 03:45:36PM +0800, zhongling0719@126.com wrote:
> Hi:
>   This error not happend on all RTL9210,The uas blacklist only for on sale device(0x0bda, 0x9210). 

What about using the version of the device as the only one to blacklist?
Any more specific information you have about that device?

thanks,

greg k-h
