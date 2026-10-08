Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD833556D
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469273; cv=none; b=NzMxaxMF4+0R1MeOCyxyhsPO5eowocgaUV4wM7BEI3Q+2kPCWBz4FJfGxaFDwUhA2FG0SWrPojtvRuz0FnswSIRxu0snq5iJeeqJ4sCW4Jz+98tZKbN+f4ChlkvlHGTDBBPnviowOPpHMX0uZKAuqDL1UjOVWvxaoxoMHMlRoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469273; c=relaxed/simple;
	bh=HOnNmzTNdFDd+lzt8KQGKtj80sIOXNhuClH4YwMAFvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDDFoghpmYnCviuCz33Rn7gxXx37pV1e+lWwE5zi8lWfIZxEFDyYoOAymRFk0XP/+hb6Wv7tIDFoFTvQ0Roz7iF0U7f0yXrVm+6cCEZaXLW03seOGQJnjKbHUYfrlxbBX8pHpG0evY08U0Ogw7dAMiXO3Mc3lSh4e/mGiNXnAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ao2rM+93; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ao2rM+93"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab3aaf416dso30845027b3.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791469271; x=1792074071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/NKP5W3kT9gmvEjNElRhq3AEzgmNpYLCkrBSAflJAg=;
        b=ao2rM+93owFPtJNd24dXIHX4GO3DKAPKAyxrV7sdFQZ57J2TE8fMdrk0DGjqhJzWoS
         s8dzJEMZVxagJONjgW4S6uS2PuDRjf4HnbE3OioeYDJKi2FI45MhdNYidpMOwF9Yy/tl
         +R4fbm8cMoT6WNrWxWBx9ruBdtab8LGzYPHl9LJOXddgmS6r7IAm4sXion48jids7t9u
         y6h4tLKPLwk3NB1rVm38oMxLsPHDPw424on214wghu0K7M7O/HV88Xg1LLZSl2qqqcgE
         KbOvsTOrY74nloEAdtd3AAzSVUlB90VrzCP/ty+djyrgAw9L0o5zBn53WF1mbyL49foK
         PVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469271; x=1792074071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/NKP5W3kT9gmvEjNElRhq3AEzgmNpYLCkrBSAflJAg=;
        b=j/53eWuwTc3FpzWXO//F9IwYJ4zdW3IcnOOexytNzeZF1yaBEbHIMrPz5gqLDHXhGn
         BiwZ2nDSJ0wFWHMdl6+q1iHIq16zAFFb6Xvwi0M1LNkUIlj7R/oexuqi56/7vBRTHcjV
         7EnWfLHVvmJbMAgc+BZ1aUQsGRgaQV+5ordLBrjhhTa5y/XZCtVVf+ZV0loDJu2OE6b5
         hwjqPTGlxKkaRX6pimjDnM4qbCKvvvxO+ca3BjmQ92vpFdHkd7XpVKl5q2RzDPEOFrS/
         eLkSgAzu3Tdd/pjnUlBMkX6vQpmm97FCJNv521wMI9HguAeljHwDg4dpg3pmYZ+MAsJZ
         TMdg==
X-Gm-Message-State: AFq9FYKJKQcQ6nLmL6IDDyB86B2eNVNVL+mxieJ1cRd9WTZoTjOsqE3x
	6Kksd9qupTJqSF1TUnJzTNd7TLdZOfmuKpa5u6ZaVQzjoOV6dIBRb+hn3rg092nNKA==
X-Gm-Gg: AYBFou0GoXW23dGlM0u4bi3S/ACUta/hBz7RP1pJw/JEAzkvX/dog/blPaOdU9KlnYR
	S1o1KNcnfdn82Tx1Vi+fVEJ7mxW/5Eht6KFXmdxVSa+NtcFmSPZ5gOeH8Ghk0jU+Xf8eyt5ZRS8
	8bpXXkJAdqBZ8eiAy3i3CIjq5xL56qNX42+UAarUTSElhJ+jq1HuaI/b+DZ8CN5FjnjN7EXHKic
	/57tE7+UBiabzmMz1QpIs5Tu7RDTzAYA1ANEK32O/ai2SMMiSNKIi1HhDNRewgSlG4uWab8k32m
	o7LqboYM3bCihxyJdoKcr5Y/rQo8cm4i0P8L3mBekRusOaq0ZeDmm57XpsLx8Gm53BJICD3a+ad
	PJkxXE4sw8AWaqTPRYAymnuquRQuwJx1ZdJPrpNHpbCgaVkNNfxf1fentuFDyJQRnxxRtBKAdYy
	W56BAbX0rkLFtFLD2+YNQEs4MYnGDojbpKpJFLtI1OLRTOqDXSq1VSn658qC/u3G6zZFgVwDHGS
	LxRv5cYzUqHtghX
X-Received: by 2002:a05:690c:7108:b0:890:659e:3c84 with SMTP id 00721157ae682-8b05afe3d83mr42387637b3.57.1791469270028;
        Thu, 08 Oct 2026 07:21:10 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996d00badsm46695466d6.24.2026.10.08.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:21:08 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:21:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Luca Cecchi <luca.cecchi.info@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, oneukum@suse.com
Subject: Re: [PATCH v2 1/2] usb: uas: implement .change_queue_depth to allow
 per-device queue depth override
Message-ID: <07d145c7-08a2-44ee-ac00-46535e0ca9e9@rowland.harvard.edu>
References: <20261008112645.1820678-1-luca.cecchi.info@gmail.com>
 <20261008122604.1862534-1-luca.cecchi.info@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008122604.1862534-1-luca.cecchi.info@gmail.com>

On Thu, Oct 08, 2026 at 02:26:03PM +0200, Luca Cecchi wrote:
> uas_host_template does not implement .change_queue_depth. Because of
> that, the standard sysfs queue_depth attribute stays read-only for
> every UAS device, not just mine: scsi_sysfs.c:sdev_store_queue_depth()
> requires sht->change_queue_depth to be non-NULL before it allows a
> write.
> 
> uas_probe() already defaults can_queue to qdepth - 2, with a comment
> acknowledging that "some bridge firmwares" need extra margin. That
> margin isn't enough for every bridge. Right now the only way to work
> around a bridge that needs more headroom is the IGNORE_UAS quirk,
> which disables UAS entirely and falls back to BOT/usb-storage - a
> large performance cost for a queue-depth problem.
> 
> This patch wires up .change_queue_depth so affected users can lower
> the depth for just their device (e.g. via a udev rule matching
> idVendor/idProduct), without disabling UAS altogether. Default
> behaviour (qdepth - 2) is unchanged unless userspace asks for less.
> 
> Tested against a Lexar ES3 external SSD enclosure (VID:PID 21c4:0003)
> that locks up under sustained heavy concurrent random writes at the
> default queue depth. Capping the depth to 24 via this interface
> eliminated the lockup across 6 consecutive test runs, including a
> continuous 1-hour soak test (1.36TB written, ~822MB/s, no
> uas_eh_abort_handler events).
> 
> v2: guard against devinfo->qdepth holding a negative error code left
>     over from a failed uas_configure_endpoints() call in
>     uas_post_reset()/uas_reset_resume() (the device stays live after
>     such a failure); without the guard a negative depth would reach
>     scsi_change_queue_depth() and underflow the unsigned queue_depth
>     in the block layer (found by Sashiko AI review)
> 
>     Re-tested on the same Lexar ES3 hardware: writing 0 or a negative
>     value to the sysfs queue_depth attribute is now rejected cleanly
>     (queue_depth stays at the previously set 24, no error in dmesg),
>     confirming the "depth < 1" guard behaves correctly against real
>     userspace input. I was not able to reproduce the specific failure
>     path itself (devinfo->qdepth left negative by a failed
>     usb_alloc_streams() during reset) on this machine - the running
>     kernel has CONFIG_FAULT_INJECTION disabled, so I could not force
>     that call to fail on demand. That half of the fix is verified by
>     code inspection only, not by a live reproduction.
> 
>     Also switched devinfo's lookup to sdev->hostdata (same pattern
>     already used by uas_sdev_configure() and the other scsi_device-
>     level callbacks in this file) instead of casting
>     sdev->host->hostdata, which was pushing the line past 80 columns.
> 
> Signed-off-by: Luca Cecchi <luca.cecchi.info@gmail.com>
> ---
>  drivers/usb/storage/uas.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 2651629..971a47f 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -910,6 +910,38 @@ static int uas_sdev_configure(struct scsi_device *sdev,
>  	return 0;
>  }
>  
> +/*
> + * uas does not implement .change_queue_depth, so the standard sysfs
> + * queue_depth attribute stays read-only for every UAS device (see
> + * scsi_sysfs.c:sdev_store_queue_depth(), which requires
> + * sht->change_queue_depth != NULL).

This sentence will no longer be true after the patch is merged.  It does 
not belong here.

>  Some bridge chips become
> + * unstable under deep command queueing; wiring this up lets affected
> + * users lower the depth for just their device (e.g. via a udev rule
> + * matching idVendor/idProduct), without disabling UAS altogether.
> + * Default behaviour (qdepth - 2) is unchanged unless userspace asks
> + * for less.
> + */

In fact, does anything in this comment tell the reader something that 
isn't already obvious?  Maybe no part of the comment is needed.  Or just 
a minimal comment, such as:

/*
 * Implementing .change_queue_depth allows users to lower the per-device
 * depth queue via sysfs.
 */

Alan Stern
