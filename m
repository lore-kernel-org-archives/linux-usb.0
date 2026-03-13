Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAD214A64
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 21:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773437284; cv=none; b=DpF8b8EF0KiY/OXDGcq+mLy1AH4bOBn6R+e6H8sAxgWpE1S0cQekefOk5X+QoqLpSktzcBrU7/0NgCGze6oqk/qtXLhemRp55AFk8jMYLKneEEY0s5WQQ5bYRQl0CpOlOdi1I6jsKpZSZtMSlYCM8xoOJODlgLT9m1xk9x9pZvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773437284; c=relaxed/simple;
	bh=jvwl6AWqxIfNcDywrkjfzlJl4hB1XGa2aCidrRDgluY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Bsv2Qx/JBvz5smo3EFjEkHhq09gP/K+emE4XwzY/XCSFUqXUubf4wlEfKwljSJLRtQjvuwmHgXODcdWRMZOpgM+bJxuZXILS3OSFnqS0Yd3YFkSyB2OOzt3uwb1ljo/vkKr5YQYJKNFV84IARHqeafOXPQF3CCOAG3qIWU04uds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bb77eb9f8so40579731eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 14:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773437282; x=1774042082;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zb9BuXWt4I2DxcSORIwAmnX4I8otGfaTIlfFOvq81Ms=;
        b=BnWJEiay5eHEtK185Wfe1L0XCyc/4KzWhqe/YiQOGT/UBMyVKUpaYPTt9VXpXzWoEO
         7v07tyG4LnZhvtks618HHAcy9/Khr4Qkb0in5qFlFDl2v7GgwWs6sjpM9lTvIl9wKPZg
         HcZlJcZOIJn/9/RKzb9U84vrrQMjJSTYf/J7uVXa/vjOg5QeM37WPCrNzu+NYLamcgU0
         hUkQwmXAtR3Gis4D45cp4gtqN6pyBB6hEL0G+YTkYwJ/EXl2ctkXI11jzyZNI3NrqYfb
         xIeq33wyc3yRa8fUUpaLbWgT/5Y2mpRvXym1IrMCiAhAB8c4OMEZh7rqw+VFE/8+ceWw
         vwxw==
X-Forwarded-Encrypted: i=1; AJvYcCW7M4BeLzzRZ97HC1FHwNLTQjtMXNcpu9sF9w67TKFN0dnvBQYvNpTFVZ+M3U2sjDi2tWha8QuOP30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWhC+CkKSXIpa79MjOf2lLu6e640h4vyfdHBZj36Zsfgzu+mx
	jxSGK7H2ctDElQg2Dnr1ECFxVWiw5PE7ZT1XULC0aVyXKw/wZzk2xlw8QYTrr/s7LUvLxKxlXpZ
	KCpZxLJVmWI81L3XIXWEBAf1HrnhceNXCG/IVrrj+O+gGniKuejSQHp8xvp4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:616:b0:662:c112:c506 with SMTP id
 006d021491bc7-67bdaa8b758mr2919283eaf.69.1773437282495; Fri, 13 Mar 2026
 14:28:02 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:28:02 -0700
In-Reply-To: <ed831d20-3d7c-41a1-8710-f1aa5b39877f@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b48162.050a0220.36eb34.000f.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14ab954a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=113b1602580000

Note: testing is done by a robot and is best-effort only.
