Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9F3385BC
	for <linux-usb@vger.kernel.org>; Sat,  2 May 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777725155; cv=none; b=Lr8YWCVvSYnZ2zaJGnp4ah6zwyG842EJ+9aRUfn6TlR5avKr0pN62O+PX9CnfE/yriil3+ke3qCUh1I67Ih+vizvGBDBIBM8SH2NtAW36FtWrRs2+y1+zGqrxi5MWkViWj5eiu3MwK/GEq35NH114bAG835P2eww2v2K3S2sh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777725155; c=relaxed/simple;
	bh=dLtcL0U8y0o/UZS5ZBvDnP7Da03bYoKVZx9tntzBcLg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ativ+nYJOM1/j8PJxdeW/DK/UlZG+BFsTxo/4An7UtIj07ErDKXsVXxsBRUBAqYKK8rbEOstDK90qhmYPV0oOF9bEB8+jjejqX/Wx0s0ZSoFK+11gb4CiufL3aYNJFOmhzQoR5matyKicJ7kObiFk4GZWBOJhtPkVbMVXiAnBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-42c0e460e4bso6404554fac.1
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 05:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777725153; x=1778329953;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/cPS3NtZ/sfmXyCPW/mI0OSZdz+qY/Rd+3u0uTHr0o=;
        b=GdBvyZiNhqPjewv7mtomfACT4u1t/yCYVon4GnP09PVXp3mu0T/w+MlYVpdrBAC0Ek
         N//pK7mZpwvWEAXUkSsORYYrDGE2Uq7eUXxno2XWOOUrumAV/Fa99jnyz7hG+dTdxAe8
         TCDPbPQquqIJJ5E8npJJrt+HI1ic1mIydOaXXvL37SK+tFqQLnmHLQtBaJQ7TiGWxAd6
         plAo3vn1yHE4i6Wu0szQ3AY/1iw0JcGfZQTYfkjzCwt9WI9VHte7ZdplmtEjQXK41Syl
         WkovAUJwKDibNCM66IUuIrak4qfMDMEzlma76nelVQ7yUPwD3gZyPLxadG+L07HAhQfm
         qAhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WcBaTqS9nDi5sM1D5k2Q33nuvhI2UuapKLSzkZ/yJWOc1JePN46y8GZskFZX84WiKgT/vX2kTCD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9T4AlLGz/JsYG20WGERiolIPfPDpby8Jh6Vmo/5FDsxCIj6S1
	giti1U0slJKSX4EOkp4eB5fPp7l5swus1zLrzCXAs7bqILbe1aaDzN9qMpPXVbETekDW9HHtDTX
	rGH25Yrlo8gZaABagMaCUAZ47iBT20EQK/j6oudlrWoVkJMn96bOGJ4tripc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1352:b0:67e:1c67:ebb8 with SMTP id
 006d021491bc7-69697d6ab0amr1260003eaf.50.1777725153102; Sat, 02 May 2026
 05:32:33 -0700 (PDT)
Date: Sat, 02 May 2026 05:32:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f5eee1.050a0220.3cbe47.001b.GAE@google.com>
Subject: [syzbot] Monthly usb report (May 2026)
From: syzbot <syzbot+listc9ccb76f5ea0f19f24e9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 2 were fixed.
In total, 84 issues are still open and 421 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  12784   Yes   INFO: task hung in lbs_remove_card
                   https://syzkaller.appspot.com/bug?extid=c99d17aa44dbdba16ad2
<2>  3327    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<3>  2947    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<4>  1845    Yes   WARNING in igorplugusb_probe/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=5d7eece664082e0c5c1a
<5>  1766    No    KASAN: vmalloc-out-of-bounds Read in kcov_remote_start
                   https://syzkaller.appspot.com/bug?extid=8a173e13208949931dc7
<6>  1437    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<7>  1071    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<8>  1010    Yes   KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
                   https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
<9>  1005    Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<10> 858     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
