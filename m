Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611609;
	b=TAwxBzc4MNBbqbhI35+GzQZJqymPCAZzuGMaKe65KTCemq/xFDJMrAwjtfNYQ7JzlmQw
	 yEe91t4lJpPi/F3y5azUh+KRtrgyTDVZYb/dAiVUSVIgugZGKOSLLyRbuJJ5hDNfezSMI
	 o2YAzVm8GqPDjgpsww1RILTHqPxJnYw4ln9WREmlaYqxEXUmH0zXAHFF+C6MQolms/WME
	 WgQjcBo2nMPs/rX7vpy+ilMw1u0SBaQr9x/Apnkbs1PBhgWyANA7E4AHf7njSjPWSE+FU
	 JMHyd8jpCBQKwKrvXXByXKuZNc2NmBExDfnBfLoxc38MNMYfpKeZYhpN0n1uIeHFu6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5t9V7k/rR7NsYr1V/gxNnZPohgQLR8S9QEvXnEK8w4A=;
	b=Wk847D6oVB5c+qpeZ43SseLYXo6RT1OA08V65eUmnY9bymmw1Xa+YtX1vYXcoE+5RAwI
	 8uIYdueCImRQijcT+YEyG5hPR28KKbhR4OW6TzNIWiHArXm2yzPWSDOzqB1yLtIomLcQu
	 oldGhdW59/4hUtGHWhItu3xSdbVriNQvXuu75gzlUuUNzQSZ9nbm+bCdl0ppQNdA/5SZs
	 n2p7N5e5dQjaaaVd6mhqmlDlgrSGxRmx2ZHHAzZy1dfW4JiRfMG4PHXi6tTLJPdxSbAIE
	 5B/1C4ROpfPBMUSzfw99UWe2K6a/WHbwZ5A6c/0bQsXk8ZPXGZ4Y4gh7dLl2ncvmkvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRot9M5c;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDE606A6A0
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 13:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFDE606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRot9M5c
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so7987088eec.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611608; x=1796216408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5t9V7k/rR7NsYr1V/gxNnZPohgQLR8S9QEvXnEK8w4A=;
        b=wRot9M5cgnILfqNbhJNcv82d5Tl77Skfl/zAELa+sVXR8em1WbUm+/QeqZS35QCVzI
         +O2owPM9C7xGPGWqVGHTJ56arbgViaAeBXc1N7+zkz4iFRMEFJV1NMFbYU5m4rSwHh9H
         Z7x2Iaw21oCZz/QeWdjcrD1jbBltF1LxqzycEgMjoLTHxIk7JoYj1Y6IvBpgbF4VlwvS
         edsSvs+h8ZJA0BuvrRtp8AjoCElSwBbNrIr/6DvKeeEIAgWQUStW5+K0xn1JanvI3QEc
         niKHyC+oVzWHUcgeSMUU+lUG8Mk5x0/1hdcF5AFdMgXuvCpc/TCx99IvzdnTZDgFjJHv
         9lZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611608; x=1796216408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t9V7k/rR7NsYr1V/gxNnZPohgQLR8S9QEvXnEK8w4A=;
        b=ZfUg7UiIlmUu7zdhmjjY/VEbe8UvhJdlDl3ONwxOZZlE+arN83CEVufzJ/qDOU8GSm
         wQ7Ul1MhNVblKGKKNvjLVgwhmqR++as4/FeiIrertXt7BdOsSStEP1crfLXYdIAQybNd
         bZJ9EF+gxISf9ntKAhfhpTVewaiffc8CRX6Vg8Hz2T8PwfVQgnCaOvI/pO3tJYTqoPCe
         wSle72/PArHmlakbMjnzQ2eh6PW4ngtMs1nMrsyea4VXsj24qiWHBCr/g+1WxO5dRjT+
         EBQlPzqt22zrNaaff6STxsprILy5QfQ0nPz/YHLDKEeDDJ93E037kdg+xNAohNf44hQr
         67dQ==
X-Gm-Message-State: APuU4Z9RPrfEuOZXulRobkBGWsdlycZes6LiAFxS2z8uYflO31c31Y+Z
	CaMfrQaRBqPjwz1oyN7EMo9AgO/DRlMnnwtrYDxQmsVEAsUMWdBgC2zdlwHt+CXy0KDnfK15hBA
	=
X-Gm-Gg: AZFdTZeQE/JgWTAD9WE2l/4u3E3EhIXGoPhn7WNBjuDQpe9toSBMrF9j7j96nTJxq5O
	Amt/KnF/4Ax56stbmJ1CC+6VZP+aSwHEVvi8y8p2w1upgyHHpOC5nBlGd26C3IeLO+N/Ndl4xp1
	bAuGjCPiIHiM74U79CzuNYL8KSHPkl5fqThDfKlO1zAaGSAYSXk/ofkIEMZeyDXftc6FPKFVOeu
	Uggie54pzHl5CflVy0BU0aOVa1zOYsamOQFMgx5yNOFKdXX2wkELQcrKbAzN/S9zrAV/sL+Qg/7
	QkRV3Q2wLgi9QF66eQVPBdv5aAuNuPwtTpIobaYCnRcvoYo4+3iPvOqxNDpoMvHlGzjtqFD+U6V
	KgVTIBWiAvqcoGOtZv6RwBmvw6az9cx2XmuksYrOFsI14i32b/o+EwLU2LzH/wopXyTOCtjZ0Up
	wDqarVq9EP0l9I9D5WPFc/9YIp3XwraGZAFRPPZpVWxC6lU5u0bWvLQ/axwEJjWGqaEsalCz+V0
	eK62ZBn0uhXCVBzbwxplEI2a+OqwGNLVnMJYZ8UQ56knDxCKHukgaFCBrAFQ7HueyuSwnh2s+XW
	9mW1/cvbvx5yWOZQ7VwRIT4P4ffIrFh+plMX2lEb+Ak3JMNE9d+t290l5bBczVlRBLu5IoA8Gm2
	H7qJOfbzfXqYHwbcKagESjENnPFpsRb8RDQZrI6sCdJFOMn5rnQ3lTf3GII3iIETnixYYo4JhIP
	T88Np8DJswkUx+drwXhBuyAS+bApwNwQdlidqCJKHeLDs=
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr251898eec.2.1795611608231;
        Wed, 25 Nov 2026 05:00:08 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-125-69.ap-southeast-1.compute.amazonaws.com. [47.129.125.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm56452176eec.28.2026.11.25.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:00:07 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: linux-usb@vger.kernel.org
Cc: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: [BUG] thunderbolt: request work may outlive control channel teardown
Date: Wed, 25 Nov 2026 21:00:00 +0800
Message-ID: <20261125130000.475-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found a possible lifetime issue between asynchronous XDomain response work
and control-channel teardown. The source path below is from Linux v7.4-rc1,
commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.

Source path
-----------

An incoming XDomain request is scheduled by `tb_xdp_schedule_request()` in
`drivers/thunderbolt/xdomain.c`; its worker is `tb_xdp_handle_request()` at
line 762. For example, the `LINK_STATE_CHANGE_REQUEST` case at lines 896-906
calls `tb_xdp_link_state_change_response()`, which sends the response through
`__tb_xdomain_response()` (line 608).

`__tb_xdomain_response()` allocates a `tb_cfg_request` and calls
`tb_cfg_request()` with no response buffer. In `drivers/thunderbolt/ctl.c`,
`tb_cfg_request()` schedules `req->work` on the system workqueue at line 570.
`tb_cfg_request_work()` at line 527 invokes the callback, then calls
`tb_cfg_request_dequeue()` at line 534. Dequeue reads the raw `req->ctl`
pointer and locks `ctl->request_queue_lock` at line 161.

The teardown path is separate. `tb_domain_remove()` in
`drivers/thunderbolt/domain.c:501` calls `tb_ctl_stop()` (`ctl.c:750`), which
stops the rings, warns if requests remain, and reinitializes the request-list
head. It does not cancel or synchronously drain every request work item on the
system workqueue. `tb_domain_remove()` flushes `tb->wq` (`domain.c:510`), but
the request worker uses the system workqueue. The domain release handler later
calls `tb_ctl_free()` (`domain.c:317-322`, `ctl.c:704`), freeing the control
channel. The host NHI PCI remove path reaches `tb_domain_remove()` through
`nhi_pci_do_remove()` in `drivers/thunderbolt/pci.c:594-619`.

The request kref protects `req`; I do not see a request-held reference that
pins `req->ctl` through dequeue. A delayed work item could therefore lock a
freed control-channel mutex. The `ctl.c` and `domain.c` blobs at this baseline
match upstream comparison snapshot
4dce97c6c265544342e716e62fd24bbb232590c5.

Reproduction
------------

The attached `thunderbolt_test_injection.patch` adds a test-only built-in hook.
It creates a minimal `tb_ctl` and `tb_cfg_request` with the real allocator and
enqueue helper, reinitializes the request-list head, optionally frees `ctl`,
then directly invokes the real `tb_cfg_request_work()`. This forces the
lifetime order; it does not call `tb_ctl_stop()` or `tb_domain_remove()`, queue
the worker through the real system workqueue, send an XDomain packet, or use a
physical Thunderbolt/USB4 controller.

The attached `config.selected` is the complete x86_64 configuration used; it
has `CONFIG_USB4=y`, `CONFIG_KASAN=y`, and `CONFIG_KASAN_GENERIC=y`. With the
attached patch and config, the build and QEMU steps are:

```sh
git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-tb-repro
cd linux-tb-repro
git checkout 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
git apply thunderbolt_test_injection.patch
cp config.selected .config
make ARCH=x86_64 olddefconfig
make -j"$(nproc)" ARCH=x86_64 bzImage
qemu-system-x86_64 -m 512M -smp 1 \
  -kernel arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
  -append "console=ttyS0 rdinit=/init panic=-1 thunderbolt.test_request_uaf=1 thunderbolt.test_drop_ctl=1" \
  -nographic -no-reboot
```

The attached `initramfs.cpio.gz` contains `/init`; the hook runs at
`late_initcall`, before userspace, and the initramfs is only needed to complete
guest boot. For the control run, repeat the QEMU command with
`thunderbolt.test_drop_ctl=0`.

With `test_drop_ctl=1`, KASAN reports:

```text
BUG: KASAN: slab-use-after-free in mutex_lock+0x74/0xd0
tb_cfg_request_dequeue+0x3e/0x1a0
Freed by kfree in tb_ctl_test_request_uaf_init()
```

With `test_drop_ctl=0`, the work runs before `ctl` is freed and the guest
reports no KASAN issue. The attached baseline and control serial logs contain
the complete output. These results establish the UAF for the forced ordering;
they do not establish that a real peer or ordinary user can cause that order.

Could you confirm whether another lifetime or serialization guarantee covers
this path, and whether a supported controller can reach this ordering during
NHI removal? If so, what is the preferred way to drain or pin outstanding
request work before freeing the control channel?

Best,
Bin

Attachments
-----------

- `thunderbolt_test_injection.patch` (test-only hook)
  SHA-256: `77EBD027C6D35C3CF78897062237DB20678E642AB253EDA52064BCA101EC74B1`
- `config.selected`
  SHA-256: `6509D7B5631DC0282B9E3BD2BCC44ABB3C8517DE321EA4D895DFC62B5B38FFD3`
- `initramfs.cpio.gz`
  SHA-256: `C7D2E02BACC581D762BA096ECA73A7C8D94F3EBD82C592D6637B00DE264B13E8`
- `baseline.serial.log`
  SHA-256: `132D84FDDCA7BE7E8FD31A02FC847E7950753F1FC7401AC19ECE02483E588B4F`
- `control.serial.log`
  SHA-256: `9D7C27E5D0F0B2E38A10155BD868DD323D75E02015EF453DAAAC6FFDEC290253`
