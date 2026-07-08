Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3C3F12DC
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524905; cv=none; b=S/Tq7TuOArL5d8xO6Khfp7dwrf4MOzAnJCuOyBzk9MFKHWjCaASAXEsvtBF32HT2O6C3Nb6xJbwdCBjcVJNp61bovkX9NUOeRu5ZUTXpn4ZVCG4LufdXzT8wp5PrznDlnugL78E45vr/+j+9KzArnSv9DiN2wqPB8OWOmtVoOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524905; c=relaxed/simple;
	bh=PaT8L1fB1gIQaBAaVocQB8g1fmnGVBFjmGs6iOKa0/g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HIr3684gDCUcis6Rv/b2T4A6JhC9usw4TF2Ad2qGKGqCk/0f+nFFlch7d0985V+bsKcweZKMnyU+LW5IN2pkJKxaJkk7sDTA0LsHVZM30UFWe4CGzDZS7Mob5ZNmxUlm9OfJ6MAs/ZgbLw3Wo23DtWJEI5KfkuysJSPKHsyVC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a0c02365c7so1155459eaf.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 08:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524902; x=1784129702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6XlVj/3AAHB+nIj0WekDfrhlcITv3rwrxbsm0ajRE6o=;
        b=fk5GLvq0fqmg7y8SDkV3nZ4OrWcx/3VE7/R4KcXjoDDaIU0C3I3ObWT67FUw0uidc7
         KW6v+esLJ04G6glWLwZ32YbkUr+9Dy/ZM/4hLk6uhuEKWi7IgDG0s9KaIDV/gHAHK/QN
         wuV9o3sI+arGr2v1x9ZECbcyzRAfEQ31AYk93m/wSM8q3Fizllg9SAbHyIJ0WYpZOVpS
         3BLeUIDIo0HZWZXHWq/3DUzNFSI5hpKCgyB7NfCsz6HqPN+f3SNJZsd84osoYF76AnFo
         AWfo1s9+5Gk99aO21q02WwaUwDljqcEuutijkj48itmWZI06o5IdRCP9YlydRklm1rGS
         jX4A==
X-Forwarded-Encrypted: i=1; AFNElJ93NGl4qqa7sB7K/+yiITVfrommes09d0HvUTF+H31p6N0Oml7GkrTgK6rawhQRcJxB3Ixhz+OTPW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6tUJ6BDPQxYpkosf8W+IpLloJ5XYBPkTz8a9vSHgmAYJwxuA
	ateL/IOG+ERvExEnQ1SDxmJfeVCz2ZZsuGLz6Xfm+1Lt9bEAlJ97ovX2XjU65JhRPkBgJ8Hc51e
	tV5YQLzxHGeDuDUQdF9S7niv3W8oF2B1KXW7KG5GEW3r3TUH7G9go2y5nrdE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:210e:b0:6a1:40ad:cfac with SMTP id
 006d021491bc7-6a36d84912cmr2272112eaf.13.1783524902753; Wed, 08 Jul 2026
 08:35:02 -0700 (PDT)
Date: Wed, 08 Jul 2026 08:35:02 -0700
In-Reply-To: <61ad2e9f-d4c6-4879-9b36-afbfada101be@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4e6e26.c76b52dc.34afef.001e.GAE@google.com>
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
From: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
lost connection to test machine



Tested on:

commit:         8cdeaa50 Linux 7.2-rc2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v7.2-rc2
console output: https://syzkaller.appspot.com/x/log.txt?x=15366739580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=abdd1c3924a3d690
dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b7f739580000

