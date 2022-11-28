Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64A3C43217
	for <linux-usb@archiver.kernel.org>; Mon, 28 Nov 2022 14:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiK1Oma (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Nov 2022 09:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbiK1OmF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 09:42:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B2E1D315
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 06:42:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21E7CB80DD5
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 14:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0170C433D6;
        Mon, 28 Nov 2022 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669646521;
        bh=xXnaLuTbxng0ikkatNtCB+VkUXgBO+30UtpvovV6cZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNjFZxYCz+G0FN/ZpF+HEs7JAhFhN40i2JucvGCyHIZIWtGEl4hCq6TCfLvGzEJEh
         qvcy5ISCMI8wgglTpbi80MG6Hci/q2pMoFj9hXwRfa3EiLTKtTrzgOGVvvd54utTCz
         WwchLxdewtuI4/bIbreZ0LT9lpA353PbKUHftdyJ93Mc6BWUw2/BjrAAgz9aWKM330
         tNC5Hu+wzT9Vkn0pmhVEMQc2dfzMZvVCFqZ+vNJhmXq5c4afW63FUZxeHLqR1YLce4
         ZH03fSLB9mBNujunLkzo9q7ivO8SBp/RymyeMRd+mNthTDf08s74Ti6sEayI6oZXq3
         zCyNHatjIcVkg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozfKZ-0002Fs-CR; Mon, 28 Nov 2022 15:41:59 +0100
Date:   Mon, 28 Nov 2022 15:41:59 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     linux-usb@vger.kernel.org, johanna.abrahamsson@afconsult.com,
        alexhenrie24@gmail.com
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Message-ID: <Y4TItxxwSNy7OnMA@hovoldconsulting.com>
References: <20221126035825.6991-1-alexh@vpitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126035825.6991-1-alexh@vpitech.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 25, 2022 at 08:58:25PM -0700, Alex Henrie wrote:
> When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> driver reset the baud rate to the default of 9600 (see the comment above
> the uart_get_baud_rate function). Some old versions of the NXP blhost
> utility depend on this behavior. 

What exactly do you mean by "depend on" here? Setting B0 is supposed to
hang up a modem connection by deasserting the modem control lines, but
there's nothing mandating any particular line speed to be set in
hardware. Why would that even matter?

If the user space tool is thrown off by the fact that B0 isn't
implemented, perhaps that's what should be addressed.

Johan
