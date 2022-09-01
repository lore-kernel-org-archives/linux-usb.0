Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971B7ECAAD1
	for <linux-usb@archiver.kernel.org>; Thu,  1 Sep 2022 12:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbiIAMeE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbiIAMeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 08:34:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C611038
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 05:34:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6630EB82468
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 12:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBAFC433D6;
        Thu,  1 Sep 2022 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662035640;
        bh=sCEQMvVnQV1Sps5sXaHvVad4XjQxVJGUiyzLzX2kLao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=moj97C2+NacrkHB69IERGBWQTDPfGfz+Ds73epi58Jr/JanSE/YhpfiZhj1WKThxO
         zrnDE//hF0Fiuw6IfaEngifwSIGtzPNmlYhxS/K3VoBkU1qKrkE3JUJP441dDPzWs6
         pcBPglPyNddLMKU48FaNL6r9xqZsFGVWpThoJaJw=
Date:   Thu, 1 Sep 2022 14:33:57 +0200
From:   gregkh <gregkh@linuxfoundation.org>
To:     "zhongling0719@126.com" <zhongling0719@126.com>
Cc:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <YxCmtVAIrSHeLn4V@kroah.com>
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
 <YxBvNEn0jEEd0lXV@kroah.com>
 <409cbf8b.5b1a.182f8682364.Coremail.zhongling0719@126.com>
 <YxCDQi3TpXbcwCQ5@kroah.com>
 <202209012012228283526@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209012012228283526@126.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 01, 2022 at 08:13:24PM +0800, zhongling0719@126.com wrote:
> Sorry, have fixed the email client to send html email.

This was sent in html format :(
