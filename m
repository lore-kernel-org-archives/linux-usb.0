Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65243710B
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386904; cv=none; b=pYQxEh4iEeCsFO86IkjelphHxeJNigvhV+QHJ0hrRRs05vkF0/FZJajuMP2YKvAQOx/1dhFDLRlAYTr+scJ+JBjYSoe1L63M8TrDJUopmfGd8QDzIT4uEpCSUXGCZQmgOYbw5jTpC3jG6XFdadQr/QgmQnKpIdbSCbqM0UGCNu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386904; c=relaxed/simple;
	bh=x+fWtxlNaiJvjuYVYcXM4gnB1taPeu7t7BSZ9JkbVzA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=laWW6/2FAkxgqL1BE8YoXqtsPukLh/cvdFAEU+aB5r28IKCeGdNsSFF0U07FJbsw9U+3xhzpFO1peSEyDtghwJPapbdsNquaP+xaDi7UwpwV9Cb+2qX2HIxIHnynSidZXUhT0xO3Qq1CQhJCuLqZkQWn7nl0j99WBE/D76HvyXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4af22d09so2417121b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386902; x=1786991702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K7uKpe4M8mbcOSEAL2qZIxK+YA+YklNLgZvtiAydeSc=;
        b=a80Gp60Yk3hysezBqnzdAnQt0L/XmPpoTWMlcHGsJDLWJ7UDozuxGEvl77Z+7Hs1Fh
         YdjfTc56ruC4X3UfZQUxPz0njF1e8p5o4YcgwjmkKcfoflAC59I7v3JMaLLaSZijvWZb
         RpP00VUeW+hCEGWHSdORhI6nCBTSYfuQ1NHF0mN81ckBCLMp7dZ6ogdnCkieIbkJR9J/
         Ck5lwrJD2+TcTUngqXgwGni29D8PH4n+Ws4sBWvcEv6nUT04Y7Yzth4gxHm4l/jLLXYu
         VHE0euZcW4Ee5BiEAPEuycateRAcUVn50OHTVAxcI2kZfuXOVXpr8mkJbo7ri2P0Kmzu
         Jzew==
X-Forwarded-Encrypted: i=1; AHgh+Rocpr9ZOVxRMT6RL4qgh+uNV0GeHi/+idhnnqKovCsKU0tty2+z5Z/AcqpfdaXn3vYLqUV4Y1S11AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LHNg/Amki4IVvkIjwN1yQtzVDgR/r0l/OK0Q4RDBEPiIAAbc
	5O7+AOaQ/tJJScEBCoCvC5cLV3zP6yygfR+TrtmBJYhdo30HspSJNcvW6DU5tw6ReybvHbJ3o++
	mUI9AchUkH72Gd7CVgM7IFTsam43jcKNB4E/yu2JP7Vpa3Tmp6BEkyLqb/mo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6703:b0:496:a36:b5e5 with SMTP id
 5614622812f47-4b1ab9e3c75mr12458498b6e.17.1786386902031; Mon, 10 Aug 2026
 11:35:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:35:02 -0700
In-Reply-To: <68dea1d7.050a0220.25d7ab.07bc.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a19d6.b50370da.49fe0.0058.GAE@google.com>
Subject: Re: [syzbot] [jfs?] general protection fault in rtlock_slowlock_locked
From: syzbot <syzbot+08df3e4c9b304b37cb04@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	dave.kleikamp@oracle.com, eadavis@qq.com, hdanton@sina.com, 
	jfs-discussion@lists.sourceforge.net, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	ntfs3@lists.linux.dev, shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b15e4310633f90072d66cc9b6692acbf6b4d7d00
Author: Edward Adam Davis <eadavis@qq.com>
Date:   Tue Dec 16 13:57:51 2025 +0000

    jfs: Set the lbmDone flag at the end of lbmIODone

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b1a079580000
start commit:   6bd9ed02871f Merge tag 'cgroup-for-6.19-rc8-fixes' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
dashboard link: https://syzkaller.appspot.com/bug?extid=08df3e4c9b304b37cb04
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ad7322580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jfs: Set the lbmDone flag at the end of lbmIODone

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
