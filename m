Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418B843B4B5
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974128; cv=none; b=uvjs3bT6PHW8/r4+7XlYqsZaKpG/c3zozpFnJTw9kN7+T2v8dcfKayAB/ZhxJgCEFuClYatioCZeJRGbSYlfZcyE99jgwz6utyd0TPUpgKiU6Xr0z3jF0qPG+ZoDik/3pEKgjyq+/dVMotg0NiyZCitMrENBKwkhKR5dM3fve9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974128; c=relaxed/simple;
	bh=aX6C4I6qSjoQMxeJ+OPzLeCTstwwhUCCr4q0NmAXO+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aZQXn9s4pGVHbvLMV54cLd9nHQXf/qegLF8ttINi+WWjfIdDK4OVW/S7AwnJX4kiFxiJXhNm03ynA2HCZVIsBP+MxhQUgWHr1QHnufOtJyvbTShoEKwYbQOMcFCXChVT22M42aoxN+SD4JYHdBUJH5cgNFl2HfdF4VcA+ItF2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6a8c61deso2716230a34.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974123; x=1787578923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OqqhA80wtcU3IsPjUZveXdR6cUhDI1A/Qh9dqHqO8Q=;
        b=ZFH11gTaoJynGIus5AhzFyABMzKCL9TC6ENrn+y1I74iW6BG8v0Js88ONuwSg7YD75
         NhGBzeAlB8CXh99T6+Q4jzEqMYnruy0ZD7RCk90AzSpzQ5JvzKGk8f+V+luxtt3Um/T3
         GsBMMDYQgnmLXGh5iCcfCUwiYcbK3IjZHblDNEsxLVaCBChCOVcUPj1/OMcbD3Ot+Mol
         NdqXK5lI9BCio8NsQY339pJuuz89TYD7W9P2eScH47VxK6423nsgbL/VOtc6fo25oeAe
         wJYGBML4O70vwHqbZQZGj7nE3TRKY4sOnSlglYhFqJSRB1lxQIzhqffevuirZhwHQR9t
         XHMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9AyL8eV1ylEJLCajmd9D6kk/iCZbuyh8QysN0TOs8EzAVf/KmtCjcfF85uyPVxAIpNo4qnBcpETw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGniRxWDIiyfMPDD9hMmDu7HS8utJQvoc6aOvvmevPCTLnZTr
	Jt9lWw0q6nYHgSDD4pa9OfeAMtUbNk/AtEqJ2En4K8IzXTRxMVm5LEoUlCuI16PtPVKpUIGIMBz
	1Gjffrmh3ntHYvTIiEtik/gxxXI3liLuwf+hNd04pxrtSAAtWtfVkSilocY4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f07:b0:6ae:55f6:2cdb with SMTP id
 006d021491bc7-6b0d5fca98bmr22016036eaf.1.1786974123322; Mon, 17 Aug 2026
 06:42:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 06:42:03 -0700
In-Reply-To: <6a6bfa43.1b55b669.19788.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
From: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, brauner@kernel.org, 
	gregkh@linuxfoundation.org, io-uring@vger.kernel.org, jack@suse.cz, 
	kartikey406@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mjguzik@gmail.com, nogikh@google.com, 
	stern@rowland.harvard.edu, syzbot@kernel.org, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, 
	syzkaller-upstream-moderation@googlegroups.com, torvalds@ppc970.osdl.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit aa00f67adc2c0d6439f81b5a81ff181377c47a7e
Author: Jens Axboe <axboe@kernel.dk>
Date:   Tue Oct 22 19:47:00 2024 +0000

    io_uring: add support for fixed wait regions

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10e60679580000
start commit:   9a143525f62b Merge tag 'ata-7.2-rc7' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12e60679580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14e60679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120defb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16323fb9580000

Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Fixes: aa00f67adc2c ("io_uring: add support for fixed wait regions")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
