Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C839FCC4
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151573; cv=none; b=MIi9mRJ4e4lbz9bkq1kgo2Y3ZleC3/ZKawrtLj/L3nPWXbNTBPi5gshqzTxrxwQTi+vWfrwUI+NBRPPCTbCp1tUv19XX4hLV4S2RdayfE4ASZTG1rIJntGNjEioNFzK22IeOIjJcqSwgvej/jECWZbSVDkZmdH+crgfuB55kDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151573; c=relaxed/simple;
	bh=xLVVnMXFtBZhwnbOX/IEoysj2r0Tef/nLUVUGRfRAXA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ne/UDSIpdR2dQamvpnx1FzimdID5vqJj+jiFr+CBfsTKKvkZqaOkWrUvn2ji1C27sceHScDORaa+Y6CQjRgbuwLxBsEIYRNPO/YU9eFrUO8GmqwenLGeiBlrda1rPbGvKT0PT9++9snw7vpyGoHhOX2OsPS5m4PuWoJSmQl5csU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7e9fbcd3a0eso1069213a34.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 07:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151568; x=1787756368;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=isHhLMyavwT+iKBWg2LRM8s5OlYIWpavPTLLklw+Bas=;
        b=KOjYIcLzaEnS8gcog4UW8WehLsvX9b4q3C1XAia/LPw7aXku3K+W16tBA1YTtPbTfi
         NMD4c2mr0HMbYt0gPAB22m4jcBgKzk15ANmhqwPuE1cwIdyNii26QQE8t3At1rU+Hk6a
         0fheP2pGF26l4yN6OngJ/vKQ3x/1CSFwJG69O22IUZxXs1xljUHXokolpfqqM1xEkwBE
         AYIVL4MZ778wSjhUARf7YEsnCr1F/tLnNxB/SXV8E2y6qKj7hcp85WNaJWX5U8B+hKBq
         S8b7yFh+JebK9NynVGraHvASj3Ykfx5huH8o6eN+k7H6dk0JmfwaybT77KAgqmefISX/
         XaMw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/1ZRe7aeXLulvhbMUKlQUM0D8iXDGwHQkDOo4ljy8igqN3aak/oPgrgYhFQ/8HCwm/BQRYuhoRZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+h5HC7fZYbk267B0/1E/Rhw9vuV2iraMbiS8q5dws7dLcS9r
	Try7ULppOIrLs6vmYPosYD3U2cpC3D3JIv8q6iCo5w/vjbyusF3JXt7kduuqshX8QzeUX7tiV5b
	cSHLoKBjKSA2HtIoh33ww3vkpB1f7sG/2NHYYyfxU3R6tiCjiZBuH32hHbdk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f08:b0:6b1:327:e45 with SMTP id
 006d021491bc7-6b13c5c2f53mr4735791eaf.28.1787151568549; Wed, 19 Aug 2026
 07:59:28 -0700 (PDT)
Date: Wed, 19 Aug 2026 07:59:28 -0700
In-Reply-To: <6a6d3f99.13bfb6d0.1ecdd5.0254.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a85c4d0.c8649fcc.3bb87.0012.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in rebind_store
From: syzbot <syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=130c3a25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15e47815580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15af7679580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff80000000001e
KASAN: null-ptr-deref in range [0x00000000000000f0-0x00000000000000f7]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff80000000001e] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4959 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 03400005 (nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : do_rebind drivers/usb/usbip/stub_main.c:204 [inline]
pc : rebind_store+0xb8/0x204 drivers/usb/usbip/stub_main.c:264
lr : spin_unlock include/linux/spinlock.h:390 [inline]
lr : put_busid_priv drivers/usb/usbip/stub_main.c:85 [inline]
lr : rebind_store+0x94/0x204 drivers/usb/usbip/stub_main.c:262
sp : ffff80009a7579a0
x29: ffff80009a7579a0 x28: ffff80009a757b68 x27: 1fffe00019788f80
x26: 1fffe00019788fa9 x25: 1ffff00011d58696 x24: dfff800000000000
x23: dfff800000000000 x22: 00000000000000f0 x21: ffff80008eac34b0
x20: ffff0000c667d000 x19: 0000000000000004 x18: 00000000ffffffff
x17: ffff80008a7d6000 x16: 0000000000000004 x15: ffff80008a35fda0
x14: ffff80008a5d5e28 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000001 x9 : dfff800000000000
x8 : 000000000000001e x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff80008a9961f0 x4 : 0000000000000008 x3 : ffff80008046a5e0
x2 : 0000000000000001 x1 : 0000000000000001 x0 : 0000000000000001
Call trace:
 do_rebind drivers/usb/usbip/stub_main.c:204 [inline] (P)
 rebind_store+0xb8/0x204 drivers/usb/usbip/stub_main.c:264 (P)
 drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x84/0x98 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
Code: 975283bb f94002a8 9103c116 d343fec8 (38786908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	975283bb 	bl	0xfffffffffd4a0eec
   4:	f94002a8 	ldr	x8, [x21]
   8:	9103c116 	add	x22, x8, #0xf0
   c:	d343fec8 	lsr	x8, x22, #3
* 10:	38786908 	ldrb	w8, [x8, x24] <-- trapping instruction


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
