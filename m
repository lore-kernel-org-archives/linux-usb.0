Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2377C001DE
	for <linux-usb@archiver.kernel.org>; Tue, 25 Jul 2023 16:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjGYQ3U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjGYQ3T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 12:29:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7DA10C9;
        Tue, 25 Jul 2023 09:29:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD6296179A;
        Tue, 25 Jul 2023 16:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7A2C433C7;
        Tue, 25 Jul 2023 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690302555;
        bh=8V3JU6dJEtGUWklvo/YnWOtYSGFsSMLIx1oBF8E8QBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xI9jD8nPfS4CfSdJJIQFbHgjwL9Yw2WTfzkz9O+8d8Y9G7GVLu5eq0/yHQDCnemYE
         myFhEYy+2bV3bPmQ4pmvClerAqtdAxo1h4Tuwkg5ECziImuJURePjk0teHaq2dGvti
         GFoqRC5T/SFiQnEUGCBpYMwGGHObIj3j4obIoCP8=
Date:   Tue, 25 Jul 2023 18:29:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: Add USB MIDI 2.0 Gadget Function Driver
Message-ID: <2023072550-refocus-depth-1086@gregkh>
References: <20230725062206.9674-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725062206.9674-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 25, 2023 at 08:21:59AM +0200, Takashi Iwai wrote:
> Hi,
> 
> This is a patch set for adding a USB gadget function driver for USB
> MIDI 2.0 interface.  The MIDI 2.0 support in the host side was already
> enabled since 6.5 kernel in snd-usb-audio driver.  Now, this provides
> a similar gadget functionality using the existing ALSA UMP helper
> functions.
> 
> The gadget driver provides both MIDI 2.0 and MIDI 1.0 fallback
> interfaces with one or more loopback UMP rawmidi devices.  The
> configfs implementation is flexible enough to allow users to set up
> multiple UMP Endpoints and Function Blocks.
> 
> The first patch adds the bare f_midi2 driver without configfs support,
> followed by the configfs support, MIDI 1.0 interface support and a few
> other extensions and documentation.
> 

Very cool, thanks for doing this!  All now queued up, let's see what the
builders say...

greg k-h
