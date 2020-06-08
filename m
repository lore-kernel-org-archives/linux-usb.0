Return-Path: <SRS0=d9UH=7V=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A158C433E0
	for <linux-usb@archiver.kernel.org>; Mon,  8 Jun 2020 09:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C8932072F
	for <linux-usb@archiver.kernel.org>; Mon,  8 Jun 2020 09:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgFHJOI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Jun 2020 05:14:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:59950 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729203AbgFHJOH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 05:14:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E975FAD65;
        Mon,  8 Jun 2020 09:14:09 +0000 (UTC)
Message-ID: <1591607631.24937.3.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 08 Jun 2020 11:13:51 +0200
In-Reply-To: <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
         <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
         <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
         <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 05.06.2020, 10:09 +0000 schrieb Joakim Tjernlund:

> I can see that when I open the tty, a USB read is performed and then echoed back.
> Should an open really do that?

Yes. The tty interface does not pass read(2) down to the driver.

> If so, an flag to open(2), telling it to drop the input buffer would be really handy.

That actually looks like an unavoidable race condition to me.
How would you tell the difference between old data and newly
arriving data?

	Regards
		Oliver

