Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439C2C4332F
	for <linux-usb@archiver.kernel.org>; Wed, 19 Oct 2022 16:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbiJSQDk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Oct 2022 12:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiJSQDD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Oct 2022 12:03:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A4410D6B9;
        Wed, 19 Oct 2022 09:01:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18E05B824FC;
        Wed, 19 Oct 2022 16:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7992FC433B5;
        Wed, 19 Oct 2022 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666195314;
        bh=9MsRzyMOr76DhU9s5I61Fc+shnxHSuwFEcdVGKqv77A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKBv82goDITmIwCIhVGlZK5HLtZOXyQMR+m4g+3aMKpYIoL32dhnI4VyR7kgdrhHb
         nY5buhUOCOgbCM2FJUwuPot6DXFtwVbau0eTAp4zGqlsM6ryUjpbhgxNoB9Zl373of
         xLseGc5aLzk3HU5gsJw3Uh/tc7O2o/Vbp1snGdyI=
Date:   Wed, 19 Oct 2022 18:01:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH printk v2 18/38] usb: early: xhci-dbc: use
 console_is_enabled()
Message-ID: <Y1AfcEymniDCQgZ2@kroah.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-19-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-19-john.ogness@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 19, 2022 at 05:01:40PM +0206, John Ogness wrote:
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
