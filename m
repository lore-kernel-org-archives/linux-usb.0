Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979544;
	b=Wh3I1mMikcI4n8CDe0BMxGBwKT0USJym3zVBo/yDjMoVSmZwAo+ZYzCLuLl/e/gDTy7P
	 gfSQ3yIWOMefj+EHte8BUIA+EW/6JmHF4w3l62QY24yVyKsKu7SMn7TtEoI1s53S9dagU
	 Ki7RLodQZ3mZhJCSNo5P1gAUy63vDOmYs5XVjQ9MAanixqwMtdplVJIdOHHCeoK8BTGtL
	 CZgqBUaOWmZFFnHxaBu4RpwZhvZGxTcRpeDAHN2rujGaOu2v34woTfcbeAoI1mDJVsbPk
	 Pn3g9LHYjlRfRib8bMKqHzOmnTe/0VnZSlbed3P9rWFT436/9AOpsKK8Cg7nWa4iqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979544;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YBZrnR7BOQApPgiP0ljXs5blRi/wDnS+mCptVcNLM08=;
	b=xtTiCK0T9GtKpp2Yv3RSZOED/Xkr5YQg/SP9i97Ni2oB+shHc2nqRL7wInAcaEahaOmV
	 dbFIkP3i3A55nkyQvAgH3vaHeXyik2MxWD6yl3iRhLN9gqngcyCy/r6XQVWaEfUuaBADz
	 PtMbbXED/1+2p+xESJGF141jn74hHBjOWURilMw1xZo5NONz3v5KkogK0ZaZLSMSn61Zx
	 dpI6OjdVKVT0XWyO3mjgvmSi9tYkWsin36eJIQSNKGGOPo7/ybmndAZlD3NDUVKyss7MV
	 zrXm/LuaUNEsJR2hQNA2RoIYpVvxe0ELdqhghrfK1FJz3/XDEAfUexNyYetBu3ATQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55618606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55618606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso892031b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 07:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979542; x=1794584342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YBZrnR7BOQApPgiP0ljXs5blRi/wDnS+mCptVcNLM08=;
        b=Wo29EZjeQUiO34X/FMWie287vz3CYg/w6v8sad7jiiHvAvnZRRT0MFiQfluSU8XNM8
         dGCjSV2pApXJwOQS1sH+abtWXuaLMF6AQAOohIerQOh3KV+O0LSfxybMDQc56t16hS2O
         JEpdMUiXgHqCegoLGDY7LEujP38CdEAYSd7kZmRqPgTSnsGsbbVUP30Bi+FcAluK65/+
         PMmxOKmdWEfiTNfgr3WkpLR0vsbAWesNTzhGbhltFOFsAUxIl7pUSO3N6Kpaetw1pfpD
         lb5yYXubOH+PLIe5xV/itUFhqVUgKglRj8Fpp4G08H+fOaE2J/WJ/Kv4lQkAR30T/g54
         EkGg==
X-Forwarded-Encrypted: i=1; AKwUvBx/X0BDR14Knqqksj68ANSmPG90CepB3JRC/yeozXTB61sds0d4pau/wL10hgnX+oPr4KNlrmKrYwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iAR3ORVzutaqop8hOt8pya23srefsmztyNw54ougaPFg/L4aq
	pn9ybbWMci/ajdkuUYQud5CtmbIoPEk/8wYBY8RAieah0/s519KC84TQqf9+06UchrrPBbWR5Hm
	aMsO2Wdbq+mdq7+gurdng1UVc8r0NVUYdOfOD5/TR83AVBr5hZ6Gw3HhkSU4=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a5:b0:55c:928:69d1 with SMTP id
 5614622812f47-567e16594e8mr1950490b6e.56.1793979542519; Fri, 06 Nov 2026
 07:39:02 -0800 (PST)
Date: Fri, 06 Nov 2026 07:39:02 -0800
In-Reply-To: <179397691694.27761.9543494907127681190.gadgetfs-ep0-patch-test@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedf496.871af9b0.266aa7.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dummy_free_request (2)
From: syzbot <syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com>
To: devnull@kernel.org, kayano050408@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
Tested-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com

Tested on:

commit:         f66469d9 Merge tag 'net-7.4-rc2' of git://git.kernel.o..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15bae369580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=664189a7d8e350d3
dashboard link: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17acf2fd580000

Note: testing is done by a robot and is best-effort only.
