Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2820550DB4
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652983; cv=none; b=GafIC/tKru/5ZPK132YBHalpe5TnenuWglAoWNp1Unxc++l5yofTYfhuBB/gxVQCeQQVhZhdWpS/mhKWsTnKpuPW0lPSSH74fcYhYnMl4mxme+Ig66SLnaPF/NqRLAYNAefmaFdnKKBeTFkoOf6LJpSfJsaZRUO5cO/Qxcixz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652983; c=relaxed/simple;
	bh=4jWSfG0IXmf4l+boIASQchHdePiZAMl5i+l+mEfdJ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUHFcNplgH4OOGRPXbSO0L+6Ai4rUOLT0pBV7xbpLt6yMefqUHnqqoBdubVMrhrccymmeGYYFhNAzW7WtgOnlwWv/XiwfI2haDybdCMmVXRfY0enO5AhbUICgY3bE6N33qf0v8mNqUorQvlsvbwutwAp7C2HBKp0JMcuN7pe4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rE21wq7e; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rE21wq7e"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so6617125e9.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 06:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789652975; x=1790257775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMO0nJyi02JDZN0tGJf+t2ZovGKfKcIgphHwl5nQ3+A=;
        b=rE21wq7eT/GhBUBp0qPaeQzV2gmrxUqsDO4og+ZJ07A5Iq8EupSJoPbNVqnIb4P/bK
         +P+ENPKkslLL5CaFjo5HFwBrJEio8Wd7/zYb0sSrie4MvhNbfw//+zqBECMID0RmZWv7
         B0vpokCnSZL6imVvuITTJ3tK8UlDfjR9PgnPIxTX7cyjm6n+rDyXLbHitBWWFEoKlECK
         35oAfTKkSZv8XJZEr0zvQrGFQU8n/aEAErr8tLsCmwP+iBc6oHKQgY6qZCNAhOcV1SE4
         ZcVruvSXEURNjuuggRPKcUXodtPhOyE2Ih0C2MYy/wV7Y58gFK5QVYqcIm97YH8wCvDL
         uT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789652975; x=1790257775;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMO0nJyi02JDZN0tGJf+t2ZovGKfKcIgphHwl5nQ3+A=;
        b=FlRDveBwO3mVxLimer6oifHYx0KGY9/hxiMOSANeyxsLWVA5F6JekqLASCjDcmxVnj
         4PpQqGlU6HAXxt9TqdftU6rDl2nl+sQO+CmaGULTme3o+mKHtwmpKdKzl5XILIFOr7kP
         WT1R3RN7ql/qtjC8xNIiLZVtcit2sWLXAVH/I14wVX5XEZX62rjiIkPzxJiaEWxicWCZ
         gEXhg5p1nHkllgDY/GG78DF88IXa5UWd1iPKVXmJWSG+GTCXr5hqtOXXG4uk74dARq1R
         PD40NZD7SWEqtWq+mzQZrg5tYrYwEItxowQBta16kbkC47SDX9pqjLbdBBMI/TcQWTJr
         C4hg==
X-Forwarded-Encrypted: i=1; AKwUvBxWS/xSmgv5aI0YVbIyrfk8JPYhONB7alKTKrXLPeZQAddI3SJg44fKiC7V6LtA+Yq4yA1+44bNbco=@vger.kernel.org
X-Gm-Message-State: AFuF++kZC2BvetDHDf0Uoo7b0fSgO//pEaNB1vGD2ZKJP/E0n9LsV/iT
	5PSxMu1/R7Ptdi6rKebrL5yj1aHphTB3y41WWuLG76cqcy5+Y44NN55qTUORVA==
X-Gm-Gg: AYBFou0/7YJKTA6Qbl9P0A6VsSSlOxHRK0UbnY/+6skov3z5TgtQgufJl9WGPT9uWKw
	DuXVH29ehks50zPN+c/6jQydJU6a875PDdwtiiq0+1kCh7ZopgL6yv1QJ/JgFN/dVwDt4w1tyUB
	2lCrPrFFg7JVtasT7j7VxCmw9tAk6RjYF03CXK0rZrDO1O18hv5o84/D+MVWJDGB0bd8KGLcECv
	HKgVc8zsZ/qQxcr1Y0gLjc0AFnMr1a2vmSrRYHR3YiF4a9VSdtL8GJ1OPfqPVBGwLzWPqjvedKZ
	pnVFWEPAa3JEk73jB1YNy9enfP4gDVYR9Xkhk15f+kE25L7Fp6vYGSiTEDcx/JWOZa4LCaz9f46
	lSAelu8d1xVqLedrs1V+Q/lzvV1SKSGAZ3hPKLFiSpXe8IRtgMqgmfP5KSMLLOBkh/bvEkZoE9v
	bnlqz2eDjoNWYNwptArIuyKOlB4NIIst4Qd4qFkF8xF/h1DwtDm+ci6PMKujDktm2LggkPH224A
	KE/6H4Y/w==
X-Received: by 2002:a05:600c:1913:b0:49e:816a:9bae with SMTP id 5b1f17b1804b1-49eb733e538mr83801175e9.28.1789652975028;
        Thu, 17 Sep 2026 06:49:35 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm12807445f8f.30.2026.09.17.06.49.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 17 Sep 2026 06:49:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 15:49:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: EricLin <ericlin050914@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, mathias.nyman@linux.intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI
 Prestige 16 Flip AI+ C3MTG
Message-ID: <20260917154931.6ac69cfb.michal.pecio@gmail.com>
In-Reply-To: <20260917122910.5189-1-ericlin050914@gmail.com>
References: <20260916194736.7ba779c2.michal.pecio@gmail.com>
	<20260917122910.5189-1-ericlin050914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 20:29:10 +0800, EricLin wrote:
> Here are the outputs of strace
> 
> $ strace -eioctl fprintd-verify
> ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
> [...]

This process isn't touching any USB device, maybe it forks something
or talks to a daemon which does the dirty work.

> [  146.079223] CPU: 0 UID: 0 PID: 3544 Comm: fprintd Tainted: G        W           7.3.0-rc3-1-cachyos-rc #2 PREEMPT(full)  ca2d5051c95b910bac0a8f0497b52243cdaa75fa
> [  146.079237] Tainted: [W]=WARN
> [  146.079239] Hardware name: Micro-Star International Co., Ltd. Prestige 16 Flip AI+ C3MTG/MS-2622, BIOS E2622IMS.11A 08/12/2026
> [  146.079242] Call Trace:
> [  146.079247]  <TASK>
> [  146.079253]  dump_stack_lvl+0x61/0x80
> [  146.079267]  usb_reset_device+0x4f/0x2b0
> [  146.079274]  usbdev_ioctl+0x836/0xd80
> [  146.079282]  __x64_sys_ioctl+0x76/0xc0
> [  146.079290]  do_syscall_64+0x100/0x360

The reset was requested by some "fprintd" process with PID 3544.

At any rate, it's userspace doing this for whatever random reason.
Your xhci-hcd dynamic dedug trace doesn't even hint at any USB layer
problems like bad packets, device stalling endpoints, etc.

If you want to konw why it happens, you need to dig in userspace.

Regards,
Michal
