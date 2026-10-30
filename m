Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371025;
	b=vpDKM9dX5nrD1+5niPJ5W6u29ae5d8xfeFjF+gZoizx9Ve/gP22niJ9TXHrwJaWAtWAI
	 H97LlpnUcT4sZpisVkYllKmGvPDjtACIdh66Nelh4hpxUPiotKiC80amE0VTZMzp0aeZx
	 fUFo3ncxD15kUKjg+yiy8tShntjwU7a9MRS5+h5ezL6SE13kFFYarmNlj4SNbG/8r5lok
	 fVwBOmzKXIvrq+pTKizZuh9KzAWhB3ZTepS/dqhbwKdj1+dYMzP/MNWcnEnAFEC+mOZld
	 02jz4gnth5ONLnUzFA6gSr6+TldybQ76GlaxHu1Par0bcJxEJ1kg+NpMjx8WvfV8+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
	b=mqC1gbVQjb54+eyivu10ZFc7Pwal3Dkl6t+zCFRmpLQpfnBz6ZxIOzJj575K/vIRGaty
	 UePTRCkLDcTGuuYkqhpv9H86aNvbOLIMTIovc2S3hJAuMT8uo+lHGo1HL7pc3rByJ2GmS
	 +sOLomXE8aJBNwHLd4fEa69O4BSJpXeAYVg2FcbzBpQDPoyO71+70Qngb2mBvE+o0hOR0
	 o2ZwWFqAsejzUoEy7xkgHQPm5fqeaSVDmMFiPyrvfeQux5WedDg1Om73v8yoO+88pNGDB
	 DL6kuwSYUQ8nzLEpdFfOT3QWJcaozgXqmkge0NCW12m+1xDKIqFvSZeqj2z0AEWSPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=j7DcKTU4;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFA606A321
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 14:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=j7DcKTU4
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c19fc50abso10295086d6.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793371024; x=1793975824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
        b=j7DcKTU4CGu/2fywHpXKP+CPwy/2IY3Erylg8cTykocuHHzU4ofjl1vHMUoIAcAqcl
         JWdxgoSwfQJfc1PznTFE61KRYj+DUzqFuBSS1hBLa7vHifd47kWsrl1XuCvCMBaVWuUV
         Ob8xR9cHpSVQ3irmX0soLlmO9sK0VfjjWrhdg4pyTS5i3PBVN7hXLJQGXGbyHeUcyRvQ
         zRYy+ZEtA0s9AtYTHxn7yAF8c9RvFI6VLnijt5g4BszNrtY8zap9VLUDFxNZPNs3TPAH
         XtMr1BdGmeEiDrNAUftw739BilYfSBihnUu40Ddyx+geSFsHzCPJEthM+70gbamFNMDT
         /IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371024; x=1793975824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBxXvBbGe44Ze49Uw14IuF3fOKhR7Jc9p6+rhpDhzQ4=;
        b=iZyjAPOF4ZrX5MAXnNV3XmxKIXos+3Mh8AQa0rXJL2LWVR7/lpg1AvML8Wdaves+WE
         Dveq66I3/gZHpkVJRHeUdOJQclB+kcsvFSRTREold4zIae4oi5BWDBfrvKPNInoHXCsr
         A15ryBqGdxmWSIu771qe8dCyQ3b+SAP4aBnq3kIjqbB6fs/7ZHTHkSn+hw3Q9+eoCmdl
         kzOAwjherslCJY1J7C7nebpvXSz6P1XgGFQZSujgua0v6J5+0SKbXCn3cVkZLB5QhzKR
         TKv0qCVnZiz9kYyuvvwp+hkx3XYNcCoovy5vvHtOZdZIjvKT+UjLk8Ru5IOOCxfNy8Os
         n0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBy3K22TxPNQLxuYIOtrTxYscUqFjnBok5yM/qnZuc6ps20+ueSaNh11FcGi7tRIyAVh3w1diRwpfB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy+jvPke5tCzt7vNBmxXBB79V6SHXi1HDqJYJQdj+asnbYjeui
	yEu/j9acsm9bPlwXRUQlvvp+CVWzRkmMzHMS696o5MK83UCPIpbp01G4wJubfJEsQg==
X-Gm-Gg: AYBFou1vrgBAVTGnfw16yJotkkyRAe9Z+yL2y4tmKw/wgf1ZOhK7q7umCCGqtYWbMIg
	rvnpCu2n66i8YAcg9HZFVU4oh3DbB6GEDv7SCcUtLwueDjiXoQ2ln7EdQMr9KvLHodcrgBq5gIK
	saH+WJUNRNiPTtSC+/YsTfOHqjZwujte/X1JzxUdGyvNMqeyT6pS6a/31P0JfW+mKFGN9GKL7BC
	qiWB5Z4tKbPlhgXkf30qmca4FWzmiCh4k3DPIHI1mwfC0ouhdnqPZqeupjo2dgZxnu8uyR/thGr
	rnsVOlFqbJD0tSjI1ZSp8SF2g7lIS3aofqFw6ufi/A2vQteSeCwUvzP9fAHVob3ld6/+8DxY1U0
	suje7kTH36k1XThEf3v3+BiXNxdsvvQCfqxFI0DaddHGQfw8M3sSvFEIjpSc9tiME9/ZEL5qv+1
	4jjAFrimu0HSSYB2sZixjbe9KrE+Ec/BJls595lJx6Ry4P4s7PjkJf1WqZKk9U8I4/BZjbYxvlm
	35y3r1fK42Ta+njW19HpF+0ET3zKVWCvVgRcgRMhpOAd9HqSyoIdQ+M4Cls+nj+A0/gwthWXL/i
	CHfhwcLkoVxZNQma3aJ8CAMODm0jOoYSbZNiiavTSDiyg6Y81tE=
X-Received: by 2002:a05:6214:d81:b0:91b:934f:d417 with SMTP id 6a1803df08f44-91ca4b84688mr37485346d6.55.1793371023779;
        Fri, 30 Oct 2026 07:37:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca8071408sm16643346d6.40.2026.10.30.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:37:02 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:37:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Cancel BH giveback works on removal
Message-ID: <138f4b10-bb28-43e4-a131-c956f282b525@rowland.harvard.edu>
References: <20261030072129.40d0d89c.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030072129.40d0d89c.michal.pecio@gmail.com>

On Fri, Oct 30, 2026 at 07:21:29AM +0100, Michal Pecio wrote:
> Turns out, we do actually need to flush them, because workers use the
> 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> after all URBs are completed, to track pending completions and possibly
> reschedule themselves - see usb_giveback_urb_bh() implementation.
> 
> Flushing would suffice if the works don't reschedule themselves, but
> cancel_work_sync() is more robust against stray completions.
> 
> Syzbot hit this issues twice, but not reproducibly yet. I needed a 3ms
> delay in usb_giveback_urb_bh() to get reliable UAF after unbinding an
> HCD. The works run in soft IRQ, so they can be preempted by hard IRQs,
> on PREEMPT_RT, or in a VM. The latter in particular seems to offer an
> opportunity for "unlimited" delays and may have affected syzbot.
> 
> HCD unbinding can occur on hot removal of Thunderbolt peripherals like
> docks and monitors which contain xHCI controllers.
> 
> Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com/
> Fixes: 8fea0c8fda30129b ("usb: core: hcd: Convert from tasklet to BH workqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> v2:
> - changed "Fixes" as per Alan's suggestion
> - clarified the comment as per Alan's suggestion in other thread,
>   let's see if this will pacify the review bot
> - another syzbot report
> - more elaborate/plausible speculation on how syzbot hits this
> 
> v1:
> https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index ee19628cd653..88f88e7ba464 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -3053,14 +3053,13 @@ void usb_remove_hcd(struct usb_hcd *hcd)
>  	mutex_unlock(&usb_bus_idr_lock);
>  
>  	/*
> -	 * flush_work() isn't needed here because:
> -	 * - driver's disconnect() called from usb_disconnect() should
> -	 *   make sure its URBs are completed during the disconnect()
> -	 *   callback
> -	 *
> -	 * - it is too late to run complete() here since driver may have
> -	 *   been removed already now
> +	 * Hopefully no complete() callbacks are running anymore; disconnect()
> +	 * routines should have waited for them to prevent UAF of driver data.
> +	 * But we must wait for workers to finish accessing the hcd which is
> +	 * about to be freed (and shamelessly drop any remaining completions).
>  	 */
> +	cancel_work_sync(&hcd->high_prio_bh.bh);
> +	cancel_work_sync(&hcd->low_prio_bh.bh);
>  
>  	/* Prevent any more root-hub status calls from the timer.
>  	 * The HCD might still restart the timer (if a port status change
> -- 
> 2.48.1
