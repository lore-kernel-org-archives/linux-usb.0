Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230B30EF63
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209147; cv=none; b=asBfx+A/4sLoGc5BTSyCYyNsO0KGUY5OFpdcL6C5+6VBnLsmEFhpOay4ZLh8fydKA3CNHVoioymmbw/70ax6jReb/4ZL++IgkF8As3G6T89azFXSGEB9taWSkLE9LZR63RD7ndXTmfN/SeCKjhTTBQEAw24hj1SY8LSlApUXe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209147; c=relaxed/simple;
	bh=qR4a7idsLUJ9TCpU16aY6Pl7xAMaMcZ14NwUrAN3Vl8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0eq7TNxRrnOV7UESoNQzVInD/XjhVTpFxBzplm5FTzim9Jpog9jVTjVqtxN3FWm1x6julNPiIegumCSqYenCEwF0mB+Sq/vM0x6CtEfXBKk/FeVUhOaVCPVtzmBssWOrDdBAprZDc7yL1o76r20sqXWoaVAx2BO1pRUZJqQqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9fc6dc091so1473862a34.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 23:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209145; x=1787813945;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oppJJRRzVViNGhGanGMWYm2CxvJJnfdDAFVZJggSvgw=;
        b=oxM8p2cEsu9nLiOoMyzCuDz1c7ZqIVO0IE+pJudTVjT7l2EQOmKrksvyn3jGIoW7or
         Yn+m+KPwUy/8ifwMQdFvNTEyqUekrVYXN1Fzdd1MxESjF7aGj3bCcnbGdJBxktq2ZrpN
         RDaIVz8sTL9xJEz/3CzrtwCbRfs22NhtvNZnBQGyxsVwOP7xwAyFhWLGXwVCxXv4fyiG
         x5u2zVCVmW/6LbgFD+PgwgfLvEuEtOfiBq/XHvfyRp6bSjWstZu4XyMM1E5wdm/DbpEm
         rjy/Tx5ub/bd+Oz0zVJyozDltYdkha4/9cv26LYKiTUpfZECvcOfpc5C9kUOJR3P7yPg
         QayQ==
X-Forwarded-Encrypted: i=1; AHgh+RrroGd1+oFBMVz/UV9DgojkQSfSh/PTH0Tz/GrJRoi6yTEw+IeE0eXkXRaPEAbe7RfAZtOqB5U9chc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRvKA0KRUbERoRDEb7ssm8zMaa4Pfh6/zA8NwsgjXM/QWldaM
	tgWZKPc0lcbkH8NhXTbYelN4WdBu018cV8SyKXdGGCBWwHUfd0eI05ECc7FzgNTa4zIBL4jfVUf
	5bgWjHs4weocMHm6mEwypzSZHC3U28r8FzDHLhc/TvolHHfPAl/9DPibBFhk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f00b:b0:6b1:4173:ca4a with SMTP id
 006d021491bc7-6b14173dc9fmr7009868eaf.11.1787209145141; Wed, 19 Aug 2026
 23:59:05 -0700 (PDT)
Date: Wed, 19 Aug 2026 23:59:05 -0700
In-Reply-To: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a86a5b9.4d75e56a.c9a88.0036.GAE@google.com>
Subject: Re: [syzbot] [usb?] kernel BUG in register_netdevice
From: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>
To: balbi@kernel.org, gregkh@linuxfoundation.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, mcgrof@kernel.org, 
	syzkaller-bugs@googlegroups.com, vvs@openvz.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 425b9c7f51c98443db71ad679893725483b21196
Author: Vasily Averin <vvs@openvz.org>
Date:   Mon May 2 12:15:51 2022 +0000

    memcg: accounting for objects allocated for new netdevice

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1212ba25580000
start commit:   e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1112ba25580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1612ba25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46f568dd8d795f6
dashboard link: https://syzkaller.appspot.com/bug?extid=85ede281798faf736677
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156b2549580000

Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
Fixes: 425b9c7f51c9 ("memcg: accounting for objects allocated for new netdevice")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
