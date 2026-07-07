Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A52DCC1F
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452358; cv=none; b=Ejg9PLRJOzRuC5JNXBNZ0IxyLzjjAJbkzdcvul2fokOIFPc3mH7PdHvhsUGOQvzuQvJF1G/giK0LdbAUqXjycKxbVcWJ8TPYAwvFrhw+jE37xcQpxhdHW3YkyERz3L6+sqNvQBUhJ9gMBB6adZv10zxOs+pQcG8Fk4YMW+SG3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452358; c=relaxed/simple;
	bh=br6meIDTejCAS5LCgvYSmLbyIKQyTFAf7k6qAimtwEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKgCvRK3jWtNiUPetcylTIupE7k32hx14u8XUpl5+2uaYHEEOcR20TJfcfe0s22mOotewM3AZFzJrjJ7LdMsqFuP4hluwj3ajmmq/TGWKoSzga1wjA4CYH5qHb5XFZEJ2sQycrvp675j3zZOlokedV8I4+uVTiHsfk9Q621yE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MkuEvjDj; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MkuEvjDj"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2ae81599so45504961cf.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783452356; x=1784057156; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUjdFr+AGls3h9mR63wFmE+hoA+TgrxuneBYi8xE9eI=;
        b=MkuEvjDjcqvm8I/plCEhlOGTMEEv5hymDpstgQh2kscQ8WrXhidQ2rEz+sKVfzfETq
         ZV9Gq0wmMLxThU/LXak++vIJfpiyPSNUuHmy3PyU/bHdh48OJIK63VQU0YQz2HVeSHPc
         vh9jzhPeCIA4VumrINtV4COww+h4uBN50Yc0bRHKSDIb0ONGYGOyAnq6+fdkTmhPtg5w
         o+rtoCMjg09r1qm+6bCyVhMpQLHUmXW0cJsCaM7zC2V/8eMEik9HLiZgHbRqaKEUbHbM
         37+AYqq1oyWQSCa0heLC/6qZJVNXQcptHecLLmQMIKQ84WKf53C1ghYSLaNGem1Gmp4m
         Ns0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452356; x=1784057156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PUjdFr+AGls3h9mR63wFmE+hoA+TgrxuneBYi8xE9eI=;
        b=qiM4POvvjsSdReA2wrEsYfPxFiygBt6wNOXThbWlry2/96+p/rQJvzDU7noVETS0wa
         fWXEZ/2cpIzom90gBiIxe6+2eAlYPd/FaLrTfM8vI+u23NMXXt208Hqw+29fhM2Bbjiq
         Qro75be53IUrjC5cWXitn8ht0a/M+PQeBYlsNL2eiF8xl/6iJAJ4B4n2TFva0MtxdocI
         KMcRKlJ/wW2eH7DAM8s5GNMtuegEr5vSrjJiJbNQlC+GPehsu5lXGocW/VBsbn/L+UOr
         wHWeGOXsuVpPMLCrnAU5TIGprXTN++nOjkGh7x91W/OBtcQU/ANKu0zlM1bNR5A5oxZR
         JNVw==
X-Forwarded-Encrypted: i=1; AHgh+RpcWeehJnGzuZTSp5k6+ZMDfAaecXGV4Brf0ykhDAl5DL7djLuLoN9zyqROPOTb58hXmCXzXTSzWP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysV2DGvlsYEli9MV3Q8dtjton3OvpJGvIQt0plb116chjgnb1t
	9dT7BY4mAYdG77n6qJjFF8RhwkfIe1qqmOGHkK2SEJJgO/EnBIZ2CL3YhpuniQ/Jjw==
X-Gm-Gg: AfdE7ckA7xwQ9MZKqGW2ewt4DH2hF4bABQxIfKooKQgIkLl/Ic/R+WUAmsjU1TfyPBX
	rQmi0kQjFHo5fftHkoypeRtnhlJGvw3MzdFt/Ukg4VvMmU63zs21vSHWjcg8JcoZCQcozJ8SB08
	aPGxfcyJ5IHsQv4cbBKmQ/l0CLxjje0lOnUWG2jZCKjb8tWGRv/1fJauUU3YWapXQOY7kd2Id3Z
	fS8pbA4duUDrSkERbiTX9KdwCKAQRNGlgiZyJLoqrjsQ40k0xyOTK40tk9MymyG3zAT5YTJkiw8
	z9oOVyK79edbIFNEuXjsSgj5SS+EyfeFOqOIlhJFW+A5OiFWDlKfZsEwTNW+3bFds/siHQ+phxm
	69fzvUXXBPXCKRyUVN4OARje+gAJpjx7AGkKCNoLfK4U4FureUGZeYPxVd+LhdcW5S068zD3ehn
	hHyVxDW2sVCfelP44yLZ5TEPBtVkuq/elWG/vphQdg3mvBhJE0d9K1yC2o
X-Received: by 2002:a05:622a:15c7:b0:51b:feae:3576 with SMTP id d75a77b69052e-51c747d72bbmr70138561cf.26.1783452355433;
        Tue, 07 Jul 2026 12:25:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b281c9sm121535651cf.9.2026.07.07.12.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:25:54 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:25:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michael Howard <mikehow1005@gmail.com>
Cc: mathias.nyman@intel.com, "oneukum@suse.com" <oneukum@suse.com>,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd / usbcore: ASMedia ASM1051E/1053E/1153/1153E
 (174c:55aa) SATA-USB bridge fails or takes minutes to re-enumerate after
 s2idle suspend/resume
Message-ID: <f96da524-0dce-4c3b-9e93-eb02f6cf3939@rowland.harvard.edu>
References: <CAAp0Da=70LviGBcMM1ECPVpCnU62zzXqA4qSq2NdELaxOq0nhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAp0Da=70LviGBcMM1ECPVpCnU62zzXqA4qSq2NdELaxOq0nhg@mail.gmail.com>

On Mon, Jul 06, 2026 at 04:02:54PM -0700, Michael Howard wrote:
> Device is a Silicon Power "B75 Pro" external SATA SSD (4TB), using the
> `uas` driver by default (confirmed via `lsusb -t`, `Driver=uas`).
> 
> ## Summary
> 
> After the system resumes from `s2idle` suspend, this drive frequently fails to
> re-enumerate on the first (and often several subsequent) attempts, logging
> repeated `error -62` / control-transfer timeouts. Recovery time is highly
> inconsistent — anywhere from under a minute to several minutes — and in at
> least one observed case the kernel's own port power-cycle recovery gave up
> entirely (`unable to enumerate USB device`), requiring a physical unplug/replug
> to bring the drive back. On at least one occasion, this happened while the
> drive was actively mounted (ext4), and the sudden loss of the device produced
> real filesystem-level I/O errors (journal abort, `lost sync page write`) —
> i.e. this is not merely a slow-enumeration inconvenience, it is a data-integrity
> risk for any drive of this class attached across a suspend cycle.

Have you tried connecting this device to a different computer?

> ## Ask
> 
> - Is the retry/timeout ceiling in the post-resume port-reset path
> intentionally much lower than the initial-connect path, or is this a bug?

It is intentional.  When a device resumes, it has already connected and 
been initialized so there should be less work to do.  But if something 
goes badly wrong, the kernel falls back to the same strategy as used 
during an initial connection.

> - Would a device-specific quirk entry (`USB_DEVICE(0x174c, 0x55aa)`, e.g. an
> added init/reset delay, or more patient retry count) be an appropriate fix
> for known-slow bridge chips like this one, given the existing precedent of
> similar quirks in `drivers/usb/core/quirks.c`?

No, because your device isn't just slow; it is actively malfunctioning.  
Adding a delay is not likely to help -- unless perhaps the delay was 10 
minutes long or something equally ridiculous.

> - Given the observed ext4 journal-abort fallout in Case 1, should there be
> any hardening around how abruptly a mounted block device's failure to
> reset/reconnect propagates to the filesystem layer, independent of fixing
> the USB-side timing itself?

I don't know what you're asking here.  If a reset or reconnect fails, 
what more can be done?  Not telling the filesystem layer about it isn't 
going to help anything.  Particularly if the filesystem thinks the 
resume has been successful and tries to start carrying out real I/O.

> Happy to test proposed patches/quirks against this exact hardware — the
> failure is reproducible on demand via suspend/resume with the drive attached.

Without additional information there's nothing to test.  Can you start
by providing a usbmon trace showing what happens during one of these 
failed resumes?

Alan Stern
