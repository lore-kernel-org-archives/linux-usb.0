Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F734EEF7
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846749; cv=none; b=huRLx8gUMEE28UvJHKhrhRSLBFKdQfhqISbggdajYxZqSH9zoVa/NUBsclR9RuEJH0SUkh+MdVd77HnfCb8Q1G0WmbHzRvknmt+qaUF/3VBkGZdlfSAtys6IgI9icg4an06gu8ngFGdTRI6qldb9YK9QbDf3xaAqkfwH6R72s8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846749; c=relaxed/simple;
	bh=l1aFV/A6Qhpcza505u0PxEcKR/F+asqh89DihBUZwv4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CahvAnJPEHTrmPK+N6B2xD3tNyIPhN5gB9ultyYgE+pOPyekCBNyiyG9vFPA5dx+fjunqNSTH3ig+nNIl3qQoM3G9s01W6VCIaUE9A3amR0MIHLoA6vLtVXuUGVoaZPSWzR1CGXABXnq9fdPLSXA/ONBhT5G77ySDKQIivWArak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso4360967b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 05:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846745; x=1786451545;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjvGbnOLz8ZneglR6x71qG8zqn7jpWodjFhnIZIzbQE=;
        b=XjEQnl0/USu4HgpvTmWaWPHioZtmtWkcS1WBNP04y/3Ng9jBR9tk2CwSBzMQ9bVfat
         BvmORZCy1XFp1biei5d8NNNgI99/KMPuD7TBVXSOe8e2XpJ8Yi4hzQDxuBOb3Ajg2FHi
         ffTaH+Ukm4oaimSAUeNOZuE1uRHxyjFt8JUzcC/hL9/58fYh8kWViyZO+yyUUDWUhKyr
         UtkYDyQAmQqIcTnFIsOxNIgQFm35nrMYAyIJsqKv3g0rAZ3KFpwweo2NjIcoR62d1sQj
         WVHbr10nrrHsS/IXXpiX4Li26TJQYP3Q/KS71PZaQG5k5GogUqJw34c1hbbgII9ZkOMa
         9/Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrhxmDysOZM/MylMYqImOJCTkRhOk3hthuYYQ+kjGNlmYN5md3ColHW79zKkVQ+FrJuwqq5pdkNvk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrba1UEi9kq5FY52MVgxjC0O1meFk6ODVG5y6WyB0v9Gq/Ecvs
	veA9JaRf+sLBigyKhLNN8T6aW1ubJxYQk+OzP7aUV+Vdg4qjalSKJPdh8DC31Gx9rSUkITaypk3
	ZUwkqsr3gsxouKa0OzYh/qBqIzERHfAab7ynm33SeCqb/CL7YC1R63IlDYvs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c85:b0:495:f8a6:81f8 with SMTP id
 5614622812f47-4af5e29cd37mr22739944b6e.13.1785846745127; Tue, 04 Aug 2026
 05:32:25 -0700 (PDT)
Date: Tue, 04 Aug 2026 05:32:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a71dbd9.13623e66.bdc14.0014.GAE@google.com>
Subject: [syzbot] Monthly usb report (Aug 2026)
From: syzbot <syzbot+list1b8ceb72fda88d317740@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 34 new issues were detected and 1 were fixed.
In total, 87 issues are still open and 427 have already been fixed.
There are also 38 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2570    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<2>  1156    Yes   WARNING in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
<3>  963     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<4>  440     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<5>  399     Yes   INFO: task hung in dvb_usb_i2c_exit
                   https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
<6>  366     No    KASAN: slab-use-after-free Read in __usb_hcd_giveback_urb (2)
                   https://syzkaller.appspot.com/bug?extid=7f5e98b052c766f47f68
<7>  256     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<8>  130     Yes   INFO: task hung in usbdev_release (2)
                   https://syzkaller.appspot.com/bug?extid=bfa320b67fcbe2583c6f
<9>  105     Yes   KASAN: stack-out-of-bounds Write in carl9170_handle_command_response
                   https://syzkaller.appspot.com/bug?extid=5c1ca6ccaa1215781cac
<10> 74      Yes   KASAN: slab-use-after-free Read in uea_upload_pre_firmware
                   https://syzkaller.appspot.com/bug?extid=3d45d763d18796f97412

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
