Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E0394EBA
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232424; cv=none; b=D+T/iG6KXoR9rcPQMZ8ZTNPilCGHChXuXlE1VzOHTkb9DiK3NpDkMYSSAkfBr27NI9oamzqoVZcfaFmzvZnj0kNdUjHJIrfW5sFib5xygO9m5IKyfd63BdJmo5PAMMvhDixWI8gPbxEe8+MM075DS8wNgNRLbMzi1mZMvZmnupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232424; c=relaxed/simple;
	bh=oa3kk4KTEaDRoze+xs/Mi1MlNz15pd6kjVnXAdFXQAQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Tsu4keFV+IAlI4GhDPanRQAroNMQUbqI5/SH5wqhK5XD+V6PxVM+vb6js8HDfsJFAYNiOOIfsXY+S15EFXxoG+7nZGiA36rAcCYJiuX5ZfScWDw8c8V3pYnvlPyN1WdPD6UNvoSBq1de4KSSmU88dMb03LEdJtoHnTRRyfE90T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3292452b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 13:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232417; x=1791837217;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UudK6LacjO/O8vH7bYAzLel4l6J+dKtxJHj0zP5o4vc=;
        b=NW26LDLfm51zzp6gnfiSfvv8ju3t31HutjJesv/hTg3Frqh/9blEzCorBa5BBSCGsj
         wqgGNrjL6672/J9nihu0K6PBncd+IE3PgwHXw3Lz8IkXWZX47UEMF1+jjGhTeD1sAe4T
         dro25fYhjxeG7ZDl6rTsEum6SWsrc2K65rxNQSKUHC1jfNOOLhUx7j/iPHItlAoy/DDj
         lMePrWVuyExj0MNi16D0mf65P6nsa/VPg9B5W711Lvd8I6cXKtVkCG93bHXYjk3FgoIk
         sXccfcGMVVvuXalK0QYFKshLb3In/3azKF2gH+13wndDmGd29K/It2V/jhrTLnXf95Q7
         jrjg==
X-Forwarded-Encrypted: i=1; AKwUvBy028T4fW7FRN/+gGOgheiOQdF+Cwt1wgwahc2+v9pzGo4K3rWyqs1YdSFxBBaJLieXnMYRFRAdqqE=@vger.kernel.org
X-Gm-Message-State: AFuF++k47ZC5jJ0TXYX7zW+Hd/LBqYvFLGffyD+krwYNadyeZK+Hri4M
	eKeK6wqR23sNgAyGJICsDRTQwTZxi0WRNW3oUSKs1TkROmLPoeR3qiMo9EHTkQ//jVuVSA86wXO
	+HLdcgl0/KxodpCahXLD3eZEKg3+cxvuJnb8KbjUBd2U3vBtId3tYFdCeu3w=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d0:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-4f67aa155f4mr9280693b6e.36.1791232417564; Mon, 05 Oct 2026
 13:33:37 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:33:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac409a1.ae2c267a.265a6c.0008.GAE@google.com>
Subject: [syzbot] Monthly usb report (Oct 2026)
From: syzbot <syzbot+list6ad4d3ed88bfd4c0876a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 8 new issues were detected and 3 were fixed.
In total, 115 issues are still open and 460 have already been fixed.
There are also 45 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7662    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<2>  3850    Yes   INFO: trying to register non-static key in __vb2_queue_cancel
                   https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
<3>  2498    Yes   WARNING in usb_ep_enable
                   https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
<4>  1840    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<5>  1815    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<6>  1061    Yes   INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<7>  771     Yes   WARNING: ODEBUG bug in corsair_remove
                   https://syzkaller.appspot.com/bug?extid=0a031a76585d1c7e737d
<8>  449     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<9>  380     No    KASAN: slab-use-after-free Read in __usb_hcd_giveback_urb (2)
                   https://syzkaller.appspot.com/bug?extid=7f5e98b052c766f47f68
<10> 307     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
