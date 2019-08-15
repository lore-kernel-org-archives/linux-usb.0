Return-Path: <SRS0=Pmb0=WL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9310C31E40
	for <linux-usb@archiver.kernel.org>; Thu, 15 Aug 2019 10:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A532A21744
	for <linux-usb@archiver.kernel.org>; Thu, 15 Aug 2019 10:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbfHOKze (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Aug 2019 06:55:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:54434 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731194AbfHOKze (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 06:55:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6CFF6ADCB;
        Thu, 15 Aug 2019 10:55:33 +0000 (UTC)
Message-ID: <1565866530.5780.4.camel@suse.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results
 in memory corruption
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonathan Bell <jonathan@raspberrypi.org>, linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>
Date:   Thu, 15 Aug 2019 12:55:30 +0200
In-Reply-To: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 16:59 +0100 schrieb Jonathan Bell:
> As reported by one of our users here:
> https://github.com/raspberrypi/linux/issues/3148
> 
> There is a bug when the dwc2 core receives USB data packets that are
> between 1 and 4 bytes in length - 4 bytes are always written to memory
> where the non-packet bytes are garbage.

Hi,

in which function does that happen? If your buffer cannot handle 4
bytes I cannot see how it copes with teh DMA rules.

	Regards
		Oliver

