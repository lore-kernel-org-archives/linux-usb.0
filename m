Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102938;
	b=f2q5MB1m8he/BKptJ7GtnDXCdEfTI0X0phydgpuBjUvxcrwfw0UfTo6CQ0r2JxKPVqbg
	 x5Hs5Dcz66mChIpi6d+6R2eAnrir3qvz4mQM7OY5ECyJh99M4tI0hUMT5zCFkhXLZXwCP
	 WVPRki88SAnFUw8f0OzNSyKowXAdRT68IsmHHbZA70LxtRa6sATIFJ2DgxnFU+Htqk3Mn
	 At49RBUfjX8VA/ovZxlzuCzAvtefKBLj+FuN0o1ymUtgjxRxbIY65UxBqNXD6xq6AJj/r
	 AuriM+j9JeG+sJ7SebPhVdU0LMUDOnBuK44Ml5CL/nVMZWTKjPB4k5Y6kx873ghZr5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102938;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=3x0gcGxLoe8xh9zXM3KZqk8OeXnLeLRjDbX8BPObqNg=;
	b=JNB/2/i6AGh7LR4WTBxUJ9MKWGvDfxTG2BajPjY8IjopR+OAyXM2MGfnv1ywwR0frVOu
	 1tImyatdJvqp2mwFDNHTIn0sttdhmCwljogarkUMxPA6jiiDEKHh/IubybSyOzY2dBN1J
	 wh6c9hfFnSZ8WFjgh7aAytF7UTeqRaZlRDZuucK0POV+g5T2DadCiKyAwryhRkMgHwBLj
	 0f3baWlj3d2JFV3uR+ZuSk2a8jBtqomudvCzw+SOmymDVzeCnDqZamjmHPiGeUWS+0rs5
	 biHfhHRvg466r/cM4zv+xVfvBx1HNdWMPjYqatt/d/rfp5H1a3usuZSfjA+0xQP/tqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB9606A31F
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEB9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so3346319b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 05:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102937; x=1793707737;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3x0gcGxLoe8xh9zXM3KZqk8OeXnLeLRjDbX8BPObqNg=;
        b=tcZotXJWoSgeD8jfpm6/ozUzlmtX6DjQGrdgZi+QTZ/jeiRxbG2fNHCQxCL5fGv0K0
         mz7WNQBQo1fr1u2xJ5LoRMdmFi6WybIqz5CT2IY3BpjBx3nrKiemWmvwyqUPRlGa95ZO
         DBlTyLAt6aZCZNknMYtm37zDL2Vw8VMO5ODF0L3CHG/ou5YX+jXCAG2VxbgyGEibXd/v
         HBotPZ+lvXdEbL4oujjbxIysMmI1nG+KYBEY6bnLOonrS8JkGuMCtmWw/cgZbk/mGXgf
         eLF0xZkqSqaE6tqjR8dBoAfV2ezQC6WhhkKyvUglIqD8zz8m2sSVtYBhCbV6uF5Cmvyu
         +lfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr/rCPCfhMmPjCuO470Ollsj7Ee8IEEUN7wuZjvRbSTArdQldfACN3oyeyI1ZME8zNn6ZU03KDJ/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6R69MEUope0RRQBKV6Vy2hqJe1N5t2FV0qmc8uJ+YB5Q4Ns3t
	hIVENpRkvS2sCvgefztKsrk7yDWhluJVWB8FzRNa+wkN1ONtjqMU66hWkrWrJLBcD0rOXTFy4Ju
	92RQNZrdxfGwRGHYRy3v/gMDnY09v3ihgvmi65rho6X1s58KK7a8hOMRTfho=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1822:b0:550:de67:2631 with SMTP id
 5614622812f47-55c00414357mr5845145b6e.63.1793102936555; Tue, 27 Oct 2026
 05:08:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:08:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
Subject: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, 
	harry@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, rientjes@google.com, roman.gushchin@linux.dev, 
	syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com

------------[ cut here ]------------
!PageLargeKmalloc(page)
WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
