Return-Path: <SRS0=Pmb0=WL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC96C3A589
	for <linux-usb@archiver.kernel.org>; Thu, 15 Aug 2019 13:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37FA02084D
	for <linux-usb@archiver.kernel.org>; Thu, 15 Aug 2019 13:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732166AbfHONbb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Aug 2019 09:31:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47740 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730304AbfHONbb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 09:31:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 62C3FAF2D;
        Thu, 15 Aug 2019 13:31:30 +0000 (UTC)
Message-ID: <1565875886.5780.7.camel@suse.com>
Subject: Re: divide error in usbtmc_generic_read
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        steve_bayless@keysight.com, gregkh@linuxfoundation.org,
        guido.kiener@rohde-schwarz.com, linux-usb@vger.kernel.org
Date:   Thu, 15 Aug 2019 15:31:26 +0200
In-Reply-To: <000000000000a59094059013dd63@google.com>
References: <000000000000a59094059013dd63@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 06:38 -0700 schrieb syzbot:
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> KASAN: use-after-free Read in usbtmc_disconnect

I am afraid that is a difficiency in KASAN that should be fixed.
Is the class of the error compared if I leave in more of the
original bug report? Actually the ID is still there, so it really
should return an inconclusive in these cases.

	Regards
		Oliver

