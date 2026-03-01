Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE5286D7D
	for <linux-usb@vger.kernel.org>; Sun,  1 Mar 2026 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346153; cv=none; b=S/Si9JAn7ADBwTuvRBFFXQO1HWm87+ESHCYyfTxoS/UJV56LQ/Q5ZDQIHkohnAEddvqigQA0K9m6B1ulujS9+pd9X5+vdGfzjPEsXxVdGLkVtrLSDbmFSEFDCz35lqZprvl0lDsJKty7HOsfNPC06XPOaOsOO952pcSQpQemrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346153; c=relaxed/simple;
	bh=spGUCmiK4pUf3x7l/ulh4b36jPDkAtOW+Vm0Wq22Ycc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=f7uQfui2/jsXjaV6a0RAWb4VJHqbYFHPvcEJIN/COCSr8JK3dC1EzYN4fxX6y32B/aAVdv2joeNM8NQBZg7RE8w9/uS9n0VL3+Fi+xGCatdVPVkCkyiSFqnobQrpZcAHk8W2OpbjFPdOxw2Yx24CuCU0AT6tMb9ZiXadr5n/xNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679c44ae7abso88598406eaf.1
        for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 22:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772346151; x=1772950951;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTqvGwRrEgZP0aDTqKDifd3G2AqaoNfo5cgh3uDMDYI=;
        b=i3sAk26YdnR/JnbwD5L0bbmcG1K9elRTfBrvu4H/JsxGoF5DzbFx8yxDROlQ1KzSyp
         2GR3nDWEs/CatY1Fo8IAb7OMEFBaFGhTHyJVm7804lB1Gi31Y6DoouUQ8MCKC8absI1r
         9I9F3oF7GO7mreIKFGOfyD/CzGnIei1IG9jr6Jq/MhS7qq03lkCOjFV6eRxY7FDrl/C0
         YLEYXhA5ziATDDkwIRvT4ZqRiExYO12tbGuc/9M/qW/jHdHb01NsME/Ckl/upKJ+O6Gd
         yvajv3C6EWFaDe0PDqEb5oT0hdNoaAFD3TK/QWPcFIez0eULFLqK+GBmaO6GggBT15nz
         jFBw==
X-Forwarded-Encrypted: i=1; AJvYcCUdWfdNgMspVOB3MUPH4VsRI0iHzw/IoXHfLKi8gq1J9GNam5Ros7sVHTVTU123y5Plxq0Mzo8lA+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTUJr1lkBGxvbSw2hxgDdOJZVtDcMq+EWtGw691wL4LeASId8
	0nGqvbimhRwXMcT+cLyUYybn6WdqnqLLxvbN747UUpeiB/Kje0gKSeHDiQfjpIpNyFtBIDgrfcy
	Vrv0o+UC8ucmVfzbQbu1+rhv0XmVmT62sf26jK9dqScCb6dV8ujGZrQ1NA4k=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:985:b0:679:f3c6:6f26 with SMTP id
 006d021491bc7-679f3c67070mr7088328eaf.38.1772346151274; Sat, 28 Feb 2026
 22:22:31 -0800 (PST)
Date: Sat, 28 Feb 2026 22:22:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a3db27.050a0220.3a55be.0052.GAE@google.com>
Subject: [syzbot] Monthly usb report (Mar 2026)
From: syzbot <syzbot+list2ca2bc194bf5b27fd5ca@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 0 were fixed.
In total, 83 issues are still open and 413 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7466    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  5143    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  3627    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  2462    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  2456    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<6>  2169    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<7>  1865    Yes   WARNING in usb_tx_block/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=355c68b459d1d96c4d06
<8>  1417    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<9>  1403    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<10> 1051    No    KASAN: vmalloc-out-of-bounds Read in kcov_remote_start
                   https://syzkaller.appspot.com/bug?extid=8a173e13208949931dc7

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
