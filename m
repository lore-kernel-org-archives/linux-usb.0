Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508CA442FB3
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773156; cv=pass; b=lAIxzMbWLRSreKCr6X1Cd2mJjyTEXockWXYnOXXGSjF6gLueNK5b3YXTX3VmboPIDVeog8idMosRVOinysKO72LpVkhK4znVpyzgsAS76pl4gMyfFo477sKps/SgB2ZKa48RHGI/Uq5/C2/9IwN0aKzxGQ4tOA3EA+jhppxLEAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773156; c=relaxed/simple;
	bh=/SeIFBGkz1Q+ZG/ZHUhvKV54Zk/HkDSjL/ijrg90hwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bA5eGUDoJqbyVBpo0+dfU6tMooCpMg/H6Z7gfIWFOeaSj6IcjQUZyXdLZTCIHEj+s7qgNJBa0BI94d+3yfgyTk2EzjDw//o103m0uifirnmvJWN4xdijuoI+nbmgOpq7sK+FgvuPT12mYf0UEYMF1L2BwRsIg8GJThJmikOt5iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WvlGCivx; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WvlGCivx"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b145a9623fso1534022eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 02:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773153; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTRYD8AC3PHSpBcwHY9VhmlUl2IKtc+XQ9xWxOUObapfKrP7Ky7diU9SSl0uNbpuGo
         1NVsts6EmxBGepgpE5Ic+Eq3TO58irEhLPCXPZjv9S1/czBC1Cpca4QPNUJe7VWxVchP
         r7mVtwn6EYMOftkt9KaDDdpSqfWzvAO+2tn5R6tAjbOwF82axxaQXSeMkeL43EU7vhcM
         0VhdroP778XgdB5b/SE9nbb6q8YAKlENY+usPWvyuCjP6n2LBq8LhMWF1I04mkKOWQhI
         3sPOw+cM24UotL15okET7fY+FtptdqZCAFIpQSgn4zNaOWHg3popRsCq6kwXLeqnE1F+
         fj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rLM4vAUefvxFAU5RAfDUlR24EEWz9AmPJFTVppxjRbA=;
        fh=+Gk6HvxnL4iOhwOVozieHrk8dtdEycNbSwswWIsDszs=;
        b=seS8GAG12VAt29A3Exz8VBZoy47SGFqKi0HZOEOk5/WPdAPkRFzn5s5FgovOYktCab
         8pSYOC51DVGKK3nSsSk90NxWwm8/IGRJGrPuhj+k3cwLogPzX4GyjAnjITFvxFETfDNi
         XMYxal5QTa/swI6hZ4Zvgw5MJuX7tIb2w4SYrd7KWaScgHP/vmIGsT/vPBLf2pTMrwrR
         FNLjD9JGOxQQGm46ybG1R9H4Imj90qmkwOee6A495NtYmPQe3oj01jsPoGmb5tue0aXI
         4mz0b8qMJ/WcdaJOvyvK6tvrx06c4gVofQKzkph3d7j/OkVGBQ7YUsEXPWsf/kpYv0yC
         3akg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773153; x=1789377953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rLM4vAUefvxFAU5RAfDUlR24EEWz9AmPJFTVppxjRbA=;
        b=WvlGCivxOlxJ0ayYRIR/CejvTQjOyWvlXUYIe6AIvYR6OBfpegYi+tU345ZHo0wc7w
         lta6SrD+Mxa7tjBOLapakZ6fTuNNbDKquNOb27yL60iD0VrUzFAsD6MBRpxZIv7ZZ3Qe
         NT4YqEp0TcIk/czebzRsQESe2QpPqZj1oMx6YDgVCwQQ91+XzlqwUW6hOYyQDITah/O8
         lcjmWEDgkH/vqN5CTxrpE7BvVDAMChICwo9tG1Llq9QlqSeVmt0SPkc/KrXRw8rTtpWc
         4chRkjbOuDcSflzyHuVpsPCE2PoDDudHR3neXq9ARaPZYl1M0sskntSGiW30OJYoymMj
         IjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773153; x=1789377953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLM4vAUefvxFAU5RAfDUlR24EEWz9AmPJFTVppxjRbA=;
        b=kFH6jsDBq4bttayRY99qexOrZk912kJ1I1a00V8IsAuFNWXzcFHhOu5P8+IuJXqIwp
         KNTmOPxo+8FWWDx9lLDYNRu0H9uL47CoVN36BlP+8+pBLjiSmKs0gZxT994lez/WKWN/
         azc7SD2EUldaxENmUO6eBuUeSPNMEjZkSEbtW14sDSGnqdfU3JU0lgEcH+UvF9gUIgLR
         DUq6ocm8cj6MuldG9jqggtEicGF5rGvk8FJeeAhSUcH+YqTB7geYAeRS3oKIRTNCW0ms
         JERztITEjl89PlPC9V3nQazjqdjC8SV+ieW0pI3npk2o14lH+Ss9lPda6EG40ApzmNm5
         A6hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQQUCahsNRq+UV3KiaE+w+zTGWSHhFn8CyON9b+auWIWD31D69z58V+WhTbjvngwh2LtR9op6qXo4=@vger.kernel.org
X-Gm-Message-State: AFuF++kaBH6MjRYszUjGfGDIQlbbNtCo1RqhxAjDUe4psvp2/KXysjo7
	/dfy/wZgcNmRjoDGAy+w7Srguf+N1d8NK+P+D9s5ocb/W+9DdXE+JLg4M0qOk6mLZz4x9IW+lJz
	6kYg7w742fi/XOM8xDohNsng83is6IdYG4PQxl7xD
X-Gm-Gg: AYBFou0Z0CP1dJaCzgeQBjXM8IJtJU5gnYKV3n9v/rXE62GsIfFYMY95hgEBWPSDVEP
	EctZw1PTY+xctRqaACmoasD2/qceokJwqOuWaB+O+UbBP9Hiuod8HOcKPSOEDq3K9kwZkTfxmka
	0DbUDTdZsRqEQ9QBPaCNIBz0CgBi9JCNJZMX0f+7Ls4yST8OXJwHCWMGPeBjIkl7clxGngqkPJD
	b9eO9FqeewApmU0LTiVB8l//zNsWrHvue5LcZRgmwniu5yaFxLNtLfjVo1Ncxh8Xk6pOmV2XzbJ
	qMrbWfJYalN7uyedeO7Z4cJSKOYPopNviJWNOKUyJOBZ/6sOoMBBb6T0j/jmxczhHzudv0RWXjT
	82zQe7h/92ubfZT9HSLYiYwnMqS5iRrF4YovG7JPgTue7+do4e+Dh9w0I7gmhFM9NVZKaJiWEul
	k98eMo/mh7XE1DnA==
X-Received: by 2002:a05:6820:4dcb:b0:6b7:8396:f3da with SMTP id
 006d021491bc7-6b78396fa3bmr10320241eaf.60.1788773152456; Mon, 07 Sep 2026
 02:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a9087a3.4d659fcc.734b4.0012.GAE@google.com>
In-Reply-To: <6a9087a3.4d659fcc.734b4.0012.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:25:40 +0200
X-Gm-Features: AcwNN1VXdsEcPIWp1jyXHGRh1btqFyG_jMQv1JAHCtZhxjZUIqd9LZzwh32CvrQ
Message-ID: <CANp29Y4vUb75Ovz0oD-p3+J8QOg8Ph4gD4OapN_OYn=e2-gQzg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in trigger_card_free
To: syzbot <syzbot+a149ad38eaf1930d3e31@syzkaller.appspotmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Thu, Aug 27, 2026 at 8:53=E2=80=AFPM syzbot
<syzbot+a149ad38eaf1930d3e31@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    2709dd5ae32f Merge tag 'sched-urgent-2026-08-22' of git:/=
/..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D17f7a41558000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db0978f5ed2905=
b98
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Da149ad38eaf1930=
d3e31
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15418979580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/1b8578cfc5d0/dis=
k-2709dd5a.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/08516f9ee501/vmlinu=
x-2709dd5a.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/94796f512f2e/b=
zImage-2709dd5a.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+a149ad38eaf1930d3e31@syzkaller.appspotmail.com
>
> INFO: task syz.0.17:5991 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.0.17        state:D stack:25192 pid:5991  tgid:5991  ppid:5810  =
 task_flags:0x400140 flags:0x00080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5520 [inline]
>  __schedule+0x1259/0x6920 kernel/sched/core.c:7270
>  __schedule_loop kernel/sched/core.c:7347 [inline]
>  schedule+0xdd/0x2c0 kernel/sched/core.c:7362
>  schedule_timeout+0x1b2/0x280 kernel/time/sleep_timeout.c:75
>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>  __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
>  snd_card_free sound/core/init.c:665 [inline]
>  trigger_card_free+0x127/0x190 sound/core/init.c:868
>  release_nodes+0xa5/0x120 drivers/base/devres.c:546
>  devres_release_all+0x112/0x180 drivers/base/devres.c:576
>  device_unbind_cleanup+0x81/0x270 drivers/base/dd.c:597
>  __device_release_driver drivers/base/dd.c:1354 [inline]
>  device_release_driver_internal+0x4c4/0x620 drivers/base/dd.c:1372
>  unbind_store+0xf8/0x110 drivers/base/bus.c:244
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6af/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f948ef9e0d9
> RSP: 002b:00007ffeb02836d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007f948f225fa0 RCX: 00007f948ef9e0d9
> RDX: 000000000000000b RSI: 00002000000002c0 RDI: 0000000000000003
> RBP: 00007f948f035024 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f948f225fac R14: 00007f948f225fa0 R15: 00007f948f225fa0
>  </TASK>
>
> Showing all locks held in the system:
> locks held by kworker/u8:1/13: 4, last CPU#0:
>  #0: ffff88801c08c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: pr=
ocess_one_work+0x1466/0x1b10 kernel/workqueue.c:3362
>  #1: ffffc90000127d08 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{=
0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3363
>  #2: ffffffff8ec7a830 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_disa=
ble+0x12/0x20 kernel/jump_label.c:247
>  #3: ffffffff8ef3d400 (jump_label_mutex){+.+.}-{4:4}, at: jump_label_lock=
 kernel/jump_label.c:27 [inline]
>  #3: ffffffff8ef3d400 (jump_label_mutex){+.+.}-{4:4}, at: static_key_disa=
ble_cpuslocked+0x110/0x1c0 kernel/jump_label.c:238
> locks held by khungtaskd/31: 1, last CPU#1:
>  #0: ffffffff8ede9d40 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire i=
nclude/linux/rcupdate.h:300 [inline]
>  #0: ffffffff8ede9d40 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock incl=
ude/linux/rcupdate.h:840 [inline]
>  #0: ffffffff8ede9d40 (rcu_read_lock){....}-{1:3}, at: debug_show_all_loc=
ks+0x3d/0x184 kernel/locking/lockdep.c:6793
> locks held by getty/5355: 2, on CPU#1:
>  #0: ffff88803848c0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wa=
it+0x24/0x80 drivers/tty/tty_ldisc.c:243
>  #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_r=
ead+0x419/0x14e0 drivers/tty/n_tty.c:2211
> locks held by syz.0.17/5991: 3, on CPU#1:
>  #0: ffff8880302a4460 (sb_writers#8){.+.+}-{0:0}, at: ksys_write+0x12a/0x=
250 fs/read_write.c:739
>  #1: ffff8880273d4080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter=
+0x2c2/0x5f0 fs/kernfs/file.c:336
>  #2: ffff8880338ca138 (&dev->mutex){....}-{4:4}, at: device_lock include/=
linux/device.h:1104 [inline]
>  #2: ffff8880338ca138 (&dev->mutex){....}-{4:4}, at: __device_driver_lock=
 drivers/base/dd.c:1171 [inline]
>  #2: ffff8880338ca138 (&dev->mutex){....}-{4:4}, at: device_release_drive=
r_internal+0xb2/0x620 drivers/base/dd.c:1369
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/16/2026
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:123
>  nmi_trigger_cpumask_backtrace+0x21f/0x2a0 lib/nmi_backtrace.c:66
>  trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
>  __sys_info lib/sys_info.c:157 [inline]
>  sys_info+0x141/0x190 lib/sys_info.c:165
>  check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
>  watchdog+0xcb1/0x1030 kernel/hung_task.c:561
>  kthread+0x373/0x450 kernel/kthread.c:436
>  ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(ful=
l)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/16/2026
> RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
> Code: 08 a1 02 e9 43 4f 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 83 e0 21 00 fb f4 <c3> cc cc cc cc=
 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
> RSP: 0018:ffffffff8ea07cf0 EFLAGS: 00000246
> RAX: 00000000002e8403 RBX: ffffffff8ea91500 RCX: ffffffff8bc9c115
> RDX: 0000000000000001 RSI: ffffffff8e3dfa2f RDI: ffffffff8c619080
> RBP: fffffbfff1d522a0 R08: 0000000000000001 R09: ffffed101708678d
> R10: ffff8880b8433c6b R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 1ffffffff1d40fa2 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff888123b88000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffe96a6cff8 CR3: 000000007cb49000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
>  default_idle+0x9/0x10 arch/x86/kernel/process.c:768
>  default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
>  cpuidle_idle_call kernel/sched/idle.c:199 [inline]
>  do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
>  cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
>  rest_init+0x2d3/0x2e0 init/main.c:723
>  start_kernel+0x48e/0x490 init/main.c:1181
>  x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
>  x86_64_start_kernel+0x12b/0x130 arch/x86/kernel/head64.c:291
>  common_startup_64+0x13e/0x158
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a9087a3.4d659fcc.734b4.0012.GAE%40google.com.
