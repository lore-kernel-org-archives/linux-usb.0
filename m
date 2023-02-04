Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E029C61DA4
	for <linux-usb@archiver.kernel.org>; Sat,  4 Feb 2023 13:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjBDNzP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 4 Feb 2023 08:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjBDNzN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Feb 2023 08:55:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E2D1E1F5;
        Sat,  4 Feb 2023 05:55:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8157160C58;
        Sat,  4 Feb 2023 13:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD90C433EF;
        Sat,  4 Feb 2023 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675518905;
        bh=0JxAzauyOrTcT0Tlc82PD/McD30OsxQcRbfcF4+j5JQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NwDsW9ohSu9q73GR6WiQ6lxyHM0ec1Z2ISnHjZFtFIJ+6i3Ec9oHwssFMP65uR/S3
         JOLtyRowAuMJV9f6LP5ypyC8XwBd3iRVb8b6UjwU6XRQVUttJ3qoTuRf+Wy3O5nBuG
         knyJZh4Uy46TvI2ppRrxcT7YHUrUKLKWRLiZb6LY=
Date:   Sat, 4 Feb 2023 14:55:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nam Cao <namcaov@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: whiteheat: use stack instead of heap memory
Message-ID: <Y95jtuMbcDiPRw/F@kroah.com>
References: <20230204134651.22569-1-namcaov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204134651.22569-1-namcaov@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 04, 2023 at 02:46:51PM +0100, Nam Cao wrote:
> Some buffers in whiteheat_attach() are small and only used locally. Move
> them to the stack to avoid complications with heap memory.
> 
> Compile-tested only.

And that's the problem, you can't just compile test these things, the
code will blow up if you make these changes :(

All USB transfers need to come from memory that can be safely DMAed.
Stack memory is not that type of memory, you HAVE to allocate it
dynamically from the heap in order to have this guarantee.

So no, this patch is not acceptable, sorry.  You will see this pattern
in all USB drivers, all data must be dynamically allocated, even for 2
byte commands.

So yes, there was a reason we added this "complexity" to the driver, it
is required :)

sorry,

greg k-h
