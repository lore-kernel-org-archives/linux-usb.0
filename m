Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D092B23C4F2
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451824; cv=none; b=L/HP2b0Lqmam4gK7hFngVaZVSsE285tyeGHkPGvLiDhcpp8iZWJ1mqIoPWOtGev/uAPrW+LYRdyjC24jG6DAGZCdyPXpabkZs2obtCtjmMuS1p0QyQBl/xbVyNrgH8MhNLoMf5UPX/XwnBUhjEL67dATFKr2Hxiszm7hno4RvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451824; c=relaxed/simple;
	bh=RDSYPH2LZ62StXzuQe/1qOWaeDI1KKVQ+OiW8YjUwmA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HljtSRdJyKrcz9Dxl8IQ8aT1EbGiuNUw8JuH2lR1Ii73nsR9ndmt8KUtWxYA2WIJlVGY1uFvg6blfCO6W/pkJy363lmeVbGOnEuaTI9pfPbsi8WT7rMzh3HaNLwHn2vhY6+QZWm2yJ3tC56dCV9RwiCf5CEHFQRnfbh+wJUlUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4893fc86bebso5166810b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 12:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783451822; x=1784056622;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhiW9MgSreps77YlEddsnJ56t3QipbjqlVxTQCk7dnU=;
        b=L02ifXfX6RIyCJZNgUvVuSBaUq2IFbDqX55C8z5F/AUScPWbOzgNhaMZ2jWxFa33RH
         duSoP68p1yMYcJAzfSKIn5H/bkXud4FKcKYeKH7+VrtWSyTT0th4YUnindcyzkOYXaQS
         ymrG0R89QuAmtWf4PxZKTewtEU0frjEmGN/1J/XXDPkYBeXpoh4baS4Ep9fuAHJz7XhJ
         8jy29HCUerEsFmdQt+FLE2d/4TRPYJZhTWdUQceTpahbUkpd2mzaFv0r52sJ7xh+vATp
         PGb2IJRWqxxA06Uw6/7RzNxchGd2TzGzrQxzFpr81vyWUGXg4cp8l580yNNqNiy5WJS+
         DLDw==
X-Forwarded-Encrypted: i=1; AFNElJ+taxdSh6Vs9JI2wWGEtMbIuYTgqs0pgEBV9h35GZmz7n0tsE9D9ykRLF4ZSEUToB6yFGjimlXPwQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvcGIYJ/GB7G5k0KTb6kk8wnfTEQveQ7tDOhOHwCNuvfXDZOS
	SgTmFkaPG4psDaqFlh/ryefOzcaiTHTQoVesbz650j4o0XpLkiJR5nffuCbsxidmmhU8CtQiuAZ
	KGS9PLDuPaPixDpkSnexKCCkedfrtYRv01mSWw2UNfP5/MpG8qe6Cq84gpv0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3f3:b0:496:fd1:82e2 with SMTP id
 5614622812f47-49fde0e17d4mr4759302b6e.27.1783451821863; Tue, 07 Jul 2026
 12:17:01 -0700 (PDT)
Date: Tue, 07 Jul 2026 12:17:01 -0700
In-Reply-To: <bc26a2a1-64ec-4ae1-a7ba-2caf94785e74@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4d50ad.c76b52dc.34afef.000f.GAE@google.com>
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

commit:         2b763db0 Add linux-next specific files for 20260703
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15586b39580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bc069df559a09463
dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13aef31e580000

