Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983E32E121
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 17:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773508026; cv=none; b=Z0plAjjS1rfDsU603VXinMddg3isbcI6wamq0TZAZgthj9skVK+a4EJP4bCSWkz5HNc9yBF+H0n4ZtSwT72JEH00QC/oysz1kHdvfJsefY004mHs60wm3zmjqXuiJ3YpxzmC7E4AJe5iTHjze88yIgA6qUGnfKs6ZHbnovaNVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773508026; c=relaxed/simple;
	bh=dMcpKmkbhCGD3O393x0HpDYI/LRBdOlqzxphYpqCFoU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V1V38+DVTYZZ3EvyHGlz3s1nmLuPybO7W9YZ9P5/alyeEkT3H71pAw61p0VuepyWKVfrIk9EFPWpXZtPLX4jYBY3Xx2lpI1uMjAo3O9e0+NRrQNr40I+9zW81VRDneYLzB0SwtYd2mpXSntL3+6BzAViGNCa86w+WM0AhoyCM/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-66308f16ea1so39246711eaf.2
        for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 10:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773508023; x=1774112823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkEhXUpb0+5hL/MNQX2ikDwmXrwhTY9l+Zp71GR65iw=;
        b=L79ZC/ZKhqk4U5r50l8+Fi4SdaaXM18uhM1IFa9nvSTy6eOqzhIS51A7E1nb1IbEdM
         TxPN+uNc/J5WEJHpXc/b33kThBZgHyBfVjDmMHWST9F3Y1K0pnj7WutFx1gVeX9hdSAn
         6u4dr04se8xkH1I47ZjgbZNSj6lvUs6LAH0qyNaMNd9jO6h9BRb3dpbDcVOG3pZydcjW
         aziKj2oZeEATYY29KmjG+KXEeU4cvU0e8d832NcqucYJjsXIsQAhUpPN6yBWo2YjSpBz
         3+qB/3Vi4BgIh03KPsKBD/PWCkjKMHICYaGq/Uj3b339+AWlDgBsWSz4QFL5OMGb2HPm
         BPSw==
X-Forwarded-Encrypted: i=1; AJvYcCUnchx8/2jBL13ywK3tJUo8KQKLbGLZzx/nhPT+jvg6RQGBMfGORgU6k2YsYd13CCRMoXhrPiZJLbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhW54lFGMeqcgOMfamax4maWnpU5OtR6Ci1achpUwIP6RlB++c
	RFTpMmBx2WUgE3FndHzFca7oSitrk9CeYrVLJo/hwHSoVBOgihZt77cd3xgrMiG3W4ORd8iP8NZ
	nT3Nb91+KXEDuXq0kZmMUiCKkOaw4+2LwrGRUw5fxNfV+KZ1I9Ca0ekjYmMw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:180c:b0:679:e9c1:a91b with SMTP id
 006d021491bc7-67bda9c03d9mr5021899eaf.22.1773508023468; Sat, 14 Mar 2026
 10:07:03 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:07:03 -0700
In-Reply-To: <041e5d18-6120-48dd-b137-e10020f0c191@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b595b7.a00a0220.3b25d1.0017.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=141f18ba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169b5d52580000

Note: testing is done by a robot and is best-effort only.
