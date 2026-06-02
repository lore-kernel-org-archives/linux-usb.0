Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67356306752
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432349; cv=none; b=kAu7LkSdnniZlTo5fVEH67nN/VCLLLWSEUkafwpWTEtqHo7pZls+2V9+2qyetnhbibd5G3Cw39lw5goe3mQi/9ZMf5bcQeAulHNbV4wXMibHMb3N+ek9pgn5McJ6Fd3W3FwSUPPdjOTFUnF2wR2APpr8g7gUaPd+SJRefwsMK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432349; c=relaxed/simple;
	bh=IQM1gkDvgjk9K/1BPg+Xwwwoxf17pzOJr2AbFuiABZM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=u6axmawEfV/sJn4QdYuN5pgdPOw7+9lNm72HssJ58Zvqr2gWWLq4/K856nQ89+09k24tBd4XHPkZgz+PHvgTua3gAkScHrE79WUe0uUPOWR5nZ4g+uLoi6jBJZFyK1ncbrpYw2vMdL4zWBs/t9LtqEAMZ8kr5NCQ1hAYDB0p5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69e37d24cb1so1959896eaf.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 13:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432347; x=1781037147;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eu28fDKHP0i3FLR3qpRQZ+i663p6RmIJHWLXuHJH5kE=;
        b=S1o68aFrdOQAZQA87QqMBOVGg+dplZGDP4o6l1UqT/ecvEPk+fLrlzGb2r/5fRziOT
         qEGHGMjuRB4E2Qjvi4SUm64EW1bj4ye2S6Nja/DLPCUmMT1VVGoWAskO9TRxnHobnmL/
         BeqQFhlxYp9y1YJk6gBe5YqkgXGM2GXz26/8F6CxcrFfctuuFMkZwdTrY0aKStJ4bpVx
         pDjxwP/GgSbZWLgoXWp2bp9h4C70dEowJrx15Gwq6hAmARGjTyxTG5sqV3JtqcrnFvbI
         KyHqQELpH6YvZ31D5dgeNTBX9IhLMkAurfLDjzNm60SaJXCiKKq1QK/nSDa+Q1zPFanD
         nmdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9esv7jO2w+fJJBNm0R4408I8QT/ufejfzqYXjxhBK7tQf7Nx0fMNkN7hpwqbeK8a7SECBzNcwyz4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOJTgf5PWwCsDLJj8w5kt3mp5Tj6vMw9aI6LtjLY4hgG4NmwD
	yo3bjSfupMoc5MtFlQEZ9RXWQeo+C3BFcciDi5PkVzxrAgQLSbZXQUtCvR5FUIsxLKuRNz3IoLE
	6voM/KR01Pk5t8Y4lXNYUz2dY4SCtd0V8eSsafnKJueXNwgaFY3MSBLFAp4c=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:210a:b0:69e:2c79:26d6 with SMTP id
 006d021491bc7-69e48b49ec8mr173984eaf.1.1780432347701; Tue, 02 Jun 2026
 13:32:27 -0700 (PDT)
Date: Tue, 02 Jun 2026 13:32:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1f3ddb.7b89b7e1.205e57.000a.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jun 2026)
From: syzbot <syzbot+list4790484fe82e35fffc4a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 2 were fixed.
In total, 63 issues are still open and 423 have already been fixed.
There are also 19 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3774    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<2>  1812    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<3>  1442    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<4>  1064    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<5>  866     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<6>  403     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<7>  345     No    KASAN: slab-use-after-free Read in __usb_hcd_giveback_urb (2)
                   https://syzkaller.appspot.com/bug?extid=7f5e98b052c766f47f68
<8>  341     Yes   INFO: task hung in dvb_usb_i2c_exit
                   https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
<9>  201     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<10> 121     Yes   INFO: task hung in usbdev_release (2)
                   https://syzkaller.appspot.com/bug?extid=bfa320b67fcbe2583c6f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
