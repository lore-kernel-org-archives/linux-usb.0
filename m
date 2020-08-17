Return-Path: <SRS0=DJv7=B3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA8DC433E3
	for <linux-usb@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B277C207DE
	for <linux-usb@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597659715;
	bh=ovtTW2fCfcjd32QufVbUkaQHW26qGINnQJXinpGHiU8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=qSDJoLMP0kdrvMOLd5vxRxRKaM+c6mExxLBwBVKUYl052rdv4asa5ySJ0lyoGGX1c
	 7Ysv2zkW0M7uS5k6pw/YbJ75fNw9RGLo0owes/HKm2q9pZV7ZjrQjEiOuUZJ9o/Ztw
	 SqCO0GrjMPnXZ7kZ2Ap/5YEf0q3NHw9/BmREEoCw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgHQKVp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 17 Aug 2020 06:21:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHQKVo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 06:21:44 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 004132078A;
        Mon, 17 Aug 2020 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597659704;
        bh=ovtTW2fCfcjd32QufVbUkaQHW26qGINnQJXinpGHiU8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=zgDDLsZChMNRGx0G1LVTQMnzzPd6AUnV6kVFSIf1/2Ru0+ZBP5khL9w7417w94J0s
         bdmHmULUaaVykYETE0nrGpeGWYEUm6L3Nkbeyn2xBy3USAG0BBdiLfPUiNM1in1Pv9
         qkPUI9iYQZHpf116y4niqlpZwIsadmypTk/nchtM=
Date:   Mon, 17 Aug 2020 12:21:41 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Peilin Ye <yepeilin.cs@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
In-Reply-To: <20200729113712.8097-1-yepeilin.cs@gmail.com>
Message-ID: <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com> <20200729113712.8097-1-yepeilin.cs@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 29 Jul 2020, Peilin Ye wrote:

> `uref->usage_index` is not always being properly checked, causing
> hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> 
> Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
>       Dan Carpenter <dan.carpenter@oracle.com>)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

