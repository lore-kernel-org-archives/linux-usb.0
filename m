Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CCFC433DB
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 12:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E614C238E4
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 12:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbhAHMV7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Jan 2021 07:21:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:54134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbhAHMV7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 07:21:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93195238E4;
        Fri,  8 Jan 2021 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610108478;
        bh=CGyJVGRnQUYO+Dwo4ILDxEFobjgiAm4vANZ35SFjRV4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MLryRnKHypOReQqOXqkOcMYCuhbGUcwnL3G7NGpCrsl4eVIPM5AisIPpGId1oC5a0
         3QmasNX/oubX4G5K3RnPBJialUK24gquHFumpY54G63J7pj1N+0hskyCQJ6K8cv8sn
         aIQrBdsYmZIVbGsRT4tIF71fu/aFVO46XJXVC7lO2omH6DsxMLPVbNcy9G2YyHY3og
         8C2ZQaeZdLndkK5MKaSIIiyVoZ5vpdn4J3yLip7fTbL0iDRdptJoiXneLEOS2qf67P
         fIrvcHFdrEc2xgMTl1JVMv1Z1n4o0dAdBbtp17/XAUS42b2DP4lT2NmqpbXO9/tyjl
         6/UwelUa18wNA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW@aspeedtech.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 1/1] usb: gadget: aspeed: fix stop dma register setting.
In-Reply-To: <20210108081238.10199-2-ryan_chen@aspeedtech.com>
References: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
 <20210108081238.10199-2-ryan_chen@aspeedtech.com>
Date:   Fri, 08 Jan 2021 14:21:14 +0200
Message-ID: <87h7nrwret.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Ryan Chen <ryan_chen@aspeedtech.com> writes:
> The vhub engine has two dma mode, one is descriptor list, another
> is single stage DMA. Each mode has different stop register setting.
> Descriptor list operation (bit2) : 0 disable reset, 1: enable reset
> Single mode operation (bit0) : 0 : disable, 1: enable
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

I don't have HW, but FWIW:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
