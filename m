Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427A3921CE
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077060; cv=none; b=pvekjSxtNQAOqpiC0x3QgrhDDC88QSI45599llwDfY6weQ3rFVGDN6kIyrZbsunia2Q17pbcdPL6+hcFZFOqfb7hfNoRPAhpPnia/S/LGe06HSEqSyM3yNh7NVOAkOJ+F5KRDVTe5migEuC5flyfo10o/LqXgixd/8k/uqLUcoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077060; c=relaxed/simple;
	bh=VyKUGMsf2per2qZF4y2NXieWRzv4kj/8LsXQF9Ur0ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWs//0FeWswsjHnViyGPBOLvU+14M2WmgMYeeOkloGoJo/nJX83KjIRS/BLnyHzZrUHnsnPXe5rywa9W+mpBpqNBtiIx6AZi3IlohC1nicSGk13YQOgyfsR8gAIWPR/aqbHLDO4ibDPeCetDzTIJpkJgKhgGpj7dGubZstTgvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTngYj5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTngYj5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288BC1F00893;
	Wed, 10 Jun 2026 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077059;
	bh=PG+mKgh51kCNpgPTEKJhZ+xJ4TuPoDEZjLDONhMrmVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OTngYj5BL+y7cQL8GBgxbk4ezjTZYs4qMCM/2GQDNiaFHe29M8GK8Pc/lgpJO+7f0
	 d9CAGq/YRup43m916TJZkc9bLKiQ1tq6vT/8IGwAdyj8KyM42uP9IqJpomY9M1GVck
	 k8gPNfx0URkWlWsSl3ZvfRJVLv/LiTCSNVPf2btlHq7GcDj4DKsokyqV0lvsEtEDPW
	 xVZQunL5H/kX9lUomRVkznvRRhcYas1WwrqgOY6fRvh6UT3UiYM3MJKI20+dHiJnec
	 iwIpPhCJJjgfgVrY83DIS3yxFj5rtgjHx/WY9q5gSevC9DzHqles+FhjL3omE3HXkn
	 GJzH/rPHel/1A==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXDVI-000000016v4-2Ozf;
	Wed, 10 Jun 2026 09:37:36 +0200
Date: Wed, 10 Jun 2026 09:37:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Shuangpeng <shuangpeng.kernel@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, keithp@keithp.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: chaoskey: Fix slab-use-after-free in
 chaoskey_release()
Message-ID: <aikUQKaMqpocakgG@hovoldconsulting.com>
References: <bb5b1dc6-eb59-43e1-8d26-51e658e88bbe@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5b1dc6-eb59-43e1-8d26-51e658e88bbe@rowland.harvard.edu>

On Tue, Jun 09, 2026 at 01:37:36PM -0400, Alan Stern wrote:
> The chaoskey driver has a use-after-free bug in its release routine.
> If the user closes the device file after the USB device has been
> unplugged, a debugging log statement will try to access the
> usb_interface structure after it has been deallocated:
> 
> [ 2019.819081][T10106] BUG: KASAN: slab-use-after-free in dev_driver_string (drivers/base/core.c:2406)
> [ 2019.820996][T10106] Read of size 8 at addr ffff888168e8a0b8 by task chaoskey_raw_re/10106
> [ 2019.822432][T10106]
> [ 2019.822899][T10106] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [ 2019.822904][T10106] Call Trace:
> [ 2019.822910][T10106]  <TASK>
> [ 2019.822915][T10106]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> [ 2019.822932][T10106]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> [ 2019.822984][T10106]  kasan_report (mm/kasan/report.c:595)
> [ 2019.823015][T10106]  dev_driver_string (drivers/base/core.c:2406)
> [ 2019.823021][T10106]  __dynamic_dev_dbg (lib/dynamic_debug.c:906)
> [ 2019.823282][T10106]  chaoskey_release (drivers/usb/misc/chaoskey.c:323)
> [ 2019.823290][T10106]  __fput (fs/file_table.c:510)
> [ 2019.823298][T10106]  fput_close_sync (fs/file_table.c:615)
> [ 2019.823320][T10106]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
> [ 2019.823327][T10106]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
> [ 2019.823337][T10106]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Nit: I'd trim the timestamps here

> The driver's last reference to the interface structure is dropped in
> the chaoskey_free() routine, so the code must not use the interface --
> even in a debugging statement -- after that routine returns.
> (Exception: If we know that another reference is held by someone else,
> such as the device core while the disconnect routine runs, there's no
> problem.  Thanks to Johan Hovold for pointing this out.)
> 
> Since the bad access is part of an unimportant debugging statement,
> we can fix the problem simply by removing the whole statement.
> 
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/20EC9664-054E-438B-B411-2145D347F97B@gmail.com/
> Tested-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: 66e3e591891d ("usb: Add driver for Altus Metrum ChaosKey device (v2)")
> Cc: <stable@vger.kernel.org>

Apparently I overlooked this debug statement when adding the missing
refcounting in commit 93ddb1f56ae1 ("USB: chaoskey: fix use-after-free
on release").

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
