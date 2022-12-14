Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8F6C4332F
	for <linux-usb@archiver.kernel.org>; Wed, 14 Dec 2022 08:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236681AbiLNIVe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 14 Dec 2022 03:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbiLNIV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:21:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8F6E09;
        Wed, 14 Dec 2022 00:21:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20615B816AC;
        Wed, 14 Dec 2022 08:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEA9C433EF;
        Wed, 14 Dec 2022 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671006084;
        bh=AelTatIhVmzfRgJaI2rAkm+beB1sdjhm/gXAN7z25WM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g7eSMWGFGJ4lC5sncueD30uDdxKUjsMFOygKjkJRfnQ0PLIRtEF/2ts14hasQlDNj
         ogftZ2XP03wRuG6WUksnfnQi6bSIqXha+0bYOY5gF6RuapWfkmXj3PoVCGVU7ga1YV
         RlXGvlIFNLIX5JhwBFyYOmlA8sitiHVKN2iEvqi0=
Date:   Wed, 14 Dec 2022 09:21:21 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Puma Hsu <pumahsu@google.com>
Cc:     mka@chromium.org, dianders@chromium.org, albertccwang@google.com,
        raychi@google.com, howardyen@google.com, leejj@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: core: add implementations for usb
 suspend/resume hooks
Message-ID: <Y5mHgYNflldQDkdi@kroah.com>
References: <20221214070650.703793-1-pumahsu@google.com>
 <20221214070650.703793-3-pumahsu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214070650.703793-3-pumahsu@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 14, 2022 at 03:06:50PM +0800, Puma Hsu wrote:
> +	/*
> +	 * Note: Our private driver provides APIs to know the device is in audio playback
> +	 * or capture.
> +	 *
> +	 * usb_playback = usb_audio_playback_enabled();
> +	 * usb_capture = usb_audio_capture_enabled();
> +	 */

There is no such thing as a "private driver" in Linux, sorry, you know
this.  Submit the real code please, otherwise this is just wasting
everyone's time :(

greg k-h
