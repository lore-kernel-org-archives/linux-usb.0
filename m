Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEDC3DEFF0
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894542; cv=none; b=ldK4M4TtvB55t5ZkCRsSGUKH51j077wsgSjm08Em9K9s46nyOXXxJzT3smY5w1to7GEZM0jaiCsG9qiqPUQu0ys2iehaVmhALJTBJKYho+qF5JpU1k0WmHofAXGmO7GjWrYGmy0aFrXXHp+yx7SHDlmD8O4yCgMuEbGxh+w0co0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894542; c=relaxed/simple;
	bh=uBdgn9dm7uR01HJNEMZUJOgReZ48bMbbNMEwsxPITrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFH/H0YwHZF7gFxxYljce7k/hb64oEi4OsQJqGN3JadMO6gdI9CF3X5uU2eRgsqJBn4qmftTJ0957piIAaEXIujrlIeQUOwOO57VRnnl36Hx2PWOJF/eBVL5UHUo7WreC9mSjScFExOqOEtoF9xlSrZSCkuWZkjhG10uGwqx81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DBGOloBl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DBGOloBl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so3309775e9.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782894540; x=1783499340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEE7c4JvCa0G28E+b+L5pjVZkd/Bl+RD6B9TkZhci2M=;
        b=DBGOloBlFN9hrvIW7fYjMZMqgPwkYjh25ylXsT5uJH8a2aVq/NyVCP1j8O1eOnZKE/
         /i5Q8jLKLWm1tWT5GVIXrxFjUuVdvkp0hZOvJszDnbpGpwZURqym1pyeYw3NKYSyF7kR
         XjGQP7nKDbalpN2YR/fE6I7yA+tsFFghtMOVlIFO4qRX4CsoYGr44/pUfoSgcIg/HTc9
         CDxzqIBv2zCla91gfKXUKeJLSkQAx3V3XtXCIqnMpszFAokhghX/WMWcY9bqWNHRy+Ug
         Y1pOb1LF9RSmOGndjanMnwBYa3ZgA39j3Vq6AfngPBeW57o23D/ORHMtDYT8fZlGV9ow
         bcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894540; x=1783499340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEE7c4JvCa0G28E+b+L5pjVZkd/Bl+RD6B9TkZhci2M=;
        b=BD3LamTqKaWnyw2ammF7D1NwHkeLSH2KIPbe1GtyUcn934hAiB9AdTQOYT3Pa0hJzN
         YwAOkH7++hkV/4tQPjEhq6JwRomz6kfWqs/0j2zaxzApoXIJCLm1+VwBkvw9ZvvHKYeK
         X+7vXd4QYKRyN0zJXpXKslyEKEjZeZaNFPs+eJqUtEoj2A50bjIG2ZOqcvMFi23fK+Gh
         FbzUQ6mh2zxL+c05y6N338xf4XDow/XQP+LJ3O/k5SJCVshR012f5oundl0XvzAU+z/6
         uVBKeueB+gjta4yucnORpKvStP0Jb2D+8+tExemge3B9CsvdNpzAQBQxFWLZ64qRgz9+
         U3gQ==
X-Gm-Message-State: AOJu0YzZHS+GdsaT+a816tj0l6FnHZPcQLWocHTH7zbXId6GfP4oN4EG
	xQCIM2JiQwgnuZH2V3Id0t0sanrCVJjt3OY3WNTwOAxyPsPKp1coqW6O5lR5DgxwytU=
X-Gm-Gg: AfdE7ckFtBHapDNiwrD5ceeeYwkAgzUe1ctkZGOj+pP7FoSN1YZRZdDmWGbJ1iLp+Z0
	c2p13kBGF8m2X5WNqFXh0x+fEAT7cnGRWBVosd+E1e/ZKrkuOqVrsSJAsTqZEfVIdfCPvLJ/kIF
	/8yf9/OOpsGlSb3+S22ekzfpZz8JjkQ2fk6+otHvSsNwOYV0Wnirl7RdRFq6Kx+PoL8/1C6Vna7
	8GMwbRaFTXBYJ9kFi7fdNln/By5NMzP6D6iv5tOoOBWP86KgZBbtu09jRonML6aV0j5hwErobxA
	RT45bwOBShKXW5/D85q0seFQvd0/m5ESut+FZkH9Lq6LejG8pkdFAgu6IJEI0WsB7fFyCg4ZIfR
	IS5PdkkFzOihO7y3jd4U9VpxncH17UjQqV6eC1YwBm52T38jE/vbTRPAgIF0isKtoy0NbHoQeTJ
	too9MOTU3BXRLlW3xeOxhY+lmMKlW5R9JOARfD4DZE
X-Received: by 2002:a05:600c:4e0b:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493c2b99ef1mr8464735e9.26.1782894539512;
        Wed, 01 Jul 2026 01:28:59 -0700 (PDT)
Received: from [10.10.30.42] (pd95bc558.dip0.t-ipconnect.de. [217.91.197.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm86590935e9.8.2026.07.01.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:28:59 -0700 (PDT)
Message-ID: <e2599d9b-5dd9-47db-8339-f1aa825a11d6@suse.com>
Date: Wed, 1 Jul 2026 10:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb-storage] [RFC PATCH] usb: storage: uas: limit consecutive
 device resets in error handling
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>
References: <20260701040335.810297-1-senozhatsky@chromium.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260701040335.810297-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.26 06:03, Sergey Senozhatsky wrote:
> When a UAS storage device experiences persistent wire or hardware IO
> failures, commands time out and the SCSI error handler thread invokes
> uas_eh_device_reset_handler().  If usb_reset_device() succeeds at the
> USB hub level but the underlying drive remains unresponsive, the reset

What exactly do you mean by unresponsive? Usbcore must at least
reassign the configuration (and the device address).

> handler returns SUCCESS. SCSI EH then requeues pending commands with
> DID_RESET (ACTION_RETRY), causing them to time out again 30 seconds
> later in an infinite loop.  This blocks block layer queues indefinitely:

Arguably this is a SCSI issue, not a UAS issue, but anyway.
[..]

> Introduce a runtime-configurable module parameter 'reset_limit' (default
> 3) and track consecutive resets in devinfo->reset_cnt.  When a productive
> block layer command completes successfully (SUBMITTED_BY_BLOCK_LAYER),
> reset the counter to zero.  If consecutive resets exceed reset_limit,
> abort the loop by completing pending commands with DID_NO_CONNECT and
> returning FAILED.  This allows SCSI EH to offline the unresponsive
> device.

Let us take a step back. What is the issue here? The device goes
into error handling. That is not a problem as such. A method
designed to remedy an error condition has not been effective but seems
to succeed.
That must not happen. So what do we do? It seems to me like we
ought to add a test for the effectiveness of the reset.
At first glance it looks like UAS should do a TEST UNIT READY
on its own after a reset.
Or are we looking at a command that reliably crashes the device and
is reissued by an upper layer? In that case either we need
a quirk or the SCSI layer ought to deduce that it is using commands
it shouldn't use.

Can we have more information about the scenario that triggered
the desire for this patch?

	Regards
		Oliver

