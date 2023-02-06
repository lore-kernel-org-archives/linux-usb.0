Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A61C05027
	for <linux-usb@archiver.kernel.org>; Mon,  6 Feb 2023 20:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjBFUR5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjBFURy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 15:17:54 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3DB1D2914A
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 12:17:25 -0800 (PST)
Received: (qmail 669200 invoked by uid 1000); 6 Feb 2023 15:17:05 -0500
Date:   Mon, 6 Feb 2023 15:17:05 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Karina Yankevich <k.yankevich@omp.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: storage: sddr55: avoid integer overflow
Message-ID: <Y+FgQUvhTCxfpJCA@rowland.harvard.edu>
References: <20230203201821.483477-1-k.yankevich@omp.ru>
 <Y91zL8OWTUd8iTXt@rowland.harvard.edu>
 <53bc0584-51eb-8bb7-de48-ca07fccafc19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53bc0584-51eb-8bb7-de48-ca07fccafc19@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 06, 2023 at 11:04:54PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 2/3/23 11:48 PM, Alan Stern wrote:
> [...]
> >> We're possibly losing information by shifting an int.
> >> Fix it by adding the necessary cast.
> > 
> > Nonsense.  The card's _total_ capacity is no larger than 128 MB, so a 
> > page address can't possibly overflow an int.
> 
>    Then the 'address' variables shouldn't be declared *unsigned long*, right?
> That should fix the SVACE's report as well. Would you accept such a patch?

Yes.

Alan Stern
