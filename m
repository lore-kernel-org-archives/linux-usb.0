Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824A3E0255
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168393; cv=pass; b=iBKPzEuk5dTs2lLnt/SzALDm0od/s9sTUbwl+cY1UjAX3NZpph4UTqj7Ug8NfKSiwo1oWPbZpwjU1Q7iMcCFr23ct2QPtStmawKj4vmHqGDxHGKN6elksq+PdsvT2Q0I47RRHrOVDXZhKxARWET6Y5K94DRPsvGtEdxB/n+q6+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168393; c=relaxed/simple;
	bh=GBTgWejtGdJAKdiFr7UJ4AwaGexhIKwa4b9R0XxIbeg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJroMaHgkSYM/4YCYMOeqr9W8ecnfk7lAmWcsTWIqctuOtlN2zzuuajIS8CcZ+G7/gtypZHy/h5KuB6kOWvZ0E4EyP59MHl7IRu4lNjYeFtyjVJK5k3GLQgk1WlW1rJfvtEcxaSSJDTkb2Nz4tCydWoPTOXBzS3ltpUMQER5GCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1k/CVsK; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1k/CVsK"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c08df8513so20598641cf.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 02:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168390; cv=none;
        d=google.com; s=arc-20260327;
        b=c869bhUBRJGDcGw6GcgHgbiIWbHQVhZCMHQckVa3pOipaV97BDi6JCB+v2PqNzz+hU
         9n+8+2BdIr0pmeDQeJmRk9GBvxAHCQSKN4B3m+IrdFQT7tbxXsyz2ec3r9axQ4bxmWgs
         NN81iV8BDd6GvQEmwYyDkTUczgHed1FNZW+Ss4L8XrzMxobCCQL1IZS8nBbTWFWzp5eK
         ufmlHFGM2jLfHcsuw+kUffBs29EoT9elwQqG0Qkf2qaSQTBGnR65DYKEuakTdSe8sbIf
         zIf/4JGvusgHFbEKq7fxhBTnIyn0mGEzTozaM3RdmPuM4VQjuOXsUKx852NITzt7up38
         UNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        fh=+tNEtgAV5peQtvCbyeICoiL/+kvYwLNhY1NQQ8Hoivs=;
        b=kTlqWiP6XIgbA+cOImn+lbP6nUp7/H+Q+igVbgJiz3L/i9fW46pt5gaCFUA4H55Krp
         xWBXeobqn+c8/x94LMJBFi9dl0xjiSY9HYTdkrum8QrcW3sgqKviJw4btJtdtYoF3cFK
         8rwHsJP9g25w8HYyJj8/vxjXIN+F7NV9nRp24KQdCky+pyYNHnoQTj7I+GspnJfgzFVt
         11EAFzTrnbB945fE9qQt7d4NbpMqU3WTq9CFXTWkmos3cexT+KVjrdHoHvfC37qi/BR6
         NlOukJoiCqkfpDCDpE3pdWHGPGQUnEkNKY/SS7C+xYWIW85tQ9fPAOI0gBZrcmAG3I8E
         2v2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168390; x=1788773190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        b=d1k/CVsKVvaIyeR0uvK9X2eH41E0bdxY2jOhFnErtPi5Fm9hueftXJzYTey1dHGQbp
         Dn668Fs7dcF2WZJ76wcIlGQjgotVD1uKVDVUToY2UmIt/gA9DuB3pE/Meq/V4+mQnJ1W
         s7NdLCyC7UA5k4PCLc7wQitBCQTpzD2DREF8qXrLJjBEPQ8ihG8gwbVXXksJMtwsKqYc
         myzvE5IGoMlnoTDp9rjeo9juPt2k2TBHmkY9mp6P5ymTTUAHjkk1zcQd9v9PGsZtNiIu
         Qq33zDPIKHHEM3eb3tCj0m5FGW5uhMhwyhiVxFoKVt/OdVZFgZyPlYulTK2DYSiGvGOz
         TQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168390; x=1788773190;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        b=o+pGNwXdeS6lea+7h+QLBP1GkiS187EHjlC4FtPKS8G8fTLDKSsOQ4fbzQR3TRdSEk
         ftoddSblkrlqlEs5uEUysk1mkCCS3iP2/SeB/B/RGGEfCYpYl4ulX3Ehs2Xhwi3M85O5
         qh/SJK+iSSYgsgqGK5FFvSqw0P2Hlfz71sRk3zW8xOLINv4jHKfJF/n1lS7KymDQT4Dw
         hC3Ofd+fcvqCePvka0pOZKBTAqCUOoe1vQxjgLhY5ASDfzBVzUiNPBkeJpGv2skFdj/D
         pNi6oiteqf9hnn+xjT+WX9EdT2cKjD9EpyqIcUOUYXu6kw/tNcPDlR58POB8NkPAvn1d
         dTlw==
X-Gm-Message-State: AFuF++nII19gzDDVbkAZcI/Guw+JeVEOPYsx6/+3Y9tcTGkHimw7CKry
	FmiZrlMkYcYkwPiuPfwGAqwjIeCDOwxfkVn2FqQQGg6jpKY5Rbz63ohaetAlz/5SH0nKsrOKH3y
	d+YyHkwrbkyjsM9a0siAeIKWVXEXzWGQ=
X-Gm-Gg: AR+sD13FHlT1oiuO3Mb5ecYSzE3hRnMUizRpl6+kFuu8tfy/wzVnMFsxsfl/tHtLV4o
	sLOuzlYiQkMlGQ7MjJZY/L9b72CGu4Ls9BU/Pxt0b5UIP6Phs+MXbhAOkWPGD/TH1HXcPscC+IT
	FEU6Ts35YRmmVsSx2CXI6NCBsT9/t89ie20j5jkWDCQmtRmBo5P4jmdrGa5Eaj+v5HF/6pcJYy3
	lX0C/W8hucg1nxKOV5A5jl5m5Rq8suWHDtulqI3StuO/touHiirVHkFmGvBKpYctMtRKrtySJXY
	qGug9+ybhoR4rrJKTRs1aP5GcChfkRlQWFC82BTws4wh6+lDIG9QtsOuoAJh8wlNBMWneSeV8wg
	pc0ufBNCL/D9pyYSPx9fP3qvS14nuYI6aENQPbHI=
X-Received: by 2002:ac8:5751:0:b0:528:583:a6ca with SMTP id
 d75a77b69052e-52fb947ce64mr298965361cf.14.1788168390317; Mon, 31 Aug 2026
 02:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 17:26:19 +0800
X-Gm-Features: AcwNN1VmE5hg-mg3rivFLUTIR9ieFN67679RSw-ZKkt1qwYIsnJOkNZQM4cS9tE
Message-ID: <CAA2SOT4Hok5xOtbviX4HkeqVK_u79NZjw3+0WKZMmUQb35jORw@mail.gmail.com>
Subject: [BUG] usb: gadget: f_tcm: possible circular locking dependency in usbg_make_tpg
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a possible circular locking dependency triggered by a
syzkaller reproducer on Linux 7.2.0-rc3. Similar issues appear to have
been reported upstream before, but I can still reproduce this warning on
Linux 7.2.0-rc3 with HEAD commit
1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer mounts configfs, creates a USB gadget TCM function, creates
a target usb_gadget fabric TPG, and then links the TCM function into a USB
gadget configuration.

Lockdep reports a cycle involving the configfs inode mutex,
tpg_instances_lock, and the f_tcm opts->dep_lock. The current path is
creating a TPG through configfs_mkdir(). It reaches usbg_make_tpg(), holds
tpg_instances_lock and opts->dep_lock, and then calls
configfs_depend_item_unlocked(), which tries to acquire a configfs inode
mutex.

The existing reverse dependency is created by the USB gadget symlink path:
configfs_symlink() calls config_usb_cfg_link(), which calls
usb_get_function() and then tcm_alloc(), where tpg_instances_lock is
acquired.

This creates the following lock order cycle:

configfs inode mutex -> tpg_instances_lock -> opts->dep_lock
opts->dep_lock -> configfs inode mutex

This looks like a lock-ordering issue in the USB gadget TCM function /
target configfs integration. The kernel should avoid taking these locks in
opposite orders, because this can lead to an actual deadlock.

Reproducer:

syz reproducer: https://pastebin.com/raw/xHmrR2GY
console output: https://pastebin.com/raw/G4WtE3Xs
kernel config: https://pastebin.com/raw/GhP15ssA

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

syz.0.17/12335 is trying to acquire lock:
ffff88801e4a6280 (&sb->s_type->i_mutex_key#26){+.+.}-{4:4},
at: configfs_depend_item_unlocked+0xe8/0x460

but task is already holding lock:
ffff888058c6c918 (&opts->dep_lock){+.+.}-{4:4},
at: usbg_make_tpg+0x153/0x5e0

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #3 (&opts->dep_lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
usbg_make_tpg+0x153/0x5e0
target_fabric_make_tpg+0xab/0xad0
configfs_mkdir+0x5ae/0xc50
vfs_mkdir+0x35f/0x7b0
filename_mkdirat+0x407/0x580
__x64_sys_mkdirat+0x8a/0xc0

-> #2 (tpg_instances_lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
tcm_alloc+0x20/0x310
usb_get_function+0x61/0xd0
config_usb_cfg_link+0x1f6/0x3f0
configfs_symlink+0x53c/0x1180
vfs_symlink+0x180/0x4e0
filename_symlinkat+0x324/0x430
__x64_sys_symlinkat+0x9c/0xe0

-> #1 (&gi->lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
config_usb_cfg_link+0x57/0x3f0
configfs_symlink+0x53c/0x1180
vfs_symlink+0x180/0x4e0
filename_symlinkat+0x324/0x430
__x64_sys_symlinkat+0x9c/0xe0

-> #0 (&sb->s_type->i_mutex_key#26){+.+.}-{4:4}:
down_write+0x91/0x200
configfs_depend_item_unlocked+0xe8/0x460
usbg_make_tpg+0x214/0x5e0
target_fabric_make_tpg+0xab/0xad0
configfs_mkdir+0x5ae/0xc50
vfs_mkdir+0x35f/0x7b0
filename_mkdirat+0x407/0x580
__x64_sys_mkdirat+0x8a/0xc0

Chain exists of:
&sb->s_type->i_mutex_key#26 --> tpg_instances_lock --> &opts->dep_lock

Possible unsafe locking scenario:

  CPU0                    CPU1
  ----                    ----

lock(&opts->dep_lock);
lock(tpg_instances_lock);
lock(&opts->dep_lock);
lock(&sb->s_type->i_mutex_key#26);

*** DEADLOCK ***
