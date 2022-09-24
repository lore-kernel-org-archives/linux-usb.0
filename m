Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8FDC07E9D
	for <linux-usb@archiver.kernel.org>; Sat, 24 Sep 2022 10:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbiIXKkf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 24 Sep 2022 06:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbiIXKkW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:40:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D1C7960D;
        Sat, 24 Sep 2022 03:40:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C56B7B80A75;
        Sat, 24 Sep 2022 10:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F498C433D6;
        Sat, 24 Sep 2022 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664016016;
        bh=f8N+yCdsQ1RHIqKBupJ5gztnhgNAiREzDV4TWZohgpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QNlagW5Dc7+pPZ3GP4RLMYpiR1JwxfFqgaqvezYQ5fCmFqaLqSoJr/ktTqWaNtu5j
         9hLD3robQ4IC30cZWm8nW3+SqxM0v/F5A2M0N4s26uD12FJx52jH115Ui8kzbUPlSn
         XDntOGV4grELdtGld+4xqEVRaSeWHBOhvDq52g58=
Date:   Sat, 24 Sep 2022 12:40:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "usb: dwc3: Don't switch OTG -> peripheral
 if extcon is present"
Message-ID: <Yy7ejW5USwomc0VL@kroah.com>
References: <20220923163051.36288-1-andriy.shevchenko@linux.intel.com>
 <20220923163051.36288-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923163051.36288-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 23, 2022 at 07:30:51PM +0300, Andy Shevchenko wrote:
> This reverts commit 0f01017191384e3962fa31520a9fd9846c3d352f.
> 
> As pointed out by Ferry this breaks Dual Role support on
> Intel Merrifield platforms.
> 
> Reported-by: Ferry Toth <fntoth@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Cc: stable?  Fixes?

{sigh}

greg k-h
