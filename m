Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939632;
	b=XjDHelvmzXXz3Vg1fZ7DgH7V1tpIKwZQ1BKhTL7Bpo4yGXQKjZL1lEC2wMY+72n1cx7W
	 yaejXqg8D6UuoK7KJdSyVQtRJTdaJPjyYbBjPNWoBH9RP+MNn9vt997/E6Rodg9TBi+Pi
	 3NSvnHrLS3K8a8f3E/s5qLTZBZlxWvwrvwnhAf4+myrO9b23sNkF9SqwFL5rqLL8gECth
	 V++o2gwdHsAarICGtvOrVvsGY+qOGAOF34Rj4VhszAaj2+UnnTNlCYfpOMfv7dHvMzEMt
	 J0CjNuuuB5R4n6EMxti/VDQpd/SjYIVX/aiPg4gtShleB8q1Yt52bXLy2i5+Rpsu7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939632;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=mcXyI5nT/wZQx28ZUALYNvOJlhVMFjY33zSG6Gck+70=;
	b=xnjMWut7FkseYdLp50jlT3yJDXWJ09jZZD/ycWXj1quT/X1o9bz6x5JoKiW4ilfScf0P
	 RnVUxGjR/Czsn98hsv1+WyZ6im2kfaujJzaBy2hUdP6MzjToW055sIwRkFdh8HTqPGKxd
	 gFbaxWn1Sj/FW33mFEpY4j9mvwf+UE2r0ixL5zhtpio53xdjg0WnRhjtRubRJEnxd4ktC
	 LLhDBSsaAtDckBTgPubS8cQPeDYVY6h6VrLn9EJaFvaUzmHafi5hrUXet87glrRsPjnP5
	 nQc7Ui6pYc1HMaLxezq6dqQhsNHper/QoygtFwf/dK78uZQZSRjwa8eu/Qr0brYTXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB7606D809
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 04:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBB7606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-469debb526fso177198fac.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 20:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939630; x=1794544430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcXyI5nT/wZQx28ZUALYNvOJlhVMFjY33zSG6Gck+70=;
        b=hl/xWUu0bUZlAKwoEuKxz08Y1I6nzrHo2w2o8PPg+7rJ9PiSKIjfhlLCC9OqlF8seN
         3qrxMEwQT0n0bQHLbYCHa6v8BL39Txx5CaPVOXzk2NJ3aTHpVcRB5ljwwVNaxfBnoK/b
         C53U8PcIsIRq6FW8r0yIhO8xl70uZwdEWt12N6mr0Z/mYnLMtCwQ4RehL76rnlrYHZx8
         FhTNNyoujkjc3Gmq5YAnQalFAGq46F7B2W3SweN9MD609RPRqlTFe055OvzUsHw/k/Tq
         +BFSiJLkRNY3b4y+yH0oSOBaaSJhnDO4Jr1Zs6vyoukGy7F2x+0aqTWTNdlCoiKuWaA1
         t8wA==
X-Forwarded-Encrypted: i=1; AKwUvBxyYHHrX9g5DQw3+VAQh1aMFMOQhxmWLK7C5B53trin8lmoFhnP7SW7t0ZFWjaLhVN01/jnfFVMpXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BTpVYyj8HpXGVM0zmZ8+/cAv/p5zo3ef5tiiuWYUGPCt7bUed
	A1eD1mbcBhV3UtHiQYQozfHvPAl9Rg3+SvNUJslOGVawLv33Aq7bSaqbV1/olHro6t3NG8ekvuO
	h84HayQoypwiHleNaAByLDocY/8o4Fzma4FSlAezd4L2NpfNmqxNtSUSbvSQ=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2228:b0:4d6:90d3:e185 with SMTP id
 5614622812f47-567e16a6786mr969352b6e.46.1793939630711; Thu, 05 Nov 2026
 20:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ae.02d3f859.2829d1.0006.GAE@google.com>
Subject: [syzbot] Monthly usb report (Nov 2026)
From: syzbot <syzbot+list44b027de7df2fb008682@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 8 new issues were detected and 3 were fixed.
In total, 112 issues are still open and 475 have already been fixed.
There are also 40 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7712    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  3885    Yes   INFO: trying to register non-static key in __vb2_queue_cancel
                   https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
<3>  3669    Yes   WARNING in usb_ep_enable
                   https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
<4>  2714    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<5>  2599    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<6>  1098    Yes   INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<7>  639     Yes   KASAN: global-out-of-bounds Read in usb_copy_descriptors
                   https://syzkaller.appspot.com/bug?extid=debc5c305403f180c01c
<8>  478     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
<9>  452     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<10> 349     Yes   possible deadlock in mdc800_device_open
                   https://syzkaller.appspot.com/bug?extid=023b30ebfe0dc4bcfafe

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
