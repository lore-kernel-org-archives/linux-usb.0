Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B242AEF5
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805224; cv=none; b=dMosUH3gKSoKFSulHzZjkR/W/Cu3cdjHPZeVbr2GEqmTfB5c/E4RfQDH7Es4ff6Hr95s2W2sD+JFoyl3cdqKIXqTCj7J1PfkaG5zBa1zVqML2vwc3K6vcCk836WBptGhwwhFy7MYZeyz7a99MkjPpGwomn5VGmHyJXHq40iiVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805224; c=relaxed/simple;
	bh=JM54arIk73D23R4j9e3qc6s4WG/8dg1tKNXnym+z3MQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OcJ+ZSRa5TKmYNaPIRWY1KxI6+FwyF17OQHreUn2UhJTeJdNtxPkNAKbAebIE/vB2zbLLeZ0k2DANmBvgsejcEBNLtp4a8geU3Lzzq7MSkpC6UQ/PckOUVIbFltTNqEu7ltx0lzSVgAqRoSq/gpdAhdEM5onOGUoiN/IqCEby74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9fc6dc091so1422760a34.2
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 07:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786805222; x=1787410022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8s1Bt/Z+7TspRQ9ZU5yxJ/CSh0wJ/3JGEIFx35Btno8=;
        b=Pj3gPMvsSTURWpiEzd3DZppCQ4HmfcubeqNOwnFM5htFdzuVMAx3VqEV7ZJnpmPWOt
         U9EDXLfQoH7CHTDe5wLZWA+yoPUzxf8yeA8I0JfZe6/08zUznnS24Z6PedE1m+k4AQdY
         +JM8i/ZHbeH3m+X8sp0qP30NTjMh/a1UrA0ICoL1qfr6dXVrOhqR2ABTyLuhbYCdN09n
         ARqWN7mDmGuhfCDkAHS0kcqWajS0PnOXjK/VyHOZyUzT7AVrjHOdXjSj2gYUUuPuqn2G
         Jho/6PEbMVTNyQyzWfH0kbQrXObB+F7lbFX50ihVkjkmqbV5hFIERDiiOYcf5tUSIIfX
         j3JA==
X-Forwarded-Encrypted: i=1; AHgh+RqAbyff4Egt1JNH4YIHCoCUGYcNL08xNOizf/Hq7vBFZDAwY88GX3hUYunUfUzihQs5RUlvSqtxrbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WdJxn+m25HwHd/91a1gUI1V1DdZsXaWFsRPyipZTsChxjaGT
	iw19qniunFIetM3pHxUwbvipgBldkXj8ZX5OZRZr7pVLtUY4FGW4BG6LlFU93Cb0g5QioUMdTqJ
	Q3zh86/QxJlhj1rY3Y+lMeUcsrcbb4hHWAxUjxMEZlCd57e4EuDR8KE0/MCA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:201b:b0:6b0:589e:42f4 with SMTP id
 006d021491bc7-6b0d6245e3bmr11438553eaf.20.1786805222068; Sat, 15 Aug 2026
 07:47:02 -0700 (PDT)
Date: Sat, 15 Aug 2026 07:47:02 -0700
In-Reply-To: <20260815143241.19047-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a807be6.f7a79266.2f965f.0007.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in attach_store
From: syzbot <syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, kartikey406@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com

Tested on:

commit:         15ef2f78 Merge tag 'input-for-v7.2-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bb3279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15dc6949580000

Note: testing is done by a robot and is best-effort only.
