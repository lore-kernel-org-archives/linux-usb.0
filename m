Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7238DC63697
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 15:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C3AD21D1A
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 15:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mnXLMbV6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390791AbgKZPAC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:00:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:59826 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389911AbgKZPAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 10:00:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606402800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MN+K+KATzL0V3+o8x50winEV8cRDI7V0yHzEukvAr/I=;
        b=mnXLMbV65ayeOxDZehLW2H/5ikrbBLfEIKpFBbQcuPncs36ZRlctwz0O0xw4YH3OtEAaIr
        UO7XmfWrAobsy3yEHcqe5F2B+edxUAoV8O52IqbF9k6i4FWnNWkmYBK7cPmnBWOijFu78+
        w9CxbnP1iuzqzFFDQbPhJTzzrsQ2Pks=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6C159ACE0;
        Thu, 26 Nov 2020 15:00:00 +0000 (UTC)
Message-ID: <986e95f8d75780ddeda90e135237eccf1d9b1e55.camel@suse.com>
Subject: struct mii_if_info in usbnet.h
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     hayeswang@realtek.com, hkallweit1@gmail.com, tremyfr@gmail.com
Date:   Thu, 26 Nov 2020 15:59:37 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I was looking at usbnet_get_link_ksettings() and it seems in hindsight
that the idea it rests upon makes an assumption about the hardware
that was at the time it was introduced was often true, but today
isn't.

struct usbnet contains a member struct mii_if_info. Why? That makes
a pretty strong assumption about the hardware. Inparticular I see
no way to sanely implement mdio_read() and mdio_write() on hardware
this assumption does not fit.

On this hardware usbnet_get_link_ksettings() does not do its job.
So what is to be done? Technically it is a layering violation. Yet
it is obviously useful to many drivers?
Suggestions?

	Regards
		Oliver


