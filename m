Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0A46D0A5
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936543; cv=none; b=LGoqCYozbqoLxuYUf28sR6Mv36u6qRt7QCLSA7hjkNQOkAoDYXR4a1jHWmNf3slgvPPlDUA3XoMQ/7FAEK9nv6WtVS2q5KOKuayEPsBRtkbGS2hB/QarpT2s+i7IXTb5B6nNRIUYPhdU8cNLTWm8ZKKkXS6Dy64HvPSBhnVCvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936543; c=relaxed/simple;
	bh=Ao0mxD+bj2xKyX79b18JRPxad0jRRGrxr6qjiPH8zO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2QcTN+7qSJI9Cmmujbf9+qWxOs72pSY71i8MVp34dEHDOvxcv9V7kBbGcry8nWIZPvoPYC51NRMzhrdIwgysir16y25+VA1gQ/2KfQev7MDN5Gf+CHsAWpHcpVZOYipeehLAPjRmWpANIAxJkS5PnTqRewkqpCz/40/9xAJ82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cLPUdIW4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cLPUdIW4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so11316315e9.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785936540; x=1786541340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJhOstIj0ziKPuiL0u8jdM1Rl3wwCX4dvnZLmwUa7hA=;
        b=cLPUdIW4Z2uMwkOsWjIzAc3ywZ7bPzoL0vzkpoiQnOTw8g/JKcmfFl8pjku1rGS9Fb
         IPXiR08yhTPnmzrH3b06N+hh9Zrs3yc9RqIRvPjLLKK7g1m7MaDZPnBgGeh/KEoHYH4U
         N99YE9samGi737yBYvVwunPbmJCXrIK9kVJkhPqI2qVeDIErLIfB/EneLf0skWLfp+Ms
         ImH+FPtjzIiZlyHj4wPcL5Mm8AB5XqwzlS7ICVUhSUXR13QnF6e/a/C7Ixvg4685YeCe
         S0xs24HAQNeOZMNyKF6hAejNsYdpTICkmbXEg2zwNaDdyzhV3vbf86Cfob8iqxCb0syq
         Zuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936540; x=1786541340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJhOstIj0ziKPuiL0u8jdM1Rl3wwCX4dvnZLmwUa7hA=;
        b=VteeXiHTpgFpS1g4Iv6ey2mPt6Q5gJKk8LCe9eVeuny7qHPftanE5LWmgxbc4IWuXE
         W/hGnK/IPIAZHAMtDvwT4TFsHTXr2sKqaYB/mfA9wY/Nbd7Ci7yOuZGNgjcJYT0Jkev3
         DPub16a5eCW3qVj2UZNPoM0NF7ACcziBY8b9rNB6AQ/9z99XgjK2D14ghOWMk4hnPQr7
         H4esTNBfi5Z1cgXDVfk+mQDN37sPPNcUbj2ipmMax2PLS00fzajWGV/uQMyLU2w+Ge6N
         70+5rBzkwwUZRnPY7G3Paq+W9a327t4RhUYqNNw040QFgMgaR8PTYr5RgKgt8MF9wQRq
         mn0A==
X-Forwarded-Encrypted: i=1; AHgh+RpzihETz4YclNxY2++RFAvNwlGK82AzWWhcgZkXV6u0nU243UTc7imNluIlAx8QBMUiUBFXYa6HGUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcS942NES2rer4ZATlqcKP0lFMZe2muymdgcyY0p1T7rl3rM61
	W9GYLCc85S1sfkGIXDuyFSNp7sIyXQ/KOm2J4EHOyl+gFpLjxQ66iviRS2oNMZp134s=
X-Gm-Gg: AR+sD12QXDMujMsBBMWq6FOR3uo/tLNahtr5Ux5YhqoBNgOnVguNmPTbpg5ReiScwO3
	ie+RSicGc3xp73Z1Z2rNxcp0Id3N0LurqI5wuly4hU+xszJ2CNIXcwbB4rIxelLDp53Kyvax53a
	uR6iAn2KXaD3COqgSVegC4ZHq25lxzOhSLKtgb1n9ly1djgOrl/j67VVR86FYD37XUuSOEkaCra
	fm+n3vSYs7pfySXpX/DkPhy3h7JGalYlaM9MKPmYQfz6uSo3SCmV7UaKGrSERkaMbWd1iaan8v9
	xbakURPof/B9VyYcinTDfyL9IAZmjRinWvB2RHunVUOGaXxyaeO7yoXYumquwRv6N6TgTX1oQmG
	C+VR16p3/PdLRo0IrjGzLw8t8vy9eEqR/Iu0kjG7wQeRQgDb1KT/65kW3VTx34fAwwv0sWD4FQq
	fi4XrkijVVTeiSNu2cdExeSWQct9q7t4UnAjTMVAaa1YfKxl9520NdOFXnViutVP0Q5Auo8UWJ0
	+Fo6ojM5D6DTzWRg4JW3q8bHEMwQNytxl1jPJ26ew==
X-Received: by 2002:a05:600c:2e54:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4994e7c1445mr56273815e9.10.1785936540485;
        Wed, 05 Aug 2026 06:29:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b7:a501:d087:f678:f136:a7f3? ([2001:a61:13b7:a501:d087:f678:f136:a7f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e5192c5sm62040435e9.1.2026.08.05.06.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 06:29:00 -0700 (PDT)
Message-ID: <aa6f1402-cc78-4600-97c1-e6d4851d9cad@suse.com>
Date: Wed, 5 Aug 2026 15:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: core: defer leaf-device resume off the S3
 critical path
To: Hongyu Xie <xiehongyu1@kylinos.cn>, gregkh@linuxfoundation.org
Cc: guanyulin@google.com, rafael.j.wysocki@intel.com,
 sakari.ailus@linux.intel.com, mathias.nyman@linux.intel.com, eadavis@qq.com,
 kees@kernel.org, dominique.martinet@atmark-techno.com, khtsai@google.com,
 stern@rowland.harvard.edu, oneukum@suse.com, marco.crivellari@suse.com,
 thorsten.blum@linux.dev, amardeep.rai@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.08.26 11:36, Hongyu Xie wrote:
> Problem:
> System resume (dpm_resume) invokes each device's resume callback
> synchronously on the wake-up critical path.  For a USB leaf device
> this means port resume and, when reset_resume is needed, a port
> reset that, for persistent devices, waits up to 2000 ms for the
> device connection (CCS; on SuperSpeed this includes link training)
> to be re-established (wait_for_connected()).  Slow link training of
> some U-disks and webcams after S3 power-on therefore stalls the
> entire system wake-up: on an
> arm64 test machine with four leaf devices (bluetooth, UVC camera,
> two U-disks) dpm_resume took 2508 ms, about 2.1 s of it caused by a
> single SanDisk U-disk whose link training stayed in Rx.Detect for
> 2000 ms (worst case: -ENODEV fallback to disconnect +
> re-enumeration).  A device compatibility issue should not lengthen
> the system-wide wake-up.
> 
> Fix:
> The patch addresses this on four levels:
> 
> 1. Defer leaf-device recovery off the critical path.  Leaf devices
>     (udev->parent && !udev->maxchild) that are port-suspended on
>     system resume have their real port resume moved to a per-device
>     work item queued from usb_resume_complete(), after all hubs have
>     finished resume.  The work reuses the same udev (in-place reset,
>     devnum preserved); drivers without reset_resume get unbind+rebind.

If you do this, you may have drivers which do not runtime PM
face devices that are effectively runtime suspended. This will
not work.
  
> 2. Safe abandonment.  If a new suspend or a disconnect arrives before
>     the work item runs, the reset is abandoned, not flushed: the
>     device is still port-suspended, which is exactly what the new
>     suspend needs, and the work item then only releases the runtime
>     reference it took.  The abandon decision is serialized with the
>     work item by the device lock, so no cancel_work_sync() (which
>     would deadlock against the work item's device_lock()) is needed
>     on the suspend path.

You cannot do this without checking whether remote_wakeup is correctly
set.

Furthermore you cannot just use the system work queue for this.
You must not have any memory allocations with GFP_KERNEL on that
queue.

	Regards
		Oliver

