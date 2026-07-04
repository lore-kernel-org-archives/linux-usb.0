Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1BB38C2AA
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783139550; cv=none; b=SxFrGvnuX6e/fZbhB3rEUoOD+d2syRicSjPVDYEZnI1z1kmf1+3G5rEJGDmVPgR9rZtuLu1zvCJjvEbGclY7QZmED/hTIR6HaaNakRGOCnnXoO5YGq1cqP350VW0OwZbZ4YzSsbctkje3eMeoxWFJdDgB2tY04/SxoI0DWN+qVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783139550; c=relaxed/simple;
	bh=2SM7s+1tgT7PJwByrkssw5540GHGTRAzlDSqcRG+clM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eh1gNcgkRThtMpIL9N5r2gP1hG5Cae5ARJgyGTJ71Nm/PectlXbKSMcbC6t5mdhgAyPi0da5DISII6/V8CjvtB3gygae+pyY/GVGXXLXNZaNqsyL1OtHqRYn0bwNmPLJ77NWHAdTFS/HxCGO/YrrmvSV5EZBvawMkI5eoNqhPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a0f261aeb6so1494092eaf.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 21:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783139544; x=1783744344;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h04ywsYjfLxdscdCsUauEsTD9WLim3pb44XpVbxYh2s=;
        b=lXD75KYnQP7KwY/c0JqcXgnM5fKAKzKG0P3qz8VQg5USxVzf2VNUUCM7mVyIATTD4o
         68uaJcDtIrSvPv8/d2+y4VPDKUUdeb5eUJ26SMIexkLHLaKg8/tnA0Qzf4BRKzryg3Sr
         dCVJG+8QXkA6hQD0wmZceThS1T+BbRWjiJVkeOjRmOMKTSeJyqQYADhp1cMrUD26JNpc
         YRs2EX7rO4pbx3vkj2fpS3sXJQWcbCZYOjRPiZf4BUv+ptCz8mqLYzh1my5gwTbpLfjO
         nO5OAydkUKcLXQcIb/OqPFJBYZnx9LuwniLvhm5O/tpHO/KMjTz5LdcL8AmUO84SXRFv
         cBfQ==
X-Forwarded-Encrypted: i=1; AFNElJ858LJJbhy8XolUgbWhmsp6weNuz01s0jLiuUKqMgbbm+bfhaDXA/l1131i+tGvbIrqOBfJaGwZZHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvoPDj704XSzFNYIT5ZwGo8RwVAQBWcOOZmpvQoqRtSVCjcf7
	ux1PhrWvzyl5dsrzzim3VPD0zBMNvxMRG90rMsMfySPPaH7vyMsJx7JkzEdpEz7AjXH3Z5+ZJki
	AG+0YgiuPyYG1GvUZfWKbGcNIVuPYm2+ZV88rSjBdhH+BRtCffNo/1n6M4KA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200d:b0:6a1:1213:3b69 with SMTP id
 006d021491bc7-6a32f552e1dmr1301001eaf.41.1783139543941; Fri, 03 Jul 2026
 21:32:23 -0700 (PDT)
Date: Fri, 03 Jul 2026 21:32:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a488cd7.b42ede87.8bd1.0007.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jul 2026)
From: syzbot <syzbot+listd9e0bfdbe11a44855a44@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 0 were fixed.
In total, 63 issues are still open and 425 have already been fixed.
There are also 19 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2062    Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<2>  1812    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<3>  938     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<4>  432     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<5>  381     Yes   INFO: task hung in dvb_usb_i2c_exit
                   https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
<6>  226     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<7>  126     Yes   INFO: task hung in usbdev_release (2)
                   https://syzkaller.appspot.com/bug?extid=bfa320b67fcbe2583c6f
<8>  88      Yes   general protection fault in dummy_timer (2)
                   https://syzkaller.appspot.com/bug?extid=faf3a6cf579fc65591ca
<9>  35      Yes   WARNING in pvr2_send_request_ex/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=20fef510634faf733060
<10> 16      Yes   BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
                   https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
