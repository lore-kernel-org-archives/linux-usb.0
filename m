Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B352A3BED7B
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109805; cv=none; b=RRFeYm+IMgk+qzfltXz8ff4NJf4Z7VKUFkUL9Yp2M7UaZhnpBkRJmA7gZtpXzFBHZBVaS17P8MjlQo3qPyk1wRBm0c1jXSXi1EJl0WScdnf5EuFoYHA9jWsvXid8u/hZZu2mLkpENwLqPV9C6mboXWX9r0uRNGwjwI/3tm4bWl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109805; c=relaxed/simple;
	bh=8tYTZVigH+IKsJ6R7MXBMSyCGu+Bip0+FdZw/et+q0A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Nsohy4VCzJ2BREYSVL08eEIo90Wep1GysQDbhxt9YdAST9WwAbZUh+5GO52S0CZLpZ63HqmvhI1ju03Ut5cSr09fZysNEvkQFEmOYaKY6MKu1coAIkzsHzpb2nMNYNP6gnFag8R//fz6nt8s9hlveTxJfapJG212Poa77cj40+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37733badcso4834631b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109802; x=1788714602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FQe/FqEO+AeJSc0FYnCV3mBpcPBh5PcEEwWnwiwVIJQ=;
        b=hakfnjdG+DZ+ZEWpm6A6AKchIk//hJNEbF9XD7VDabRo9jmxCnqu5ErACz41j+iTbW
         EH64OMTcyeX89JhyeZEGq4x36y7mG9mKaPbxUOclOTh4SPwqNkt1ApQS+9bvDJwfZe9J
         4EXJNUs0WXZAgkC+Zjcu726jsb0jE7h45GVaj2tHgifjHzEvBKSA7DW62mS///QSuu0F
         fkMIa+8Rfm0uNbMNqxDPbHUaaHEJjPPVZEOMNS1ANVt9GVPGPmxUChG5CEnzPdf8Pe85
         qrIzWUMmyyZtnqd1tgsHdJkE9eqefBg08CiVTYcS5FwKamGLlASQ6Wmfrs/xwjJdLD8h
         LtQw==
X-Forwarded-Encrypted: i=1; AHgh+RrvaC5TPuNyOpvKhjcJ6B4EHv2igZ1nal13TyZxF3+MwSESCx+5NgMG+bePZOXTzZbQjxfQCa7p25E=@vger.kernel.org
X-Gm-Message-State: AFuF++n61b+rKL7Gj4b/yifqUuVEDdZ9tutmXLY6mkK814Xmp+2ImTd7
	wFHf3gpBEkBS2Pl/jcbtmsW49gqSEOl0bwMncShjaEFAKaPbST1Py0wBksKjDvhYZ1nWcDwvPQn
	ni3VlzKYsVNPJ1d5TAgefdNX01VhxXWsgjdz28LDmi4YTcMZOJES8tvaP+iI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190f:b0:4b3:74d0:6ef7 with SMTP id
 5614622812f47-4b398037cdamr19722620b6e.4.1788109802772; Sun, 30 Aug 2026
 10:10:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 10:10:02 -0700
In-Reply-To: <apRZM5ZkGw7KQq4-@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9463ea.1d9ded08.62e62.011f.GAE@google.com>
Subject: Re: [syzbot] [usb?] [nfc?] [net?] memory leak in nci_send_cmd
From: syzbot <syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com>
To: davem@davemloft.net, david@ixit.cz, edumazet@google.com, horms@kernel.org, 
	krzk@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, pabeni@redhat.com, pavankumaryalagada@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Tested-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com

Tested on:

commit:         73ae59e9 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13247379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=563582168294b9d9
dashboard link: https://syzkaller.appspot.com/bug?extid=b197a0fb4e741cc5030e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14287379580000

Note: testing is done by a robot and is best-effort only.
