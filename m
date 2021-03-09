Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54CDC433E6
	for <linux-usb@archiver.kernel.org>; Tue,  9 Mar 2021 14:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A88E6522B
	for <linux-usb@archiver.kernel.org>; Tue,  9 Mar 2021 14:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCIOKa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Mar 2021 09:10:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:60224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhCIOKO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 09:10:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87665651A2;
        Tue,  9 Mar 2021 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615299014;
        bh=nDM6MqJTdKVsD4JZGwxhJR8R2P4ICV+0JJ63T8Yzwnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kzctxuBXtGw3ZyJavqq6fL2hV/0QPPoAidLeNzivrtqCQcQ53lOJe4dcYfOowWJFT
         ALfzgUlLdnRPPDiuw9g6Pij5JvPFLTd1aCvYGM9QTsRv4lRQH8N9AcDMgotj4AjSgw
         GlYWQXkYjc++LJwYKn72PfHjZ3IlTJmG2qikW+dg=
Date:   Tue, 9 Mar 2021 15:10:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH 1/3] thunderbolt: Add details to router uevent
Message-ID: <YEeBw6SInPXfkELe@kroah.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309134818.63118-2-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 09, 2021 at 04:48:16PM +0300, Mika Westerberg wrote:
> Expose two environment variables for routers as part of the initial
> uevent:
> 
>   USB4_VERSION=1.0
>   USB4_TYPE=host|device|hub
> 
> Userspace can use this information to expose more details about each
> connected device. Only USB4 devices have USB4_VERSION but all devices
> have USB4_TYPE.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
