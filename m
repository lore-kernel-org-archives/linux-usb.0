Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A63F8883
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786996744; cv=none; b=PVLajPP2v51wV8gd+e/kWQGmH9/lGH9IF3NSdrBZONgKdu2toMyRKk+ZsF/WqWd9IhQjwllOQvRQW9PRoE3iJR+Na79xy2+jYnow8MdPsGPk5i3JeIg7aBOxdcyTrGNoAY7GX2FKzrr3mGmuAhVBdoIppzmcXWvWy/VSxZ9dS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786996744; c=relaxed/simple;
	bh=TDdOrtNckIhTeXh2vQON/T2Pdy0xX9MzFmw5azZWy6E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ss8NS0DyOvN0SBjRGQU4Z3JddcgNmlgIi8UXbhNuj3tkqMhugtfU70rJh00YoEv2C8GDKq1mU4kxMk9rakMQ8myi/4A8L0DU8///LLzd9dv9k3JFC7MyCMpD9DOPihs6h0Q9ECALzecOY/Hr02oNiUlaz0OkkadbVxvTL73qz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a0f261aeb6so4842533eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996742; x=1787601542;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LtBBNJJEL5yAqoKvDxe2xuy3lD27DANuEB/TcNPZans=;
        b=rpTA08Ea8XZBVzAuNqBEYDYIBVA2iRhSBy3ZYPUcR/Wk3NACSG5qlAyAFMp/MZf574
         /NTmVlntsRDmAOIwmGYQSoXdevba83hs6IyZ47Ed5eX0Wj4N1i+Jk7r3oDhJJStyVMWn
         BHNjlq0CPwldNsxPXJlirVisyDIZaB9ADjKVLW0vOQFWpCs9ZAnEoSyLCc0/AFQt90qW
         +uEHO9MulS1f2r02pflNc+GVBzoEYw3Nk6M4aVWJZp+Us42kdpbcuPA6/1UjOy6DYedN
         9ZxwKAL7lwJsS9z6cNm12NwDEDq0uP+SxvSWB0N7oBsefwO8SAP9zhucJ3rhYrSB7Ez7
         Ee+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3kuuS6mOZl1+sGp1n4foSGRGUWArnggSnPTv1/1YVweco1KLhu05NaynD+EpukiDLI//ks+bAWrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAl4LDTtIm8IBKov71eKQnG97SzPSQCFDv0Cb7quQATpE6JR2z
	UczxwsUz5kjRZOk7tH13LOiAg0Rwqh+h0o5sDtagEQKvakq3B0YhHe1n2rQMhgFrEX2poWwbKCU
	kqghU2BXUBqzIgV6NfdFV2PSAXocHtTlLkMjyS/LopoK7Vpz8l3Uzvb47Okg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c07:b0:6a1:363d:bc42 with SMTP id
 006d021491bc7-6b0d61bec3dmr25274691eaf.15.1786996742271; Mon, 17 Aug 2026
 12:59:02 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:59:02 -0700
In-Reply-To: <DKRH6MEVABEQ.28CPBZM86HRGF@nvidia.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a836806.f7a79266.2f965f.002a.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
From: syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@kernel.org, gourry@gourry.net, gregkh@linuxfoundation.org, 
	joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, matthew.brost@intel.com, rakie.kim@sk.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
Tested-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com

Tested on:

commit:         8d3ae592 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17008679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a7d69e580000

Note: testing is done by a robot and is best-effort only.
