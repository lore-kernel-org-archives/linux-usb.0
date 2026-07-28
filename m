Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416B2D0614
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203966; cv=none; b=CwKzyrWE3YR3G8jtU02xkCJe/ABEu7bd3f8qZnGvMI4dimVt1t3tPIkKBUzZ3MRs58mk6cURL5NS8WTXsuIBAro6YBjsm/ikPBU0cNkuSzHmNtwoW2FIKjvEKlTg+wneflOTCMnP2ynkcoAeKzfowL8jhJfHw69UiEPFTyt8zK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203966; c=relaxed/simple;
	bh=CawxVQkJNWG9UC33bH4B6QtHE3fIWQSW2rF6KQwMMb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX6qqNVGjVXmsA4gDhY72IpCjWlM8+JP3jODASTXUM5MmEw4cMdWa7vDpF4xskFciqp18hO3ZLRFZjUJ3Fg87lFgVTTM6SUdYa1a5vWbFQ2PZMnGhBNE35wAzI4phLuK4oa0n67xpR+/jXrXvejTLjTKFVIwO3aLMQpQEn5a2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nj62HUlQ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nj62HUlQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90004d2f7b7so40455646d6.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785203963; x=1785808763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsIjQv5H0VfbYXJqKAEeCyOCnADFtFqc7MMDYt9Qh0Q=;
        b=nj62HUlQgh8z7YtRj9LjYQ2IGqVAX+3wuTr5HVhWuDT3J8RQ03uR18aHDmiSHZFrdH
         t6uyVfkYMh/Czg5fx0WGJertLzsbNPLaT2/bZsQKeSVyT2MFulWqnLEl/VGl44X3dqlA
         wSTgXoe+1hd+cvsdyUcQLHMarIJnX35XMi8MRn0UKyvehUJfkM+EnXifyqNTA7pAkbIL
         T1rL4whG/PkOKQCQQ0UssCifs56RwaSc0p8Vhg45bvFc9RZopFQ+lYHIMlOzjFcTjKav
         srWVa2yBqzjSJlpJ7JkI0BgdsqpxdDsQNJti23XtEr6OveOn0DvbMyAWM2txYlpfrmqU
         y1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203963; x=1785808763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsIjQv5H0VfbYXJqKAEeCyOCnADFtFqc7MMDYt9Qh0Q=;
        b=n1XeT87iz8KV6XoQk/eBSPL+XYMQgSJzttAyVMvTpoGjNuU8cM8f2u7qYh4V2ir9sc
         gLp8ycommCZMG0GPIFESFOVZboAC0Oy+71+e/cCUZ8gk+T4qBd4HFD5c3nx1Hg0JQv3m
         lJJPyo5jipIaO5yEHJOOWGIGdMsflGs37DrDMxlYEp5D0Rrdw5f69AWc69rnegAf3fV6
         9IWj/PE3sGDmAvDCQoyVquXKTlvpJ3CEA4s6XrR3ZF5+KnwjQx8aNP8w1+gqCA1AspWu
         bYSBCzprh8sJvHXvteCCK5oUSeoDVuswyrzXDClkMTu31yL2XRPl5BjSLg0Qbqw+nbjT
         7wNQ==
X-Gm-Message-State: AOJu0YySvDKf7ZlsG6XimLsJpfwaFtmnsMSwm/6zcSHFZ4W6Smvc9ito
	MbbjEPBS8CvKWCG9Gf3x4UPeZ3bSixv/WSQNfXb4Eb3l84rOq4VB7knqZOhL53QXXA==
X-Gm-Gg: AR+sD12TnYpWd1KvcodCEl4jdXUzcHbwckzlrtyfU1juvu8o3oQ6qB9Vwafc57uYUl/
	ono7LST3fwJcVJRVOKxFr2qy3CdyydPXdZFCGNPwkHZx849pr1tWyXEj44d+QJgf36dSqNfsuTI
	ex+whB5QzA1inzw4bV046L2M+qYCviPdLJGHcLF1mKNIDVdi3/ExP0ETy3jahXgJXewqGA0sPT4
	V6atpYH+rD/094I3nqaTvaJQMmDEku9o9JBf2p1zy6Mw1md8/bsBTk1/wmsRE/CjgDuejQI3s3e
	myeENPnYF6dNyHgsMqlQ5DsBoHAnFQjfWkbIFEBqFMu1460G9f/uGQwPhBWit7akK/Snx0oZlpq
	wqr3cazfG7Lk6ipnFrtNpxr7JOuA80EKIW+5lLXELhTlByiZsf4l+Nc8iftR6VgQq9c225cho1q
	5ISQM=
X-Received: by 2002:ac8:7fcd:0:b0:51a:8835:58cb with SMTP id d75a77b69052e-529d71d8c6emr3037201cf.54.1785203962951;
        Mon, 27 Jul 2026 18:59:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e85215d7sm78094896d6.9.2026.07.27.18.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:22 -0700 (PDT)
Date: Mon, 27 Jul 2026 21:59:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org, stable@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: core: Add quirk for 255-bytes initial config
 read
Message-ID: <ba2af6f4-0134-4feb-addc-24694fabeb10@rowland.harvard.edu>
References: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
 <20260727195434.14626-2-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727195434.14626-2-nikhilsolanke5@gmail.com>

On Tue, Jul 28, 2026 at 01:24:33AM +0530, Nikhil Solanke wrote:
> Certain third-party USB game controllers exposing (or spoofing) an Xbox
> 360-compatible interface (VID:PID 045e:028e) fail to enumerate under Linux.
> The device disconnects from the bus without responding to the initial
> GET_DESCRIPTOR(CONFIGURATION) request, and the kernel logs 'unable to read
> config index 0 descriptor/start: -71'.
> 
> The device then falls back to a secondary Android HID mode (with a
> different VID:PID), losing XInput functionality including rumble support.
> The failure reproduces across multiple machines, host controller types, and
> kernel versions including current mainline and LTS. The device enumerates
> correctly and remains in XInput mode under Windows. Notably, the device
> enumerates correctly in Android mode when the same 9-byte request
> is issued for that mode's configuration descriptor, confirming the firmware
> bug is specific to the XInput mode.
> 
> usbmon traces from Linux and Wireshark/USBPcap traces from Windows are
> identical up to the point of failure, with no visible protocol-level
> difference explaining the divergence. The root cause was identified when
> Michal Pecio discovered via a QEMU bus-level capture that Windows does not
> use wLength=9 for the initial config descriptor request; it uses
> wLength=255. Alan Stern subsequently confirmed this with a bus
> analyzer on a different USB 2.0 device, and Michal verified the behavior
> goes back to Windows 95 OSR2.1.
> 
> So, add a new quirk flag USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
> usb_get_configuration() to issue a 255 byte sized configuration request
> instead of USB_DT_CONFIG_SIZE (9) for the initial
> GET_DESCRIPTOR(CONFIGURATION) request, mimicking long-standing Windows
> behavior.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
> ---

Your patches basically looks fine to me.  Just a couple of things to 
note...

Personally, I prefer to see comments that don't extend beyond the 
80-column limit.  But there's no hard rule about this, it's just my own 
preference -- you don't have to change anything if you don't want to.

Also, it's odd that you add the quirk flag to the kernel without adding 
a new quirk entry for the Xbox 360-compatible devices.  That doesn't 
have to be done in this patch, though; it can be done in a follow-up.
(But note that without a followup this patch doesn't actually fix 
anything, since a true fix would require user intervention.)

Finally, a really minor nit: The two patches in this series are 
completely independent; either one can be applied without the other.  
That means they don't really belong in a series, that is, they should be 
submitted as two separate patches.  Obviously that doesn't matter at all 
in practice; it's just a matter of principle.

Anyway, for both patches 1 and 2:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

If you want to rewrite and resubmit them along the lines mentioned 
above, you can add my Acked-by to the new submissions.

Alan Stern
