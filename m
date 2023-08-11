Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76154C001DE
	for <linux-usb@archiver.kernel.org>; Fri, 11 Aug 2023 01:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjHKBws (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Aug 2023 21:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjHKBwr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 21:52:47 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DDA6A2132
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 18:52:46 -0700 (PDT)
Received: (qmail 263446 invoked by uid 1000); 10 Aug 2023 21:52:46 -0400
Date:   Thu, 10 Aug 2023 21:52:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Message-ID: <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
 <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 10, 2023 at 10:39:36PM +0000, Thinh Nguyen wrote:
> On Thu, Aug 10, 2023, Alan Stern wrote:
> > Never mind; I found the problem.  I had forgotten that at SuperSpeed or 
> > faster, the device descriptor uses a logarithmic encoding for 
> > bMaxPacketSize0.
> > 
> > The patch below should fix things up.  Let me know how it goes.
> > 
> 
> Quick test for Gen 1 and 2 devices work fine now. Highspeed also works
> as expected before. I didn't test Fullspeed with various MPS, but I
> don't expect any problem looking at the change.
> 
> Thanks for the fix,

And thanks for testing it.  Is it okay to put your 
"Reported-and-tested-by:" tag on the submitted patch?

Alan Stern
