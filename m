Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED1DEE4996
	for <linux-usb@archiver.kernel.org>; Tue, 22 Aug 2023 12:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbjHVMeY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbjHVMeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 08:34:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA750196;
        Tue, 22 Aug 2023 05:34:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79D8E64659;
        Tue, 22 Aug 2023 12:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60031C433C7;
        Tue, 22 Aug 2023 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692707661;
        bh=AhVnFhhnUOCeI76fWBEHX4+MuV9F2OXR8V+tH5qe5IA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HM8kRgkZhd5RkaRxzfMZUfB3n8BRcAyZBR71CeoOduJtyWKl59LyZ3SgvX+yKwENk
         o/CuH5pTkyrLtzQ1hL8oO0TwiAF7dFKA1ZsNTM363NllJ0LZFnPbDGZSx739ZdNrZ7
         1H/8Jb2MLi7qqHmlVt2xuwRg5gz0ZMcocohcqxqU=
Date:   Tue, 22 Aug 2023 14:34:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     chengdong zhou <zhouscd@gmail.com>
Cc:     dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        m.grzeschik@pengutronix.de, john@keeping.me.uk,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: gadget: Fix the function name error in
 sourcesink/loopback.
Message-ID: <2023082211-trimming-debtor-ba00@gregkh>
References: <20230801083244.165392-1-zhouscd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801083244.165392-1-zhouscd@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 01, 2023 at 01:32:45AM -0700, chengdong zhou wrote:
> Change function name from "source/sink" to "sourcesink".

But why?

thanks,

greg k-h
