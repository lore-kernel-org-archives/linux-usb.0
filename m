Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC41A6810
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785009397; cv=none; b=q8J+JLptQM8zhz44QvKHKL+YIJR2c6EAk/gYZEvBLzhW2t7Pgk5rxhsEE4UVuIrPJ6aJIK1xAYYRwFk+a3Auh3BWFXgSp4MKXV18d29lOzIQXBlfiRDZVJVuO2iDSu2vgibuk/HxTUuodWjivglTQUCqzCjpkASow0vEu6ipO+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785009397; c=relaxed/simple;
	bh=IMoXS/BcO1qL7fj3zWRgRqxcBQPRGySD2aVm3fydnPk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IqlSJRJEXcTTSC9sUD3r73mwIdwKijh+ymTcfkQLlTxKUnO8wkJmaDyt29NH72nUhl8rc+unCH0AbdUlz2DMYoYngBdHoLWhKL12VVaEV3xu40l+gJx0FJor0WjU/JS76BecrfAizmRKMKjNnwY14+2i6eosGXjUyAE7GjhmHAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-49d4cb3ca23so2106871b6e.3
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 12:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785009395; x=1785614195;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYLLa9d5ZZSEcz4GOUnCW5126Z1ea/JXPWPE7zU28Fs=;
        b=MMvYyNsu6/CZ8t7E3TXbY2lDhfiPhXyyL0juwB0CDAGLB12qZ4teHBO0TEiag7gLf0
         wKrivfkldFdjTSAI95uOdmvXxAHH3DjDw2IPj4F41rQXSNZyTZRsp4vcaVCOeY+vYY1m
         RvYdGs9HsKZSo/tNcSyck90fiHzrjQoW8/OYJCaU4j7brKiaesvD5sSY8w1229E1o9YR
         qubV+iJUR3ZhvQaupjoqJrnKhGOxeu9QG+mtzlTbHR3UWiSlIp0nEYyFBKndSJMVObXX
         qtVX8Q7D38ncZPqdh1g2svp/YwDr+2+GfUQlB4nNdMNISr3JIknIUn2jUWI8HLz8yJqq
         Cpew==
X-Forwarded-Encrypted: i=1; AHgh+Rozf8yF9DCfmMmRxjj9lK9/WuvSgDz5KogUP9sONLbjoR6dc9uDBRBI6/El4PwXy0wRuo7J2B4mU98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4JLTyC83Rzb8Y+WfyNZMq//mbLDwOpwML4qdv4Gi4QMCAXD4
	LQXRnG3m4Oj5EAjEO7m8jHlANScI1wyu/6ZFULvYKqEO6VGIeDGszxRLemwjSCCWtDD4P8qskWB
	r9s+C8E5XFlNggIJ9XgAjwRd06lyHVGwbowurPALVwG4nc5hdPiBHuiOUVro=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159d:b0:489:352c:5153 with SMTP id
 5614622812f47-4ab6a113d99mr3129906b6e.21.1785009395234; Sat, 25 Jul 2026
 12:56:35 -0700 (PDT)
Date: Sat, 25 Jul 2026 12:56:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6514f3.70955b6c.323240.0025.GAE@google.com>
Subject: [syzbot] [input?] [usb?] WARNING in cm109_input_ev/usb_submit_urb (2)
From: syzbot <syzbot+25031f01508bf55c62ca@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=128a1746580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=25031f01508bf55c62ca
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117b92b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25031f01508bf55c62ca@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff88802bec5e00 submitted while active
WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x79/0x18b0 drivers/usb/core/urb.c:379, CPU#0: syz.1.696/7407
Modules linked in:
CPU: 0 UID: 0 PID: 7407 Comm: syz.1.696 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
RIP: 0010:usb_submit_urb+0x7c/0x18b0 drivers/usb/core/urb.c:379
Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 f9 92 4d fb 49 83 3e 00 74 40 e8 0e 3c e1 fa 48 8d 3d 87 f1 f8 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff eb 11 e8 f3 3b e1 fa eb 05 e8 ec 3b
RSP: 0018:ffffc900054ff3f8 EFLAGS: 00010293
RAX: ffffffff86e467a2 RBX: ffff88802bec5e00 RCX: ffff88803151be80
RDX: 0000000000000000 RSI: ffff88802bec5e00 RDI: ffffffff8fdd5930
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff8e3c3880 R12: 1ffff1100b9e9d0a
R13: dffffc0000000000 R14: ffff88802bec5e08 R15: 0000000000000820
FS:  00007f395df0e6c0(0000) GS:ffff8881259f2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f29938eb580 CR3: 0000000040c08000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 cm109_submit_buzz_toggle drivers/input/misc/cm109.c:351 [inline]
 cm109_toggle_buzzer_async drivers/input/misc/cm109.c:484 [inline]
 cm109_input_ev+0x1d1/0x3b0 drivers/input/misc/cm109.c:615
 input_event_dispose+0x80/0x6b0 drivers/input/input.c:322
 input_inject_event+0x1fa/0x310 drivers/input/input.c:424
 kd_sound_helper+0x101/0x210 drivers/tty/vt/keyboard.c:257
 input_handler_for_each_handle+0x101/0x1c0 drivers/input/input.c:2540
 kd_mksound+0x96/0x130 drivers/tty/vt/keyboard.c:281
 handle_ascii drivers/tty/vt/vt.c:2382 [inline]
 do_con_trol drivers/tty/vt/vt.c:2699 [inline]
 do_con_write+0x2f5a/0x5540 drivers/tty/vt/vt.c:3325
 con_write+0x31/0x2e0 drivers/tty/vt/vt.c:3661
 process_output_block drivers/tty/n_tty.c:557 [inline]
 n_tty_write+0xd4f/0x11e0 drivers/tty/n_tty.c:2366
 iterate_tty_write drivers/tty/tty_io.c:1006 [inline]
 file_tty_write+0x50b/0x980 drivers/tty/tty_io.c:1081
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f395e8ade99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f395df0e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f395eb35fa0 RCX: 00007f395e8ade99
RDX: 0000000000001006 RSI: 0000200000002080 RDI: 0000000000000004
RBP: 00007f395e943eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f395eb36038 R14: 00007f395eb35fa0 R15: 00007fff65968248
 </TASK>
----------------
Code disassembly (best guess):
   0:	4c 89 f0             	mov    %r14,%rax
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 f9 92 4d fb       	call   0xfb4d930e
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 40                	je     0x5b
  1b:	e8 0e 3c e1 fa       	call   0xfae13c2e
  20:	48 8d 3d 87 f1 f8 08 	lea    0x8f8f187(%rip),%rdi        # 0x8f8f1ae
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	eb 11                	jmp    0x47
  36:	e8 f3 3b e1 fa       	call   0xfae13c2e
  3b:	eb 05                	jmp    0x42
  3d:	e8                   	.byte 0xe8
  3e:	ec                   	in     (%dx),%al
  3f:	3b                   	.byte 0x3b


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
