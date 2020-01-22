Return-Path: <SRS0=IeTI=3L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE087C2D0DB
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 13:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAC3120678
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579699822;
	bh=3UQCfBgP2ba6sY+O8WJldrVt/XdsZIcugL6RN8tGkt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uUMWrUaYJeeZuhGuhVizVx5QDDtNzCMtQ1KJxejQPu3yo18akrFKcXB+Zs2h7b5Ei
	 qhpL3dj1depLA1m+E0f5x93/bgrqtlX5X0vNmshYUZAmSc+18JqKJBWhC4D8fn68mg
	 562oePw91htTgn6LE+0kKMWsd56Em+dxhWkMgirY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgAVNaV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jan 2020 08:30:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:53254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729058AbgAVNaV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 08:30:21 -0500
Received: from localhost (unknown [84.241.205.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3DA9205F4;
        Wed, 22 Jan 2020 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579699820;
        bh=3UQCfBgP2ba6sY+O8WJldrVt/XdsZIcugL6RN8tGkt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V3HVy72wcST1LoAuV7qNKuZ+5Es29yh1SOuQtcGMgZQgy1ZkGh4EZuyimueOvTiDr
         du+/dkw4YCxdP/17K6vQUMSeMqqCQOd94lK2lEqayJFALANlCg0NEcrypjmuVAvX8K
         MxE1BfX6ghRhOt2aqoNRFHFCa4QpQihqXITWWJbw=
Date:   Wed, 22 Jan 2020 14:24:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable <stable@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 2/5] USB: serial: ir-usb: fix link-speed handling
Message-ID: <20200122132450.GA3580@kroah.com>
References: <20200122101530.29176-1-johan@kernel.org>
 <20200122101530.29176-3-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122101530.29176-3-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 11:15:27AM +0100, Johan Hovold wrote:
> Commit e0d795e4f36c ("usb: irda: cleanup on ir-usb module") added a USB
> IrDA header with common defines, but mistakingly switched to using the
> class-descriptor baud-rate bitmask values for the outbound header.
> 
> This broke link-speed handling for rates above 9600 baud, but a device
> would also be able to operate at the default 9600 baud until a
> link-speed request was issued (e.g. using the TCGETS ioctl).

People still use this driver/hardware?  And this wasn't found until now?
wow...

> Fixes: e0d795e4f36c ("usb: irda: cleanup on ir-usb module")
> Cc: stable <stable@vger.kernel.org>     # 2.6.27
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
