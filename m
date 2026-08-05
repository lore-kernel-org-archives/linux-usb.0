Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED740D590
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943789; cv=none; b=JjSWHQrvndfqbrLj/WW3bDc6i+wj0lWbsszGpORn6UZcoMUyug7yX3JbIebMWp/KimLghfLLE7vwopyDBZWiAHo2wpngSVfjT5RLNFMbaai1F5Hen6aLTWxyMZPZFRFBoLzvpCB73P2oRucya1MiCF9Sw5eP5cKW4/6tHbYs0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943789; c=relaxed/simple;
	bh=hMFCgW3Dr04vqzPwa8bcjK8iq9TTYRW+uG6z9VzJTmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIqX8g/dQtzWJMwD2UcO3tZVdBdhIRwTDxuRK9ACV9n2wqhM02y1W+O8iVCoLGfOfDQzIVs4YA2VJz8ZBGIsMsoPVBBGsb0s18mNenAPqUuCCktqRdacedMUshkuXhdbNVTlO219hy/xDo3NYya6VGiVOsA9e5yKH/em5kRYxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FiXLdRWu; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FiXLdRWu"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90873ce5278so8964426d6.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785943773; x=1786548573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCXP2CPz/lE09kU70v0gkK7GeV91TaFVsCOQCNyfBsk=;
        b=FiXLdRWuSTmlqMrCMRq3TNMy8+PX62MgaYKDsZXTtmlwUv6PKY6bR8XPoY4Kok3Rbo
         5qosOm0enxwtTdzWwjn/IeiF3UEMXIf7Jqg1wP1IzZVqWB4AC0YkVYKcwXWJ1p+R0TD/
         7fV4bZEsVAX4garS4WrmHHFsRWVfVA6JFZ7wuU1s8aSx4kVUMJrSIizooQSFrnI6Kz5/
         vNLGOR4jhHzm5Rfzg/ViO1R4IdbaCmGIS+ZQpC5WCaWmgJrHqH8PPKqDX6s/c6uH18tz
         aWMsW9BIFLPHi4rrdKUopcTQlODsPZlO8vckUaLMP6n5MW/fJ3lqpfhNgJi388MOFyaZ
         MzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943773; x=1786548573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCXP2CPz/lE09kU70v0gkK7GeV91TaFVsCOQCNyfBsk=;
        b=eK7NJwRlRIeQ35g5OZ8UFfzuXv2NNh8HR56gUr3Prlo9K1mtj6wIa/B+YPlQUP6CRw
         aYwbF1ICv+lFaGSsXUWSdeFOT33cyKQTnwXD1TX+8DNWVeqakT0NSIWbiGsIjtleKHLL
         zMOl872bVuzMW2E+r6R5crcXQOmJGUFBXYAq+QiyvI+ATRCfiwt2JXjHKThSAGJt7qDZ
         61EEUHpDlrbVPeR/czoTXyv6jyhT3ogMWCQet1Ms2rAwotT0pNLdFa6Uu7Y8IZAdvLUG
         W0NdIqoCyUw0ECP2mGt2ynguGfFdqF2tnwWCJGenf/X9jWr2TxWddt9TNuq91eLCkzys
         HrJA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1vc/pXdVnmSQiTn/ILNTPsyJ+a37trC1QDSanaUYYqPDFbbY2xdbj5FWkKIFONIyWN1ki9rjrUGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01wpgojOQDmZhdqDTfAT0FFApUhfveo9OlrAXu/bZ0WLd69As
	sc7Fs1tZLWVGjO6kaWQRtzPr6NbzvVrWYOalqv1/24Zxr3ndfHfRItou4fhiXYQqfw==
X-Gm-Gg: AR+sD130Dm50oIElhOdiyPFOvZunzMHcP501voVJWLq58PH6dm0hI1vW+6sYMXgEgIR
	3f+LNgqjaODIcY0VxbS6oJH7Ut/EcqR8zTZMwrQbiKCK/YZyi4m2enQK4W3YbACxa+xXtlgfNKc
	KtmrIkzdo010+bC8ruGc8no66ONh+AeHK65Ye9MgffWmEj0fklFJi86x+appormxmPt6cG8H5b9
	rTyZ7ImjXej43ogJWaTLZvu657NuLFd9BPh5C2ajmZRPCKb6VinXE7mfPPgnmkGJvM7bo+0I2fe
	xdILhrtiq8az6UvZEejtLsL1rBYfaDXKX+altYzS638yS0S/54zN0+wrbPPsUVW91Aof6TLk7WV
	DqPT5sRBzu+Lr6Wktpq3TUCjMbtrfNeCNEcki+8zZ/EsFg6XOZOS7izuOzNFef0b/R+lskpDSBg
	eS/sCG7tDjQcdROndZ7tJJvMoBkbb2BCwTKMv0uQJpXCypCr2yajRK8dI3chKTHQ==
X-Received: by 2002:a05:6214:19e4:b0:907:5db0:e8e2 with SMTP id 6a1803df08f44-9088139345amr81858916d6.28.1785943772607;
        Wed, 05 Aug 2026 08:29:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9de67sm32023106d6.8.2026.08.05.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:29:31 -0700 (PDT)
Date: Wed, 5 Aug 2026 11:29:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: gregkh@linuxfoundation.org, guanyulin@google.com,
	rafael.j.wysocki@intel.com, sakari.ailus@linux.intel.com,
	mathias.nyman@linux.intel.com, eadavis@qq.com, kees@kernel.org,
	dominique.martinet@atmark-techno.com, khtsai@google.com,
	oneukum@suse.com, marco.crivellari@suse.com,
	thorsten.blum@linux.dev, amardeep.rai@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: core: defer leaf-device resume off the S3
 critical path
Message-ID: <307f74ef-ac8b-4270-98c4-6ec3a7757d6d@rowland.harvard.edu>
References: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>

On Wed, Aug 05, 2026 at 05:36:41PM +0800, Hongyu Xie wrote:
> Problem:
> System resume (dpm_resume) invokes each device's resume callback
> synchronously on the wake-up critical path.

I thought the PM core used asynchronous wakeups for most devices, 
including all USB devices.  They can delay the end of the wakeup 
transition, but the delays do not add; they can occur concurrently.

>  For a USB leaf device
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

On the other hand, you don't want the system to be awake and running at 
a time when a disk drive is still suspended and unusable.  What will 
happens if a process needs to read from or write to that drive?

> Fix:
> The patch addresses this on four levels:
> 
> 1. Defer leaf-device recovery off the critical path.  Leaf devices
>    (udev->parent && !udev->maxchild) that are port-suspended on
>    system resume have their real port resume moved to a per-device
>    work item queued from usb_resume_complete(), after all hubs have
>    finished resume.  The work reuses the same udev (in-place reset,
>    devnum preserved); drivers without reset_resume get unbind+rebind.

And what happens if a hub needs a 2-second-long reset-resume?

> 2. Safe abandonment.  If a new suspend or a disconnect arrives before
>    the work item runs, the reset is abandoned, not flushed: the
>    device is still port-suspended, which is exactly what the new
>    suspend needs, and the work item then only releases the runtime
>    reference it took.  The abandon decision is serialized with the
>    work item by the device lock, so no cancel_work_sync() (which
>    would deadlock against the work item's device_lock()) is needed
>    on the suspend path.
> 
> 3. Truthful runtime state with lazy resume.  The deferred branch of
>    usb_resume() reports the device as suspended
>    (pm_runtime_set_suspended) until recovery actually completes; the
>    work item switches it back to active only after usb_resume_both()
>    succeeds.  Accesses made in between trigger
>    usb_autoresume_device() -> usb_port_resume() and resume the
>    device synchronously, so a successful operation is a real
>    confirmation of readiness.  A failed recovery leaves the device
>    suspended: later accesses fail or the device is disconnected,
>    both visible to user space.

Runtime-suspend and system-suspend are not the same thing.  In 
particular, they can have different wakeup settings.  You cannot simply 
substitute one for the other.

> 4. Port-state gating.  A device is only deferred when its port is
>    not connected (link training still pending, or the device was
>    removed while asleep) -- the case where the long waits happen.  A
>    connected port resumes in bounded time and keeps the synchronous
>    path with unchanged semantics.

What happens if other, non-USB, devices lie below the USB leaf device in 
the device tree?  How will they resume?  What will happen if the system 
needs to use them as soon as the system resume is finished?

> Results:
> With four leaf devices (bluetooth, UVC camera, Kingston U-disk,
> SanDisk U-disk), repeated S3 measurements (14 rounds):
> - without a 2000 ms event: dpm_resume drops from ~498-502 ms to
>   ~219-223 ms (-56%);
> - with the occasional 2000 ms link-training wait (or the fixed
>   2000 ms CONNECT timeout for a device removed during sleep):
>   dpm_resume drops from ~2508-2813 ms to ~219 ms (-91%), the wait
>   running in the background workqueue without affecting
>   system-wide resume.
> Deferred recovery completes in 0-20 ms in the common case.
> 
> Known limitations (no practical impact):
> - The system resume notification (PM_POST_SYSTEM_RESUME) is
>   system-wide and carries no device information; between the
>   notification and deferred recovery completion an application
>   accessing the device may fail.  Drivers using usb_autopm trigger
>   synchronous recovery instead (lazy resume), and the window is
>   milliseconds in practice.
> - usb_resume() returns success before the device is actually
>   recovered; the runtime PM state is truthful (suspended), but the
>   PM core counts the callback as successful.  No kernel path
>   depends on that accounting.
> - A recovery failure in the workqueue cannot be reported through
>   the dpm error path; it surfaces as device disconnect, which user
>   space already handles.
> 
> Gated by module parameter usbcore.defer_resume (default off).

Overall this does not sound like a good idea.  At the very least, there 
are several implications you have not considered.

Also, have you looked into the smart_suspend and may_skip_resume flags 
in struct dev_pm_info?  Can some combination of them accomplish what you 
want with minimal code changes?

Alan Stern
