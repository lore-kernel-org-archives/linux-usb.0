Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02537F305
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755226; cv=none; b=QDP3aYiUiRXVvV+yBwar/E2yTuZ+xrVneeMlcFGCk2IBoRZ409f0GIKstYr4BqaPufDruHw+jik7+IneXnJxm7Mko2Oyv9lzc3Psvs8UUA9xIYSdc8KG5FafIloaD8To1KcKtvPF8ih7kSD2j8QK5CEen3sUe2+IB4nBjlLgRGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755226; c=relaxed/simple;
	bh=NQdrBYUyoJ74GjiSzV5zqoMHB+RK1AeeNusMUGNHwvI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P5rNKl/KYxLSGV3Dn/ibIfMlhhlvdT+yNP5GK+4ghrQt10932CHdW1gpNIiiujgS5WbEGXxf10JeXQdwYCvoTRB4y1flUaur1IPEADvO3UeYun9wRYnMuF22yslmub2ajJ1T3/MnN6bHb9zsuoaG2XyZ6a05XDeTcHz304b0QZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82274137201so2629471a34.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 14:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755224; x=1792360024;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wJHs/EwXISp0YtkIUmP2K5Oi58fM9qmXdUuy8FyWcTg=;
        b=HfgLUnuX8kzweVwgT13uwilecdpi7sDoKrEqgZx9WXN1Tiw9o0CsT9KD8bljrZyxNL
         o29yKW0MQ0PO3WCKoIN3v9wdwaQVFbgOTCJ0uppdqrMj/85EL2Pcc4eNBHrQdhxaijBz
         fkK4djfbyQ35spzo/BQPwIwOULzqIxk3N4rCqbDyB2QndHavOP3cadPKjIXrzTQESuv6
         QcW2OebHPmXDS5idaUyjMsBgnGmAI3jt7NMlyxSluBrz6aePlAeMiuHqwyosecXL+otS
         uaEzVRawApd4Lwnw0DGHYoM5ffQQ1upyjSyAoTUEoXSLnOw5vEGTIltyx3uNEzFEfS+q
         Pg1w==
X-Forwarded-Encrypted: i=1; AKwUvBw+u944JNEjfVo6jDNI09hm5SKNoz28mKHSZ4ulb+T7gl2vKJ0ggMJy07QihZdh348zQZq3LLkQYUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9nOCnX7KuBTvQRfRDnc5c4ilCvlrzyaAhJQYon6I1rQeOUmLV
	PDUi7G5U+SwHiWm6EOZWt8x4aUrIxB93ODyiQacuT1PdUO7cpI03S7pQy5at+lbRyuvl0eyN8TM
	LwxVQ7YW1bUyYm6+Ofy/Kw17Bg8BHoPtK8B4VGA+8ny2KF9ME6eLHyM9I5pk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1992:b0:4b2:5529:ed3c with SMTP id
 5614622812f47-50c438a3cf6mr8415090b6e.7.1791755224140; Sun, 11 Oct 2026
 14:47:04 -0700 (PDT)
Date: Sun, 11 Oct 2026 14:47:04 -0700
In-Reply-To: <6a6d3a2e.6ce73036.24301b.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc03d8.8cdf6287.1eb53.00fd.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, khiemtranzo532001@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 9213aa4784cf4e63e6d8d30ba71fd61c3d110247
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Feb 24 16:39:08 2026 +0000

    sched: Default enable HRTICK when deferred rearming is enabled

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ab11d1580000
start commit:   a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ab11d1580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15ab11d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1506fc3e580000

Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Fixes: 9213aa4784cf ("sched: Default enable HRTICK when deferred rearming is enabled")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
