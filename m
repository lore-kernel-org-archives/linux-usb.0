Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE55C77B7F
	for <linux-usb@archiver.kernel.org>; Fri, 19 May 2023 09:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjESJsD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 May 2023 05:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbjESJrj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 05:47:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4102108;
        Fri, 19 May 2023 02:46:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B51D61019;
        Fri, 19 May 2023 09:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1300EC433EF;
        Fri, 19 May 2023 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684489598;
        bh=vISZVnoLhJQ8QsHDaywxxs4iOAAD/wIDiLAYiuafXF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCf13aFsJknvmSm+taCIVIZoxHEz7gnejXjyuoixvTlzkxWVkyDaZB1vWSW8Z2jUb
         Sq8B1M0AvO8BFZgj7ovtJqHLN/2knAKpvwUXZXiGcBVGkYbiBpE0oZ0XtXfb+i4jKm
         sCc/4IjT3ww6NT3QZmFiHwI3yDXjjX1yHJQbbc7o=
Date:   Fri, 19 May 2023 10:46:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 07/36] ALSA: usb-audio: Define USB MIDI 2.0 specs
Message-ID: <2023051916-python-small-9431@gregkh>
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-8-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519093114.28813-8-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 19, 2023 at 11:30:45AM +0200, Takashi Iwai wrote:
> Define new structs and constants from USB MIDI 2.0 specification,
> to be used in the upcoming MIDI 2.0 support in USB-audio driver.
> 
> A new class-specific endpoint descriptor and group terminal block
> descriptors are defined.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-usb@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
