Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862344071D8
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780795924; cv=none; b=oLK4tKYsvtvqY+ebtAjbUOm8EqKBHG6OYU7OwkkWxFmcDCTAy1iJe4V+bAGzR7qT8lV2WVPg7T1VOmon/i571sOg9M9IIgZhPLZUeRqaeOtoaarU/48A8G8/uVYqxqgEWuABllOXInm/gq2At19xvj4Ms8JNGjoGmIQAMP4QxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780795924; c=relaxed/simple;
	bh=XJRqPF8VxSL9nAm2jGqjG9gDvQWc6lnPFMJgaep2diA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=P2fq378T8QAdEoRVHe8FY72IvwkbKlQFD3/s/btJG8jqPYqIKlIBXnRFJD8GPliXmB0VRObpe2GpQz2oUZJ+Ow85cYHFjwZ4VeSh71GdmGYGpkDPdwHzb0twouIedWMUY2UbwP5bwC0YGlY5cEW8fYvk62GoXqoy+j+nAZcGQzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuAhGRhm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuAhGRhm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5176465a4a4so44739971cf.2
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 18:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780795923; x=1781400723; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XXlNSnnE3fF67RX02UWYXfuuGDkJJt09Ol70L7V5wE=;
        b=HuAhGRhmCaIbXtAo0jzjBNB2nakhi5QQN/eIF4/9aLeXLYBJWf4dNoomunCBZ+mczU
         AcZdHESsjEq+y74QFbMVBo9MhHsE5HHdqNkeOM9FfYKy52hOU7NuCzMrjmpP/dL8hc1y
         eMS06QSe8dD+KU48IZ7VgecUPwkQJTC0w8QQWtUd3KQyMnHk6QILGt8TFRg+lEWE0Tmw
         +PLkfijs7VM+yg68aYsBsWf2aoenNTKTmMCYW+sJNx6GSehhhJjepvbkn68lwBLAz9Ec
         LAFbzqfBygKfWdn/P5uZcFZaFJs6qjO65pK+CRm9FF+gT1dnv2Agnj9a19kPshhPtwPH
         hNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780795923; x=1781400723;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6XXlNSnnE3fF67RX02UWYXfuuGDkJJt09Ol70L7V5wE=;
        b=pJ42hBE1ePQWwQhP/lkiITMP5QyAWh+teBeEkUsdyIbNqfh+sV8gJrM0YbNgxgRJrR
         RIjzVACmubChRlajbiaA9/r8PkZdku+RufJaOKmOt1xtV9ygQEDmp641hvrx/x5452OW
         hUfAJSYEBeW/v4n/Ap0LspsJiDKKgraHDa82jAmXtyWweOTCOdNhePrAJwRMq6ucMQpT
         Q+887BHqnRRNiX8AKysYuYR7riBNPDDXVh5mr/87A4y29eTfrAgGsh/wh4fTzNUy36EY
         Z6awpXl+UJRrx4RM4S19MF2vtLC30Q1RgOvHjkKujH747P4vuqL8hSSjjd6aQeOkieGj
         LT6Q==
X-Gm-Message-State: AOJu0Yz+UR3aPxlNkduqyGZ7iwEo8MQr1U4c5yhZJOc7jC5+5fwI0pbT
	p65JYSepk8p+ajn6lSQnrmRqm2lfif8zHhU2Fg9ITks3d3wb8ZfO/PmB
X-Gm-Gg: Acq92OHeMpfVNuGRy1imecnNDvVlp9im1pn8ybuhcGADTZxYSdELBKiCTdCqGto9XAX
	QmHT60OYzUx9KSSINhouqmS/rHv39F5V8rRUwHeU/ZeeeSIJZk24RnFmsJJJXjueGNTgMP0I4o0
	cXzilfr1+j2qVD3T8USOnCJepQhlXbWJ0GIRylToE28NtJXM89SLp9cz2VboDKoBgLhzQqREOQu
	+92oT0egZcGI7GevBuBuoITdhjEzngSLv2ze+faFvyqcUpeMKAYY9uvOuXnY3qNRw3KsD2wo3+O
	k3cppRevoS8FCr4qL3ijAO3vmb4KvtftLNuBuA0iunvYv+AQaLt4VawBXN2chP/Z1nywrWS5+3u
	1q7WsR5X/NVUDcCprMXFD2RVgpVKDtjfecG9d1tiY64UaaXCXroMfXihHMujLSb75CYJ7ki/iD6
	2I5eZRq/+lUFEu2rNB1XusHWfgiseYWap0BvR90TTO1DDkzFRS7N1ndQGbIvp3ayw5x7bAuFqng
	5o=
X-Received: by 2002:a05:622a:250e:b0:517:6350:ed4b with SMTP id d75a77b69052e-51795c686a3mr142771961cf.36.1780795922637;
        Sat, 06 Jun 2026 18:32:02 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:5506:f6a8:9fb3:53d7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c29360sm113624761cf.7.2026.06.06.18.32.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jun 2026 18:32:02 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-Id: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
Date: Sat, 6 Jun 2026 21:31:30 -0400
Cc: linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: keithp@keithp.com,
 gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi Kernel Maintainers,

I hit the following KASAN report while testing current upstream kernel:

KASAN: slab-use-after-free in dev_driver_string from chaoskey_release

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/167620d391d9634107bfe4d784fcf52b

I=E2=80=99m happy to test debug patches or provide additional =
information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>


[ 2019.816807][T10106] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 2019.819081][T10106] BUG: KASAN: slab-use-after-free in =
dev_driver_string (drivers/base/core.c:2406)
[ 2019.820996][T10106] Read of size 8 at addr ffff888168e8a0b8 by task =
chaoskey_raw_re/10106
[ 2019.822432][T10106]
[ 2019.822899][T10106] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[ 2019.822904][T10106] Call Trace:
[ 2019.822910][T10106]  <TASK>
[ 2019.822915][T10106]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
[ 2019.822932][T10106]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
[ 2019.822984][T10106]  kasan_report (mm/kasan/report.c:595)
[ 2019.823015][T10106]  dev_driver_string (drivers/base/core.c:2406)
[ 2019.823021][T10106]  __dynamic_dev_dbg (lib/dynamic_debug.c:906)
[ 2019.823282][T10106]  chaoskey_release =
(drivers/usb/misc/chaoskey.c:323)
[ 2019.823290][T10106]  __fput (fs/file_table.c:510)
[ 2019.823298][T10106]  fput_close_sync (fs/file_table.c:615)
[ 2019.823320][T10106]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 =
fs/open.c:1492)
[ 2019.823327][T10106]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 =
arch/x86/entry/syscall_64.c:94)
[ 2019.823337][T10106]  entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:121)
[ 2019.823344][T10106] RIP: 0033:0x7f52411ffc03
[ 2019.823352][T10106] Code: e9 37 ff ff ff e8 2d f9 01 00 66 2e 0f 1f =
84 00 00 00 00 00 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 03 00 =
00 00 0f 05 <48> 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c =
24 0c e8
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	e9 37 ff ff ff       	jmp    0xffffffffffffff3c
   5:	e8 2d f9 01 00       	call   0x1f937
   a:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  11:	00 00 00=20
  14:	0f 1f 00             	nopl   (%rax)
  17:	64 8b 04 25 18 00 00 	mov    %fs:0x18,%eax
  1e:	00=20
  1f:	85 c0                	test   %eax,%eax
  21:	75 14                	jne    0x37
  23:	b8 03 00 00 00       	mov    $0x3,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		=
<-- trapping instruction
  30:	77 45                	ja     0x77
  32:	c3                   	ret
  33:	0f 1f 40 00          	nopl   0x0(%rax)
  37:	48 83 ec 18          	sub    $0x18,%rsp
  3b:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 45                	ja     0x4d
   8:	c3                   	ret
   9:	0f 1f 40 00          	nopl   0x0(%rax)
   d:	48 83 ec 18          	sub    $0x18,%rsp
  11:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
  15:	e8                   	.byte 0xe8
[ 2019.823358][T10106] RSP: 002b:00007ffd4b423688 EFLAGS: 00000246 =
ORIG_RAX: 0000000000000003
[ 2019.823382][T10106] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: =
00007f52411ffc03
[ 2019.823388][T10106] RDX: 0000000000000000 RSI: 00007ffd4b421570 RDI: =
0000000000000003
[ 2019.823400][T10106] RBP: 00007ffd4b423af0 R08: 00007f52412a3040 R09: =
00007f52412a30c0
[ 2019.823404][T10106] R10: fffffffffffff639 R11: 0000000000000246 R12: =
00007ffd4b4238f0
[ 2019.823408][T10106] R13: 0000000000000003 R14: 0000000000000000 R15: =
000000000000277c
[ 2019.823417][T10106]  </TASK>
[ 2019.823420][T10106]
[ 2019.842033][T10106] Freed by task 10106 on cpu 0 at 2019.816700s:
[ 2019.842461][T10106]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
[ 2019.842793][T10106]  kasan_save_free_info (mm/kasan/generic.c:584)
[ 2019.843137][T10106]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
[ 2019.843463][T10106]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[ 2019.843736][T10106]  device_release (drivers/base/core.c:2562)
[ 2019.844053][T10106]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 =
./include/linux/kref.h:65 lib/kobject.c:737)
[ 2019.844368][T10106]  chaoskey_free (drivers/usb/misc/chaoskey.c:103)
[ 2019.844696][T10106]  chaoskey_release =
(drivers/usb/misc/chaoskey.c:315)
[ 2019.845038][T10106]  __fput (fs/file_table.c:510)
[ 2019.845322][T10106]  fput_close_sync (fs/file_table.c:615)
[ 2019.845651][T10106]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 =
fs/open.c:1492)
[ 2019.845981][T10106]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 =
arch/x86/entry/syscall_64.c:94)
[ 2019.846302][T10106]  entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:121)
[ 2019.846708][T10106]
[ 2019.846874][T10106] The buggy address belongs to the object at =
ffff888168e8a000
[ 2019.846874][T10106]  which belongs to the cache kmalloc-1k of size =
1024
[ 2019.847827][T10106] The buggy address is located 184 bytes inside of
[ 2019.847827][T10106]  freed 1024-byte region [ffff888168e8a000, =
ffff888168e8a400)


Best,
Shuangpeng

