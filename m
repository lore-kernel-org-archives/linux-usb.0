Return-Path: <SRS0=FqPF=ZN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E65C432C0
	for <linux-usb@archiver.kernel.org>; Thu, 21 Nov 2019 11:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48E7F2075E
	for <linux-usb@archiver.kernel.org>; Thu, 21 Nov 2019 11:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKULHg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Nov 2019 06:07:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:56098 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbfKULHg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 06:07:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3FC37B2B3;
        Thu, 21 Nov 2019 11:07:35 +0000 (UTC)
Message-ID: <1574334450.14298.53.camel@suse.com>
Subject: Re: INFO: task hung in wdm_flush
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        bjorn@mork.no, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Cc:     andreyknvl@google.com
Date:   Thu, 21 Nov 2019 12:07:30 +0100
In-Reply-To: <00000000000076092b0597cedce2@google.com>
References: <00000000000076092b0597cedce2@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 20.11.2019, 14:40 -0800 schrieb syzbot:
> Hello,
> 
> syzbot tried to test the proposed patch but build/boot failed:
> 
> failed to apply patch:
> checking file drivers/usb/class/cdc-wdm.c
> Hunk #1 FAILED at 587.
> Hunk #2 FAILED at 596.
> 2 out of 2 hunks FAILED

This is unexpected.
> 
> 
> 
> Tested on:
> 
> commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git

If I do a git am on the branch usb-fuzzer-usb-testing-2019.11.19,
the patch applies. Which branch do I need to backport to?

	Reagrds
		Oliver

