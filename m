Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985132B10F
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788691122; cv=none; b=ZYA5btWfrhK/btVjVZSjoJGqaTIJOi6fzm9m5rESbAqq2YV9OHjBpeek39TfxIdUAjVycEpHWV7/copr7jXxN2kAbUclwt/pGgcKRQu0GSbzdic+gEmG/p/whWHhCJ9ukxilIjcS8PF++7mM3O1bjXI2cVM9p9qhIDXRYN3tFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788691122; c=relaxed/simple;
	bh=2JPgelReLFX/RXbo9l4l2GV6AdL7jOIUB3/tTj4P8KY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGT9SUL1iOnS9xddtarY0cYMwO2zOcYofR9lRHesjuztwIS7L+wBVSd9aD8kVrOof98A+pkoqnR1U9Td3oyHOhYhFOZSc+MwKdy/A4DfOQRA9tMXMO+4dRFxULAf3PayeQevdlDJ6BAihY1wFSWY5aenV/NrWxS4ehUywvDXQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWB5u6JB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWB5u6JB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso18326405e9.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788691119; x=1789295919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4UOEZmcW36zwGnk1RNeR2nFzPAHZvMeAgomKSEwNbY=;
        b=gWB5u6JBBpj7zQ9NozWqjaMuYHILMzR25qrAAuUp5bV+DloZTRNxqNj0zph9zrhkz7
         qbW1hEfNl08MM7eCUoMsbDcrrwKn6raTAhMl0E+tAboKD+bGotEZM8HdGZMhfjawVEe5
         Q9/Q3lR9CgU+E+l+fVFn7pHyFZMNIEJrlyvE+tTuu6EJ4CYPb+4xnEXwChu73hWalULt
         20L/djhU/UN410xvz4n+h9AWoIlk+xckds37O7kOlA8Kx1g6Zw+1pWhkSqWAUEpFg8Z0
         k3CqFAeC8L2AurkVaMtj9owCnMyfKPP4gprAnpT5NFXlPSixTzbmuj0guEvfSKexEPIT
         4XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788691119; x=1789295919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4UOEZmcW36zwGnk1RNeR2nFzPAHZvMeAgomKSEwNbY=;
        b=RrE1PIjhgFdUULcIskNietgtQwZ7Ar1jvGgjP3jaiMER79LPh9AHPq61WoVFuTONkc
         j5dGBD37q2UtRdcS9a61C9BJ4/xdhafE/oreU+JofoLXsNm62ErpiO1ADMw4Yff2Sz1T
         Il41q9GxwvJxG4zahd20youpRishdd0VW2/PJXbF/rfQVcboZl4j5uw4a5y4Ao5+Kw7M
         ZPf+KaEHRi1KQxL3leKNYxf3zasa2iFbTMqtI1xshK/K0OVllQCJbyQBRVBG5f/8tbGZ
         S2r0BPT4Xzmcd9dVbuXo+IkH+wx3IwayJT26mEGyD3VhdYeB52b5Oiain05feP/Unqal
         zcoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa23bGpYA3XVUCa5w9+rHxdsRCeyTBbvY0qpVwl+hXNLSsMkHdJZajin9cUizbNHzK4qIRwAwbYMA=@vger.kernel.org
X-Gm-Message-State: AFuF++kXghqGXPRV8+yLG0JlDRTdbqdLc8tKsDC5duHjyA/gf+5wlfDq
	3Lv0prae1Axz7PGhZJFMnTaCtSbF+D0sGjniYQ6F7Pct0m6heQzeVXUB
X-Gm-Gg: AYBFou1MBpNenVZEj3+q58qXM8MgvfDToH6MCKPaDk4TA6ct7/AHSPZQh/1l6025D/L
	cm12chIQ2nXl7tcd+dN6yA0Cxs4e8hE4IZIWCs12dhjq3+541IxBoJPFJaIeWE3AvbHOduykyDE
	jbIrXAp0imiuS/C2FmxwSKJvNhhU3OEeEwv+9uTY453SW9kLFjhvrMIJThDOGY2T69FMJrgrG8M
	kvKxN4aB5JRKMRXwBKAUpwATaiA9BT+ueBdgr3I+z6++ti0+i4E8MkBuUWj1Hnn3zFS9++1IIXT
	r/hz8nElyPY8eGeXLT4pnINRK9ckNlf+PzWbW3ybxtUGg9OVwKcVAmtQs8tykOXhrvbHc+gXRvh
	D/qVInXDJKhU1lHSC1jsTItLOpsU+nTkW6acGE5A0doeNJiSm64aFOPIi9cwZ6OMuKVEBLT92rZ
	TNmjFIM4iCySNErnUqrHmX08OCYA50ZEEVDfILmdCTIhnYVK87kDiwhAhvDBdOXKySwMwczA==
X-Received: by 2002:a05:600c:4505:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cf7fe607cmr154903365e9.2.1788691119515;
        Sun, 06 Sep 2026 03:38:39 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm300641045e9.7.2026.09.06.03.38.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Sep 2026 03:38:39 -0700 (PDT)
Date: Sun, 6 Sep 2026 12:38:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>,
 i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 shuah@kernel.org, syzkaller-bugs@googlegroups.com,
 valentina.manea.m@gmail.com, syzkaller@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
Message-ID: <20260906123835.56902ed7.michal.pecio@gmail.com>
In-Reply-To: <2026090536-numbness-enlisted-917e@gregkh>
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
	<6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
	<20260905104331.6d4288df.michal.pecio@gmail.com>
	<2026090536-numbness-enlisted-917e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote:
> On Sat, Sep 05, 2026 at 10:43:31AM +0200, Michal Pecio wrote:
> > On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:  
> > > syzbot has found a reproducer for the following issue on:
> > > 
> > > HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20260903
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=10adf4f9580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
> > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121c7215580000  
> > 
> > Who or what is coming up with these ideas and even commenting it?
> > 
> >     // Iterate platform devices
> >     dir = opendir("/sys/bus/platform/devices/");
> > 
> >     while ((ent = readdir(dir)) != NULL) {
> > 
> >         // Set driver override
> >         snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/driver_override", ent->d_name);
> >         fd = open(path, O_WRONLY);
> > 
> >         // Bind to vhci_hcd
> >         fd = open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRONLY);  
> 
> That will taint the kernel in newer releases, and syzbot has already
> been told not to do this, it's not "valid" at all.

What cought my attention is that Google apparently has some capability
(human, machine or otherwise) to understand how this repro works, and
yet they keep reporting this broken pattern.

It's just waste of time, including syzbot's own time.

Hence syzkaller@googlegroups.com in Cc, wonder if there is any truth in

> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.

Regards,
Michal
