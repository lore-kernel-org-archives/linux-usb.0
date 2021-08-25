Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AFEC4338F
	for <linux-usb@archiver.kernel.org>; Wed, 25 Aug 2021 05:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB9C961212
	for <linux-usb@archiver.kernel.org>; Wed, 25 Aug 2021 05:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238073AbhHYF5c (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Aug 2021 01:57:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232480AbhHYF5c (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 01:57:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3742561368;
        Wed, 25 Aug 2021 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629871006;
        bh=bXZkN6k3XEMl7FDzf2tMZzyrQD4N5vHCpFDaMnkAodY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=HK1iek2lH0x/FEbafzj3DMADTPdEAlkCBFBFtiEsczBVKNyfaJqkM+xn4NgNV5acY
         k5pBhKBwdpqU2lERDjwU//+Po67VOnCPoFio10eTJ69yHgWFJLR+E1haksVQAFAcme
         Vl/MYhU7dgHBPUYzVSepSOGq9bIErnJkHjPKYy1i0oZy6NUn0mCU5OjEMXwYbIIsIp
         jazxD+wC3XTp8DwAzEMsvgro5V9/GOmQEdpsvUfw+vY17KVpXJQkiK1P3xDqA48WT2
         xZUo4J7qQI430zGGXztKQwTmDnbOKxGlTcxCUSSL0bFdpZ9I20w2uLI6nriBZbFRYl
         snuG6hlPVKZxg==
References: <20210824192337.3100288-1-Nehal-Bakulchandra.shah@amd.com>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kun.liu2@amd.com,
        alexander.deucher@amd.com
Subject: Re: [RESEND PATCH 2/2] usb: dwc3: pci add property to allow user
 space role switch
Date:   Wed, 25 Aug 2021 08:55:41 +0300
In-reply-to: <20210824192337.3100288-1-Nehal-Bakulchandra.shah@amd.com>
Message-ID: <87ilzu5ap0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com> writes:

> For AMD platform there is a requirement to enable user space role
> switch from host to device and device to host as customer platform is not
> completely capable of OTG i.e. with type C controller it does not have PD
> to support role switching. Hence, based ACPI/EC interrupt role switch is
> triggered by the usemode script running in background.
                   usermode ?


> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>

I'm okay with this, just wondering if we need to Document the property
somewhere.

@Heikki, is there a place to document these private properties that's
not on DT binding document?

-- 
balbi
