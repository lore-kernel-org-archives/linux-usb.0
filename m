Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB086C433F5
	for <linux-usb@archiver.kernel.org>; Wed,  5 Oct 2022 11:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiJELwk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Oct 2022 07:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJELwZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Oct 2022 07:52:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE0DBD1;
        Wed,  5 Oct 2022 04:52:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8F42616C2;
        Wed,  5 Oct 2022 11:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CACC433D6;
        Wed,  5 Oct 2022 11:52:22 +0000 (UTC)
References: <20220930114041.1306711-1-gregkh@linuxfoundation.org>
User-agent: mu4e 1.8.9; emacs 28.2
From:   Felipe Balbi <felipe@balbi.sh>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: move USB gadget and phy entries under the
 main USB entry
Date:   Wed, 05 Oct 2022 14:51:55 +0300
In-reply-to: <20220930114041.1306711-1-gregkh@linuxfoundation.org>
Message-ID: <87czb6wkr0.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> Felipe has done a wonderful job over the years, but now it makes sense
> to just maintain all of the USB stack in one tree.  Do so by removing
> the current USB gadget and phy entries so that all portions of the stack
> are now covered by the main USB maintainer entry.
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
