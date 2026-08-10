Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7253A4505
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350093; cv=pass; b=tcT7vo2tPnDMjVrNGvfyHbgXPVfyP3C7DBrZEYbNPj0uPMQBwk0EnapCBDS7lhiI460mIuShKKxjnf2YYRTEObCFyHkplr2u1TrsbVukrL7S0CSTexBmVo5pMG/34RjDb/xOQH7lLHUl/hqRTbKUqIw3ca6GDkGRldZgu3wgO8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350093; c=relaxed/simple;
	bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GDeGdbr8Qbya9L7BxHuI/eQadx6xc/xLAEkBqzF867XwyEqiEcjO3OLo6jj7NYmIFZN0lDgozrLdZmXLg2k2q7dXhIrR0zYgcfU0ubPs5QyAppvT35AxSKDGm3vLg7mrAtSkHTtbqcZD4E4otdKj3uLxZ9Z8CfhfirMvsm7WYLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG1/yWpS; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG1/yWpS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-527e352a167so9310561cf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 01:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786350091; cv=none;
        d=google.com; s=arc-20260327;
        b=q5kWrCNIIrHVkInvJx7X5vd5LggIRuv69bPMKFgMznYJ7TubUPTdzrlBfNZtF1l26W
         3Zk1zIVKpeRN0iQJGvBwGvBjWsoN95s7IfRmNDMvdvVtYgK/Jr+PTwu/oqJeMvlIQYaw
         wal5ZyrnqjG2EPFrJCZTxALfUJGN4kUtHVos+spnwXeGSLA24RnActoId2/aarnQeHrm
         E8iewnERKkfAnA9+LVh+pmbs8qGNSChSSCXIz5JghNPlUXfcvkznkJqeQ1oWCbTtjl3N
         u1JFNvtbSgnwK5xlQZ8g43Nf0tMjHkY51OPnb3KqUE093PVjMNjUqDRCF67E7Y0be2ux
         /6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        fh=X4VIKKDxXzOx5jc4UtFFchivTBAHZmjWyNpD8BVZBAI=;
        b=cCHcsZUaRhhp1cCdOmrS4RJ5W7MEm7UAUjUqZFC0BvftxTRJQcHnaMbuPn19QgZ9VU
         GSNUzGX5Z+7dLgJEEkyA17+aBg4ZnOnn391RFI4KGHJ+ZkPppCmkA3R5dsrYmuT+5EVb
         eUclvODhhhi71OX2rSPiVXfyOjIHtQzqtDU6XG7QPOFS8qi6GQeLo1BoE33yAXAtTWdq
         1k7xp2IzC2g3RGK7A/OhG+wmTY2wFywW19X3Z4uRelHLq0PuZJ9NqMqqLp0X1v8qyyAN
         Ge4M1EC7ibrq2xcuGsGnZqiZF1Ot9/aoBbLR8lDEWqTShcRC07CofOesfPb0Xjxp30li
         /+XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786350091; x=1786954891; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        b=rG1/yWpSe3FrDw9dLGh40DhMM9JA2kUb9G9TT6FRm8CaxB5hRvXYdOUUj1EfkjWJwA
         bH9cCFai8BPV+5GVtRl1zCXhSrYfmLkuyA/mVmucsAQROQ9PHfu40wf4hfqcjMEMLJwr
         lgF0QkMt3lVyAT+2NLyZRAgFbcEQtUwE6HTAgPan4Fdjxm16lVTt6qfmSG345aitcKXf
         Tl45njv8ZpRhXR8jEwL9yYeqjryQSX21YVYqdAAyUhl4tTHxeu+TB7trhesG+DVwRLyr
         g0JweBjew3EbqzDW1P8pT/qm8UtbEk0u2HCrhR24rV77lASILVinErjpXN2uHWTCoF6Q
         l3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350091; x=1786954891;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        b=nEoKRF0iFCWpDbGw3DmplLkb9BzYen5Ei+ybHAjDMVDRlaeMUXOLZdBqSLJ+CQ+tdP
         Ql82f41GJscHpnLinO6a5SAJjE5yhqGEG+kEDtAUhI1DzckZyS//T9GJv1EW2PGFG5yP
         wjfoA0L0twZRHeuxpzm0PxNzbriY/qRNnbU6VyZe1hIHzBkGph93EvmlyeL+v5+SAE7v
         q0DNKni8nUWUnSvESCO0vCWqtkzeo6VntS0yQvCfzQHqwZ0nzQptoDYxo3LSxsee1Uow
         wYlBhqjIjjHeNul0NQbbFWTksi8dQiI42alefz6xCMkJXIg7Q3m8Xzl5AsLCQzIVldV9
         DC/g==
X-Forwarded-Encrypted: i=1; AHgh+Rqw2O/5RDgpqqD/jsqkWsBVCL502RgpNuPh2h3aaxO93Ws13ukt7JPsMzW1Cj+Ux77o4npmuzE42E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvE7yHb554xh2whQt56sNotmZcHK9/VTAjadi6K9Kt0WRzfLR/
	vX4aF6lUEVVntAXqjhSJ5+RGEtSPNkbWpqe2W4zq9NRDKGekiaCO88/2a/fiYm2L3JNG1krGAwO
	QWPlepqYEWSnjwM8APKkySUg86zw8yOo=
X-Gm-Gg: AR+sD12ZqqOBt3Qgzz7V1X1x8xbcc/gdIM0hriybftCGs4/+iNoIdoWpfZIXWa3E8rF
	Q/xAwhWHfhMUutCCUWu4xMvX/pumg4jEoLpsWuSDLr+JCZCwim6FSaWxrAdApIWa5INSz2s3PLp
	0Etmn4eCfMtsqj4ccEJVpDQa5IRLchkyglempK9F7RLOq9OD6qhx02wNG26kupXXYrvKVznlt00
	TCt+OlYkMNK67cCCG4AvCzIZpTGvyjirbAQMmYT5GLxNjEPuGCG+wXjYaSRHvKkqLZBkZKbawjj
	L2sVQaU9gBS1qM37+RKPee6TnYmstlhl2zCdV3W4MI/7fQ==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52ce5f44c7dmr409965021cf.5.1786350091277; Mon, 10 Aug 2026
 01:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 10 Aug 2026 16:21:20 +0800
X-Gm-Features: AUfX_mzKQypVMU99t1ppZCZ2EaFi-qQwwCo0qcg1KtKBkr3ieea5BotyUz7bCIw
Message-ID: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>
Subject: [BUG] media: dvb-usb-v2: gl861: WARNING in usb_submit_urb due to
 bogus control direction
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a WARNING triggered by a syzkaller reproducer in the
GL861 DVB USB driver.

Although a similar bug has been reported before, I can still trigger
this warning on Linux 7.2-rc3 with the attached syzkaller reproducer.

The warning is emitted from usb_submit_urb() because the USB control
transfer direction appears inconsistent:

usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
usb_submit_urb+0x117a/0x18d0 drivers/usb/core/urb.c:410

This looks like a driver-side control-message construction or
validation issue in the GL861 DVB USB driver, rather than a USB core
problem. The reproducer creates a dummy GL861 USB device, opens the
corresponding I2C device, and issues an I2C_SMBUS ioctl. The execution
path reaches gl861_i2c_master_xfer(), then gl861_ctrl_msg(), and
finally usb_control_msg()/usb_submit_urb().

In the observed crash, the driver submits a vendor IN control request
with bRequestType 0xc0, but USB core reports that the control pipe
direction does not match the request direction/length. This may be
related to insufficient validation of zero-length or malformed
I2C/SMBus read requests before calling gl861_ctrl_msg().

The system panics afterwards because panic_on_warn is enabled.

Reproducer:
console output: https://pastebin.com/raw/NDGEuRHC
kernel config: https://pastebin.com/raw/ysywjhc0
syz reproducer:

# See https://goo.gl/kgGztJ for information about syzkaller reproducers.
#{"repeat":true,"procs":5,"slowdown":1,"sandbox":"","sandbox_arg":0,"close_fds":false,"callcomments":true}
syz_usb_connect(0x5, 0x24,
&(0x7f0000000000)=ANY=[@ANYBLOB="120100024286bd10b00d815522f90102030109021200019ddb10010904"],
0x0)
r0 = syz_open_dev$I2C(&(0x7f0000000040), 0x1, 0x2603)
ioctl$I2C_SMBUS(r0, 0x720, &(0x7f0000000380)={0x1, 0x10, 0x0, 0x0})

Kernel:
HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2-rc3


Crash signature:

WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
usb_submit_urb+0x117a/0x18d0
usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0

Call trace:

usb_submit_urb
usb_start_wait_urb
usb_control_msg
gl861_ctrl_msg
gl861_i2c_master_xfer
__i2c_transfer
__i2c_smbus_xfer
i2c_smbus_xfer
i2cdev_ioctl_smbus
i2cdev_ioctl
__se_sys_ioctl
do_syscall_64
entry_SYSCALL_64_after_hwframe



Thanks
