Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF791C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 19 Jul 2022 03:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbiGSDHT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Jul 2022 23:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiGSDHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 23:07:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F1225587;
        Mon, 18 Jul 2022 20:07:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A19C360BFE;
        Tue, 19 Jul 2022 03:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94254C341C0;
        Tue, 19 Jul 2022 03:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658200034;
        bh=m1/dWydGCMXYgQJY8RCEuy5NF5lyxn33ITGn0xtQJZM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=umx/OhWSJetJjN1zdMJAw+KXR3NtuOxFZjVr0HN8Z8bWmY4EME6gf7aGwC56Jf1e8
         8fr1NkJHqxx0fRvvVKxLck6oyV4sg/jFKJnA5Pb7R6PER0CIYewkUDgM9TXssiW7i+
         kkOmfhTQRzCcsU3aboeIdcxPdqpI4GiNuDIt9sUYeoAQ8jUs6eXQMXO69yIpFQc442
         EY85/6d9HkBJwosABMwTiEDtPfT0QBnE89DX+EAULUmsiddZ8/ye4F08wEKV8LNVsN
         3oNAqBUUt6kN0Hmo46bGgqI2tiAEZ5OyF7B5urzob5GSZBatWYswlH/5bbrrKK52pI
         RjC+Ur8r8hrEg==
Date:   Mon, 18 Jul 2022 20:07:13 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, grundler@chromium.org, pabeni@redhat.com,
        edumazet@google.com, davem@davemloft.net
Subject: Re: [PATCH] sr9700: improve packet length sanity check
Message-ID: <20220718200713.16de615e@kernel.org>
In-Reply-To: <20220714132134.426621-1-cascardo@canonical.com>
References: <20220714132134.426621-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 14 Jul 2022 10:21:34 -0300 Thadeu Lima de Souza Cascardo wrote:
> The packet format includes a 3 byte headers and a 4 byte CRC. Account for
> that when checking the given length is not larger than the skb length.

Please describe in detail the issue you're fixing. What will happen if
we don't include SR_RX_OVERHEAD in the check.

> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> Fixes: e9da0b56fe27 ("sr9700: sanity check for packet length")
