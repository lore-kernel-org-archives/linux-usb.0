Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD59370D56
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787496009; cv=none; b=PM2rpKxBkqIbCYG7tJ/1d8Ivx/cMP6OJgEst0y4g8biM+El4YRzliQakn90niL/V42GotarVw5Vr8qM5IUaFYdfN0YOXJwfKzO6fqfFpKzF0WBc14AWs91N6FWwx8YFt+zx3ZjaWlJyWUaatKVED9mnXVscVtI63fb562TWyFdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787496009; c=relaxed/simple;
	bh=mdUGm8U13JxZwr3ZnxRwt3yi6FvYTBdNA5OUPUKmQyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF8vbIj4Nq+RurVMekagqNmiv0BMEiuyMibNNzB2CYon73Ugl0CEp5NdoI+msqMRJQxxXa2S0epoxGGtPZ1l9W/Y77S1a2vPUzTnptHORc/Vsnz7c09DMP+4r56CtlioBXGRE1LHUW2JNuyHl7xpPD+m+IdYhBxxeDCFGMp6o0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uLPFS6HY; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uLPFS6HY"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f256eaedf8so27965576d6.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787496007; x=1788100807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kP+6mVlmxhfGWx9Sj9mX/wiFGcmQa2FtLQoZIAd5BpA=;
        b=uLPFS6HYKpigZNvCgqd+vAVlWor9ED11r2SEpuN8Yw+/NdwnbSychMUIEIzAq79GLB
         DcfJ570abto96AXmPSy4KJ77wqqJ6PMhyhGXbdGbLt4pFCQSJjOFDGeV75ZCKXscXtVT
         OHtq9mkuLti2iaQ1V0d1ImjkI9XmHT2YKRbrOtbD/Tm7tJ1iIGQhNbOtXbuT3vBXIium
         iyXWIBLgd0M/+8OpCLUIf84ZjQ0qsd/EuuXvfiHCKV0X17aKOSiVWwNPBGBL14ZCmDS+
         9EWoU/W9cjGMQNh/ksVRjBbnpX6vly+A8oUvLZWhC/1aFS9ioC5wHC/oTaYCYtF7urtn
         /poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787496007; x=1788100807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP+6mVlmxhfGWx9Sj9mX/wiFGcmQa2FtLQoZIAd5BpA=;
        b=Nkyt/U3eIduJEU+Pegm80nrdS3MJma2eJ6SZactvmvUeSVpvVMY5PxmJc8+E/7MnBY
         a4cuqgnOtr/4TaXkwUNUcsEdx2ohSQ/uL8w4Bwp5QwsLGnXepLDafevNE5M/C4lxNef9
         1WArfwv4qxMGQsv5AqonI8w9tCJXkujrsYYvPk4vrtrbkRMy3mXvdqgCz0z3sl3W7nzz
         TsS0dYs9a1eC07G90oPc8tndq9gYnsEuhyzYmSJsjI9GII2z3NwGe/098a5vYuSVKjwx
         nNXHYmOasl+FhmmGxM1wGwm4/Wn1PxUCCEQ5TLgSYfaSxPyEehgiS1NpyIiR3H1hPWwq
         jhJQ==
X-Forwarded-Encrypted: i=1; AHgh+RroEgz3GFmYu4tRbx7ODT1fdORLXqmnW6uCxIJossnXnK+wO1LvgxKDbQuhVUNmD767nuHexgJAM/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l1AXaXsIEuCytAKzLjILH+q/WMXVxkxcKf+LEz0bz++Gz8/nmv
	iGyHasMCCNyx+XUDtLcZjll8WeEm/tNllmC4w5+nOWIt+C7z3br7sd4rWc9BKaU87g==
X-Gm-Gg: AR+sD10BURBPmJrIdlrTnRpJzI3eyIoalGiYWF2HZckGMEaO9NkRVJL6LmzgmI5Xoa8
	Mw46o0biLHPyjRVXykHKGiBWU5fGEouuM+SiARr7K1QZpPmFC9+h5yw6MIYXO2lb16QQynAQf5Q
	qBsBlrn9E9b88an0dv6dOPTBSRYCZH1CEbPR3hxOpd4+uKfN6mvDVQWv/ZGDeqaZtjDrFyrBNSv
	GI9WTKDYD3SgPIeYvGr/OqD+t3yPwjTk1voTXtjBCS22/S5zMy2wU7/1r9ZbPqBqdSgoWrPsKY1
	xGvO67V6scxVx2gAJp1M45qF4DJldFt1ijq8meA10tzRWP7x0jXGluEVDGFjuBaqBu6s6K85eCY
	2OjEu3sbTrs/DvZEJQz2FOZRfzdpfy2T2OcG5xPL2VKPhJhJSMGrhspkh08pvynaAcwalknoMnk
	ZcIRIU12yNweWsz8L0JO4tvbQplZH7t6abjEqsBw7fK+Sm+3AXnnBzRDNI31BxPstCf6vZiTOo
X-Received: by 2002:ad4:5d67:0:b0:8f7:43f4:fe8d with SMTP id 6a1803df08f44-90c8fa5ed5emr118052316d6.29.1787496006573;
        Sun, 23 Aug 2026 07:40:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4f093sm39231026d6.37.2026.08.23.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:40:05 -0700 (PDT)
Date: Sun, 23 Aug 2026 10:40:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
 <2026082307-negligent-lusty-750a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082307-negligent-lusty-750a@gregkh>

On Sun, Aug 23, 2026 at 01:46:43PM +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=13e9f679580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=1941312e3e971b07
> > dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a75679580000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/7df7b958efe0/disk-e8bf40d1.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/cefbf90e524a/vmlinux-e8bf40d1.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/37a530b91001/bzImage-e8bf40d1.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
> > 
> > INFO: task syz.4.23:6285 blocked for more than 143 seconds.
> >       Not tainted syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5510 [inline]
> >  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
> >  __schedule_loop kernel/sched/core.c:7316 [inline]
> >  schedule+0x164/0x2b0 kernel/sched/core.c:7331
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
> >  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
> >  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
> >  device_lock include/linux/device.h:1104 [inline]
> >  __device_driver_lock drivers/base/dd.c:1170 [inline]
> >  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
> >  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
> 
> Ok, I'm going to add a new TAINT flag for when unbind is written to as
> that is obviously not a normal operation and is only for debugging
> things by kernel developers.  Adding loads of work-arounds in the kernel
> for this not-real-workload-path is just not required.
> 
> If syzbot could stop hitting this path, that would be great, as it's a
> root-only thing for debugging and not something "real".

Actually, I could imagine people wanting to use unbind for a real 
purpose -- you could consider it to be a more specific form of modprobe 
blacklisting.

The bind attribute is the one which really should taint the kernel, 
because it bypasses the normal matching checks.  Also, all the numerous 
syzbot bug reports coming out lately have involved weird bind 
operations, not unbind.  Unbind should pretty much always work.

Alan Stern
