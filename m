Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC47374A05
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641885; cv=none; b=tfhgGu19klCUPr9xLKpXcXjBLHpsHL66FcNFG0DCmaIHoJm4jNp4icFsgo9AMMIX01oME1VaWrlMRVtHLesPF2leAI9UH1h9/2Ufh4bYW5Vnmck6lL2qp8bD/RH8TVD9Ye/hZ+tWB3y9IYykSsGJU9KC7QFvy7B7kDBCQ5XcG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641885; c=relaxed/simple;
	bh=InT5YSzvTjWFNMB6OYCP5uV+r6SNFWBt1LxaECgGALo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t46bwSFmfiKUItKA927FelLfBaxd9npWzk9heo7yai0LNARECNJDt0bzgIQr4NPTZwVrgOYqn/aluKDE8pOBL1Z9aiMHsVlhrhdbL03uDtfg723164F2ZTwyzA1XCRF9WxxH5NKZfwGZl+eMX02LuB5Uhd8n3e5zuSKm4drZnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4574f1cac98so1292748fac.3
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 07:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791641883; x=1792246683;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EcxkuS2RBMYMTop2TmJ2lUQ2A0raMtRIJ95H86/AkrU=;
        b=FRiV3sNCGxEmVAPOl7idNAiD8vkL8xTTqBxZBbz+GntxxSOxmSEATetkWTJBmmwWvI
         Tw7p5fPMTYvNaftkJnoLwPzy0oTgjnm0MQyCnNaxjQqJdhlKbjZR/L2AL3mRNHLHkFXr
         5G679YK6c9rOkEKIsKgyO3BatgjZtfEOd/e3nnzk95aOONZfRSjjpAuMJXvbOgrf34M+
         XX8jI6eD0rctPZ46hrJ1iLGILmADj3X/fWeSI0UQ9YHf74UGixgDAYO22KqwgfLGQW52
         pp70gVl6Op6pW2UFdXWNvg0Gifj2RDDrYoKra0TSsY5RYPBjCMuswcbfiY66F+8amoOT
         3KtQ==
X-Forwarded-Encrypted: i=1; AKwUvBznyistM916sfCu6wmjpLLNMryJvbxwzkFN5EFK/ZLSrHkszZVXSNlMBcwltlaSkUo2SyGwVWXEFgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIayTUKngxk6jxA3Dcu/FfHs2WG5OmZWAHWXsdZVIB4yMUX/4kq
	xO6B6wFawRx9Pvvuz/FZDCcISmMB+N4Quy4FVkTWKx4dzbXTn9kL2HqYCbb+Gz/idyugqS/ZDXP
	V1ZlFiolf7QDZ10LoOxR5wgc0pPRukSmgTwoKVe/Fkbqx/09kxVd/9QwtD2Y=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c6:b0:4f4:2b4c:d66e with SMTP id
 5614622812f47-50c5870f5e0mr4300516b6e.50.1791641882780; Sat, 10 Oct 2026
 07:18:02 -0700 (PDT)
Date: Sat, 10 Oct 2026 07:18:02 -0700
In-Reply-To: <f10557f6-fe56-4f3e-b138-c1624465a15e@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aca491a.a150a118.27e199.002a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (3)
From: syzbot <syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com
Tested-by: syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com

Tested on:

commit:         5926a7da Merge 7.3-rc6 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1622867f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f0127eb11110629
dashboard link: https://syzkaller.appspot.com/bug?extid=25a1d2907885b2182275
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12bd123e580000

Note: testing is done by a robot and is best-effort only.
